# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
import os
import subprocess
import pexpect
import time
from fasteners.process_lock import InterProcessLock
from pexpect import popen_spawn
from pexpect.spawnbase import SpawnBase
from pexpect.exceptions import EOF
from queue import Queue, Empty
import shlex
import signal
import random

_KILL_SIGNAL = getattr(signal, 'SIGKILL', signal.SIGTERM)
import socket
import re
import threading
import tempfile

# Conditional winpty import: enables a real Windows PTY (ConPTY/WinPTY backend)
# to replace the pipe-based PopenSpawn, eliminating the timing-sensitive
# two-step expect_exact+expect pattern that causes random failures under load.
try:
    import winpty as _winpty
    _HAS_WINPTY = True
except ImportError:
    _winpty = None
    _HAS_WINPTY = False

LOCK_DIR = os.path.join(tempfile.gettempdir(), 'socialdna')
if not os.path.exists(LOCK_DIR):
    os.makedirs(LOCK_DIR, exist_ok=True)

def get_argv():
    """
    get_argv: Get arg from sys.argv
    test_case: info file
    cmp_res: exec file after compiled
    port_num: only not cjnative need, set on env
    """
    test_case = sys.argv[1]
    cmp_res = sys.argv[2]
    run_env = sys.argv[3]
    port_num = sys.argv[4] if len(sys.argv) > 4 else None
    return test_case, cmp_res, run_env, port_num


def get_platform():
    """
    get_platform: identify run_platform, linux or windows or darwin(mac)
    """
    if 'win32' in sys.platform:
        run_platform = 'windows'
    elif 'win64' in sys.platform:
        run_platform = 'windows'
    elif 'darwin' in sys.platform:
        run_platform = 'darwin'
    else:
        run_platform = 'linux'
    return run_platform


ANDROID_DEVICE_DIR = "/data/local/tmp/run/"
ANDROID_RUNTIME_DIR = "linux_android_aarch64_cjnative"
ANDROID_RUNTIME_MARKER = ANDROID_DEVICE_DIR + ".runtime_marker"
ANDROID_RUNTIME_PUSH_LOCK_PATH = os.path.join(LOCK_DIR, 'android_runtime_push_lock')

OHOS_DEVICE_DIR = "/data/local/tmp/debugserver/"
OHOS_LLDB_PORT_START = 12000
OHOS_LLDB_PORT_END = 35000

LLDB_SERVER_PORT_START = 12000
LLDB_SERVER_PORT_END = 35000

# Timeouts: Windows/Mac defaults larger than Linux due to DLL/dylib loading
# and CPU contention under concurrency. Env vars still override on any platform.
if sys.platform == 'win32' or sys.platform == 'darwin':
    LLDB_STARTUP_TIMEOUT = int(os.environ.get('LLDB_STARTUP_TIMEOUT', 30))
    LLDB_ATTACH_TIMEOUT = int(os.environ.get('LLDB_ATTACH_TIMEOUT', 15))
    LLDB_CMD_TIMEOUT = int(os.environ.get('LLDB_CMD_TIMEOUT', 30))
else:
    LLDB_STARTUP_TIMEOUT = int(os.environ.get('LLDB_STARTUP_TIMEOUT', 10))
    LLDB_ATTACH_TIMEOUT = int(os.environ.get('LLDB_ATTACH_TIMEOUT', 5))
    LLDB_CMD_TIMEOUT = int(os.environ.get('LLDB_CMD_TIMEOUT', 10))


class WinptySpawn(SpawnBase):
    """
    WinptySpawn: pexpect-compatible spawn class for Windows backed by a real
    PTY (ConPTY/WinPTY). PTY line buffering ensures cjdb's `(cjdb) ` prompt
    (no trailing newline) is delivered promptly, unlike pipes (full buffering).
    """
    def __init__(self, cmd, timeout=30, maxread=2000, searchwindowsize=None,
                 logfile=None, cwd=None, env=None, encoding=None,
                 codec_errors='strict', dimensions=(24, 200)):
        super(WinptySpawn, self).__init__(
            timeout=timeout, maxread=maxread,
            searchwindowsize=searchwindowsize, logfile=logfile,
            encoding=encoding, codec_errors=codec_errors)

        # winpty PTY emits \r\n line endings, just like a Linux PTY
        if encoding is None:
            self.crlf = b'\r\n'
        else:
            self.crlf = '\r\n'

        # Accept either a command string or an argv list. Use posix=False so
        # Windows-style paths with backslashes are preserved.
        if isinstance(cmd, str):
            argv = shlex.split(cmd, posix=False)
        else:
            argv = list(cmd)
        if not argv:
            raise ValueError("WinptySpawn: empty command")

        # Resolve executable via PATH so 'cjdb' works without absolute path
        from shutil import which
        env_for_path = env if env is not None else os.environ
        path = env_for_path.get('PATH', os.defpath)
        appname = which(argv[0], path=path) or argv[0]
        cmdline = ' ' + subprocess.list2cmdline(argv[1:]) if len(argv) > 1 else None

        # Build env string in the null-separated form winpty expects
        if env is None:
            env_str = None
        else:
            env_str = '\0'.join('{}={}'.format(k, v) for k, v in env.items())
            if env_str:
                env_str += '\0'

        cols, rows = dimensions[1], dimensions[0]
        # timeout passed in seconds; winpty expects milliseconds
        self._pty = _winpty.PTY(cols, rows, timeout=int(self.timeout * 1000))

        spawn_ok = self._pty.spawn(appname, cmdline=cmdline, cwd=cwd, env=env_str)
        if not spawn_ok:
            raise OSError("WinptySpawn: failed to spawn '{} {}'".format(appname, cmdline or ''))

        self.pid = self._pty.pid
        self.closed = False
        self._buf = self.string_type()

        # Daemon reader thread: pull str chunks from winpty, encode to bytes,
        # push into a Queue (same pattern as PopenSpawn._read_incoming).
        self._read_queue = Queue()
        self._read_thread = threading.Thread(target=self._read_incoming)
        self._read_thread.daemon = True
        self._read_thread.start()
        self._read_reached_eof = False

    def _read_incoming(self):
        """Background thread: move PTY output to the consumer queue."""
        pty = self._pty
        while True:
            try:
                chunk = pty.read(blocking=True)
            except Exception as e:
                # Log and treat as EOF to avoid hanging the consumer
                self._log(e, 'read')
                self._read_queue.put(None)
                return

            if chunk:
                if isinstance(chunk, str):
                    chunk = chunk.encode('utf-8', 'replace')
                self._read_queue.put(chunk)

            if not pty.isalive():
                while True:
                    try:
                        tail = pty.read(blocking=False)
                    except Exception:
                        tail = ''
                    if not tail:
                        break
                    if isinstance(tail, str):
                        tail = tail.encode('utf-8', 'replace')
                    self._read_queue.put(tail)
                self._read_queue.put(None)
                return

    def read_nonblocking(self, size, timeout):
        """Required by SpawnBase.expect_loop.

        Returns at most `size` chars from the PTY within `timeout` seconds.
        Raises EOF when the child has closed the PTY. Returns '' (which the
        Expecter turns into TIMEOUT) if no data arrived in time.
        """
        buf = self._buf
        if self._read_reached_eof:
            if buf:
                self._buf = buf[size:]
                return buf[:size]
            self.flag_eof = True
            raise EOF('End Of File (EOF) in WinptySpawn.')

        if timeout == -1:
            timeout = self.timeout
        elif timeout is None:
            timeout = 1e6

        t0 = time.time()
        if not buf:
            remaining = max(0.0, timeout - (time.time() - t0))
            if remaining > 0:
                try:
                    incoming = self._read_queue.get(timeout=remaining)
                    if incoming is None:                        
                        self._read_reached_eof = True
                    elif incoming:
                        buf += self._decoder.decode(incoming, final=False)
                except Empty:
                    pass
        
        while len(buf) < size:
            try:
                extra = self._read_queue.get_nowait()
            except Empty:
                break
            if extra is None:
                self._read_reached_eof = True
                break
            buf += self._decoder.decode(extra, final=False)

        r, self._buf = buf[:size], buf[size:]
        self._log(r, 'read')
        return r

    def send(self, s):
        s = self._coerce_send_string(s)
        self._log(s, 'send')
        b = self._encoder.encode(s, final=False)
        if isinstance(b, bytes):
            b = b.decode('utf-8', 'replace')
        try:
            return self._pty.write(b)
        except Exception as e:
            self._log(e, 'send')
            return 0

    def sendline(self, s=''):
        n = self.send(s)
        return n + self.send(self.linesep)

    def wait(self):
        """Block until the spawned process exits; return exit status."""
        try:
            while self._pty.isalive():
                time.sleep(0.1)
        except Exception:
            pass
        try:
            status = self._pty.get_exitstatus()
        except Exception:
            status = None
        if status is None:
            status = 0
        self.exitstatus = status
        self.signalstatus = None
        self.terminated = True
        return status

    def kill(self, sig):
        """Terminate the process tree.

        On Windows, sig is mostly informational: we always use
        `taskkill /T /F /PID` so child processes spawned by cjdb (e.g. lldb
        helpers) are also killed, avoiding handle/port leaks between tests.
        """
        if sys.platform == 'win32':
            try:
                subprocess.run(
                    ['taskkill', '/T', '/F', '/PID', str(self.pid)],
                    capture_output=True, text=True)
            except Exception:
                pass
        else:
            try:
                os.kill(self.pid, sig)
            except Exception:
                pass

    def close(self):
        if self.closed:
            return
        try:
            self._pty.cancel_io()
        except Exception:
            pass
        self.closed = True


def make_spawn(cmd, timeout=15, maxread=200000, encoding='utf-8',
               codec_errors='replace', dimensions=(24, 200)):
    """
    make_spawn: factory for spawning cjdb/lldb.
    Linux/macOS 不调用本函数,调用方直接用 pexpect.spawnu。
    """
    if sys.platform == 'win32':
        if not _HAS_WINPTY:
            raise RuntimeError('pywinpty not installed. Run: pip install pywinpty')
        return WinptySpawn(cmd, timeout=timeout, maxread=maxread,
                           encoding=encoding, codec_errors=codec_errors,
                           dimensions=dimensions)
    if isinstance(cmd, str):
        cmd = shlex.split(cmd, posix=False)
    return pexpect.popen_spawn.PopenSpawn(
        cmd, timeout=timeout, encoding=encoding,
        maxread=maxread, codec_errors=codec_errors)


def get_android_paths():
    """
    get_android_paths: Get lldb-server and runtime paths from environment variables
    Returns: (lldb_server_path, runtime_path) or (None, None) if not found
    """
    lldb_server_path = None
    runtime_path = None
    
    ndk_home = os.environ.get('NDK_ROOT')
    if ndk_home:
        host_platform = get_platform()
        if host_platform == 'windows':
            host_tag = 'windows-x86_64'
        elif host_platform == 'darwin':
            host_tag = 'darwin-arm64'
        else:
            host_tag = 'linux-x86_64'
        
        base_path_lib64 = os.path.join(ndk_home, 'lib64', 'clang')
        base_path_lib = os.path.join(ndk_home, 'lib', 'clang')
        
        for base_path in [base_path_lib64, base_path_lib]:
            if os.path.exists(base_path):
                versions = [d for d in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, d))]
                if versions:
                    versions.sort(reverse=True)
                    for clang_version in versions:
                        lldb_server_path = os.path.join(base_path, clang_version, 'lib', 'linux', 'aarch64', 'lldb-server')
                        if os.path.exists(lldb_server_path):
                            break
                        lldb_server_path = None
                    if lldb_server_path and os.path.exists(lldb_server_path):
                        break
    
    sdk_home = os.environ.get('CANGJIE_HOME')
    if sdk_home:
        runtime_path = os.path.join(sdk_home, 'runtime', 'lib', 'linux_android_aarch64_cjnative')
    
    return lldb_server_path, runtime_path


def get_hdc_path():
    """Get hdc binary path from HDC_HOME"""
    hdc_home = os.environ.get('HDC_HOME', '')
    if hdc_home:
        return os.path.join(hdc_home, 'hdc')
    return 'hdc'


def build_hdc_cmd(*args, device_id=None):
    """
    build_hdc_cmd: Build hdc command with optional device selection
    """
    cmd = [get_hdc_path()]
    if device_id:
        cmd.extend(['-t', device_id])
    cmd.extend(args)
    return cmd


def hdc_shell(cmd, device_id=None):
    """
    hdc_shell: Execute shell command on OHOS device
    """
    result = subprocess.run(build_hdc_cmd('shell', cmd, device_id=device_id), capture_output=True, text=True)
    return result.stdout.strip(), result.returncode


def hdc_file_send(src, dst, device_id=None):
    """
    hdc_file_send: Send file to OHOS device
    """
    result = subprocess.run(build_hdc_cmd('file', 'send', src, dst, device_id=device_id), capture_output=True, text=True)
    if result.returncode != 0:
        print(f"hdc file send failed: {result.stderr}")
        return False
    return True


def get_ohos_device_id():
    """
    get_ohos_device_id: Get connected OHOS device ID from hdc list targets
    Returns: device_id or None if no device found
    """
    result = subprocess.run([get_hdc_path(), 'list', 'targets'], capture_output=True, text=True)
    lines = result.stdout.strip().split('\n')
    for line in lines:
        line = line.strip()
        if line and '[' not in line:
            return line
    return None


def get_ohos_lldb_server_path(preferred_arch=None):
    """
    get_ohos_lldb_server_path: Get lldb-server path from DEVECO_HOME
    preferred_arch: 'x86_64-linux-ohos' (simulator) or 'aarch64-linux-ohos' (device),
                    None to auto-detect (x86_64 first)
    Returns: lldb_server_path or None if not found
    """
    deveco_home = os.environ.get('DEVECO_HOME')
    if not deveco_home:
        return None
    archs = []
    if preferred_arch:
        archs.append(preferred_arch)
    for arch in ['x86_64-linux-ohos', 'aarch64-linux-ohos']:
        if arch not in archs:
            archs.append(arch)
    for arch in archs:
        lldb_server_path = os.path.join(deveco_home, 'sdk', 'default', 'hms', 'native', 'lldb', arch, 'lldb-server')
        if os.path.exists(lldb_server_path):
            print(f"Found lldb-server for {arch}: {lldb_server_path}")
            return lldb_server_path
    return None


def parse_exec_output_file(test_case):
    """
    parse_exec_output_file: Parse EXEC command from .info file to get -o output file
    Returns: output file name or None
    """
    with open(test_case, 'r', encoding='UTF-8') as f:
        for line in f:
            if line.strip().startswith('// EXEC:'):
                match = re.search(r'-o\s+(\S+)', line)
                if match:
                    output_file = match.group(1)
                    output_file = re.sub(r'%cmp_output', '', output_file)
                    return output_file
    return None


def build_adb_cmd(*args, device_id=None):
    """
    build_adb_cmd: Build adb command with optional device selection
    """
    cmd = ['adb']
    if device_id:
        cmd.extend(['-s', device_id])
    cmd.extend(args)
    return cmd


def adb_push(src, dst, device_id=None):
    """
    adb_push: Push file to Android device
    """
    result = subprocess.run(build_adb_cmd('push', src, dst, device_id=device_id), capture_output=True, text=True)
    if result.returncode != 0:
        print(f"adb push failed: {result.stderr}")
        return False
    return True


def adb_shell(cmd, device_id=None):
    """
    adb_shell: Execute shell command on Android device
    """
    result = subprocess.run(build_adb_cmd('shell', cmd, device_id=device_id), capture_output=True, text=True)
    return result.stdout.strip(), result.returncode


def get_android_device_id():
    """
    get_android_device_id: Get connected Android device ID from adb devices
    Returns: device_id or None if no device found
    """
    result = subprocess.run(['adb', 'devices'], capture_output=True, text=True)
    lines = result.stdout.strip().split('\n')
    for line in lines[1:]:
        if 'device' in line and not 'offline' in line:
            parts = line.split()
            if len(parts) >= 2:
                return parts[0]
    return None


def setup_android_debug(device_id=None):
    """
    setup_android_debug: Setup Android remote debugging environment
    Push lldb-server and runtime libraries to device
    Note: Lock is held by caller (debugging function)
    """
    lldb_server_path, runtime_path = get_android_paths()
       
    if not lldb_server_path or not os.path.exists(lldb_server_path):
        print("Warning: lldb-server path not found or does not exist")
        return False
    
    if not runtime_path or not os.path.exists(runtime_path):
        print("Warning: runtime path not found or does not exist")
        return False
    
    runtime_push_lock = InterProcessLock(path=ANDROID_RUNTIME_PUSH_LOCK_PATH)
    runtime_push_lock.acquire(blocking=True)
    print("Acquired runtime push lock")
    
    try:
        marker_output, _ = adb_shell(f"cat {ANDROID_RUNTIME_MARKER} 2>/dev/null", device_id=device_id)
        runtime_hash = str(os.path.getmtime(runtime_path)) + "_" + str(os.path.getsize(runtime_path))
        
        lldb_server_exists, _ = adb_shell(f"test -f {ANDROID_DEVICE_DIR}lldb-server && echo 1", device_id=device_id)
        runtime_dir_exists, _ = adb_shell(f"test -d {ANDROID_DEVICE_DIR}{ANDROID_RUNTIME_DIR} && echo 1", device_id=device_id)
        
        if marker_output.strip() == runtime_hash and lldb_server_exists.strip() == "1" and runtime_dir_exists.strip() == "1":
            print("Runtime already pushed, skipping...")
        else:
            print(f"Pushing lldb-server from {lldb_server_path}...")
            if not adb_push(lldb_server_path, ANDROID_DEVICE_DIR + "lldb-server", device_id=device_id):
                return False
            
            print(f"Pushing runtime from {runtime_path}...")
            output, ret = adb_shell(f"mkdir -p {ANDROID_DEVICE_DIR}{ANDROID_RUNTIME_DIR}", device_id=device_id)
            if ret != 0:
                print(f"Failed to create directory: {output}")
                return False
            
            result = subprocess.run(build_adb_cmd('push', runtime_path + '/.', f'{ANDROID_DEVICE_DIR}{ANDROID_RUNTIME_DIR}/', device_id=device_id), 
                                  capture_output=True, text=True)
            if result.returncode != 0:
                print(f"Failed to push runtime: {result.stderr}")
                return False
            
            adb_shell(f"chmod +x {ANDROID_DEVICE_DIR}lldb-server", device_id=device_id)
            adb_shell(f"echo '{runtime_hash}' > {ANDROID_RUNTIME_MARKER}", device_id=device_id)
            print("Runtime push completed")
    finally:
        runtime_push_lock.release()
        print("Released runtime push lock")

    # Get root and disable security restrictions for debugging
    subprocess.run(build_adb_cmd('root', device_id=device_id), capture_output=True, text=True)
    subprocess.run(build_adb_cmd('wait-for-device', device_id=device_id), capture_output=True, text=True)
    time.sleep(2)
    _, ret = adb_shell("setenforce 0", device_id=device_id)
    if ret != 0:
        adb_shell("su -c setenforce 0", device_id=device_id)
    adb_shell("echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>/dev/null; true", device_id=device_id)
    
    return True


def run_android_executable(executable_name, device_id=None, unique_id=None):
    """
    run_android_executable: Run executable on Android device and return process
    Returns: (process, pid) or (None, None) on failure
    """
    base_exec_name = os.path.basename(executable_name)
    if unique_id:
        executable_name = f"{base_exec_name}_{unique_id}"
    else:
        executable_name = base_exec_name
    remote_path = ANDROID_DEVICE_DIR + executable_name

    source_path = ANDROID_DEVICE_DIR + base_exec_name
    adb_shell(f"cp {source_path} {remote_path}", device_id=device_id)
    adb_shell(f"chmod +x {remote_path}", device_id=device_id)

    cmd = f"cd {ANDROID_DEVICE_DIR} && export LD_LIBRARY_PATH={ANDROID_DEVICE_DIR}{ANDROID_RUNTIME_DIR} && ./{executable_name}"

    process = subprocess.Popen(
        build_adb_cmd('shell', cmd, device_id=device_id),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    time.sleep(2)

    # Check if process has exited with error
    if process.poll() is not None:
        stdout, stderr = process.communicate()
        print(f"Process exited with code {process.returncode}")
        if stdout:
            print(f"stdout: {stdout}")
        if stderr:
            print(f"stderr: {stderr}")

    output, _ = adb_shell(f"pidof {executable_name}", device_id=device_id)
    if output:
        pid = output.split()[0]
        print(f"Process started: {executable_name} PID={pid}")
        return process, pid

    ps_output, _ = adb_shell(f"ps -A | grep {executable_name}", device_id=device_id)
    print(f"Warning: pidof returned empty for '{executable_name}'")
    print(f"ps output: {ps_output}")

    return process, None


def check_lldb_server_running(port, device_id=None):
    """
    check_lldb_server_running: Check if lldb-server is already running on specific port
    Returns: True if running on that port, False otherwise
    """
    output, _ = adb_shell(f"pidof lldb-server", device_id=device_id)
    if output.strip():
        netstat_output, _ = adb_shell(f"netstat -tlnp 2>/dev/null | grep {port}", device_id=device_id)
        return bool(netstat_output.strip())
    return False

def start_lldb_server_on_android(port, device_id=None):
    """
    start_lldb_server_on_android: Start lldb-server on Android device on specific port
    Each session starts its own lldb-server instance for isolation
    Returns: process or None on failure
    """
    cmd = f"{ANDROID_DEVICE_DIR}lldb-server platform --listen '*:{port}'"
    process = subprocess.Popen(
        build_adb_cmd('shell', cmd, device_id=device_id),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    time.sleep(1)
    print(f"Started new lldb-server instance on port {port}")
    return process


class IOSDebugSession:
    """
    IOSDebugSession: Manages iOS simulator debugging session
    """
    def __init__(self):
        self.cjdb_proc = None
        self.ios_pid = None
        self.exec_file = None
    
    def setup(self, test_case, cmp_res):
        """
        setup: Setup iOS simulator debugging environment
        """
        self.exec_file = cmp_res
        return True
    
    def run_ios_simulator(self, exec_file):
        """
        run_ios_simulator: Build, install, launch app on iOS simulator and return (pid, app_path)
        Returns: (pid, app_path) or (None, None) on failure
        """
        cangjie_test = os.environ.get('CANGJIE_TEST')
        if not cangjie_test:
            print("Error: CANGJIE_TEST environment variable not set")
            return None, None
        
        ios_script_dir = os.path.join(cangjie_test, 'testsuites', 'HLT', 'configs', 'cjnative', 'ios')
        ios_script_path = os.path.join(ios_script_dir, 'run_ios_simulator.sh')
        
        if not os.path.exists(ios_script_path):
            print(f"iOS simulator script not found: {ios_script_path}")
            return None, None
        
        work_dir = os.path.dirname(exec_file)
        if not work_dir:
            work_dir = os.getcwd()
        
        cmd_args = [
            'python3', os.path.join(ios_script_dir, 'run_ios.py'),
            '--project-path', os.environ.get('XCODEPROJ_PATH_OF_CANGJIE_IOS_TEST', 
                                             os.path.join(ios_script_dir, 'xcode_project_of_cangjie_ios_test', 'test_cangjie_ios_175.xcodeproj')),
            '--scheme', os.environ.get('XCODE_SCHEME_OF_CANGJIE_IOS_TEST', 'test_cangjie_ios_175'),
            '--bundle-id', os.environ.get('XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST', 'cangjie.test-cangjie-ios-175'),
            '--configuration', os.environ.get('XCODE_CONFIGUARTION_OF_CANGJIE_IOS_TEST', 'Release'),
            '--device-type', 'simulator',
            '--simulator-name', os.environ.get('XCODE_SIMULATOR_NAME_OF_CANGJIE_IOS_TEST', 'iPhone 15'),
            '--os-version', os.environ.get('XCODE_OS_VERSION_OF_CANGJIE_IOS_TEST', '17.5'),
            '--launch'
        ]
        
        if os.environ.get('XCODE_SKIP_BUILD', '').lower() == 'true':
            cmd_args.append('--skip-build')
        
        result = subprocess.run(cmd_args, cwd=work_dir, capture_output=True, text=True, timeout=300)
        
        if result.returncode == 0:
            output = result.stdout.strip()
            ios_pid = None
            ios_app_path = None
            for line in output.split('\n'):
                if line.startswith('IOS_PID:'):
                    self.ios_pid = line.split(':')[1]
                    ios_pid = self.ios_pid
                elif line.startswith('IOS_APP_PATH:'):
                    ios_app_path = line.split(':', 1)[1]
            if ios_pid:
                print(f"iOS simulator process started: PID={ios_pid}, APP_PATH={ios_app_path}")
                return ios_pid, ios_app_path
        
        print(f"Failed to get iOS simulator PID: {result.stderr}")
        return None, None
    
    def cleanup(self):
        """
        cleanup: Clean up all processes
        """
        try:
            if self.cjdb_proc:
                self.cjdb_proc.terminate()
            if self.ios_pid:
                subprocess.run(['kill', self.ios_pid], capture_output=True)
                subprocess.run(['xcrun', 'simctl', 'terminate', 'booted', 
                               os.environ.get('XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST', 
                                             'cangjie.test-cangjie-ios-175')],
                              capture_output=True)
        except Exception:
            pass


class AndroidDebugSession:
    """
    AndroidDebugSession: Manages Android remote debugging session
    """
    def __init__(self):
        self.lldb_server_proc = None
        self.android_app_proc = None
        self.cjdb_proc = None
        self.android_pid = None
        self.device_id = None
        self.exec_file = None
        self.lldb_port = None
        self.lldb_port_lock = None
        self.unique_id = str(random.randint(10000, 99999))
    
    def setup(self, test_case, cmp_res):
        """
        setup: Setup Android debugging environment
        """
        self.device_id = get_android_device_id()
        if not self.device_id:
            print("No Android device found")
            return False
        
        print(f"Connected device: {self.device_id}")
        
        self.lldb_port, self.lldb_port_lock = choose_lldb_server_port()
        if not self.lldb_port:
            print("Failed to choose lldb-server port")
            return False
        print(f"Selected lldb-server port: {self.lldb_port}")
        
        if not setup_android_debug(device_id=self.device_id):
            return False
        
        exec_file = cmp_res
        self.exec_file = exec_file
        
        if not os.path.exists(exec_file):
            print(f"Executable file not found: {exec_file}")
            return False
        
        if not adb_push(exec_file, ANDROID_DEVICE_DIR, device_id=self.device_id):
            return False
        
        return True
    
    def start_app(self, exec_file):
        """
        start_app: Start the application on Android device
        """
        self.android_app_proc, self.android_pid = run_android_executable(exec_file, device_id=self.device_id, unique_id=self.unique_id)
        return self.android_pid is not None
    
    def start_lldb_server(self):
        """
        start_lldb_server: Start lldb-server on Android device
        """
        if not self.lldb_port:
            print("Error: lldb_port not set")
            return False
        self.lldb_server_proc = start_lldb_server_on_android(self.lldb_port, device_id=self.device_id)
        return True
    
    def cleanup(self):
        """
        cleanup: Clean up all processes
        Each session has its own lldb-server instance and unique process name
        """
        try:
            if self.lldb_server_proc:
                self.lldb_server_proc.terminate()
            if self.android_app_proc:
                self.android_app_proc.terminate()
            if self.cjdb_proc:
                self.cjdb_proc.terminate()
            if self.android_pid:
                adb_shell(f"kill {self.android_pid} 2>/dev/null", device_id=self.device_id)
        except Exception:
            pass
        finally:
            if self.lldb_port_lock:
                self.lldb_port_lock.release()
                print(f"Released lldb port lock for port {self.lldb_port}")


class OHOSDebugSession:
    """
    OHOSDebugSession: Manages OHOS remote debugging session
    """
    def __init__(self):
        self.lldb_server_proc = None
        self.cjdb_proc = None
        self.ohos_pid = None
        self.device_id = None
        self.bundle_name = None
        self.app_name = None
        self.project_path = None
        self.platform_sockid = None
        self.lldb_port = None
        self.lldb_port_lock = None
        self.target_arch = None
        self.lldb_arch_dir = None

    def setup(self, test_case, cmp_res):
        """
        setup: Setup OHOS debugging environment
        """
        self.device_id = get_ohos_device_id()
        if not self.device_id:
            print("No OHOS device found")
            return False

        if os.environ.get('OHOS_TARGET_ARCH'):
            self.target_arch = os.environ['OHOS_TARGET_ARCH']
        elif os.environ.get('OHOS_SIMULATOR', '').lower() in ('1', 'true', 'yes'):
            self.target_arch = 'x86_64'
        else:
            self.target_arch = 'aarch64'
        arch_map = {'x86_64': 'x86_64', 'aarch64': 'arm64-v8a'}
        self.lldb_arch_dir = arch_map.get(self.target_arch, self.target_arch)
        self._lldb_arch_tag = {'x86_64': 'x86_64-linux-ohos', 'aarch64': 'aarch64-linux-ohos'}.get(self.target_arch, self.target_arch)
        print(f"Target architecture: {self.target_arch} (lldb arch tag: {self._lldb_arch_tag}, lib dir: {self.lldb_arch_dir})")
        
        print(f"Connected device: {self.device_id}")
        
        self.bundle_name = 'com.example.myapplication'
        self.app_name = 'myapplication'
        self.project_path = os.environ.get('PROJECT_PATH', os.getcwd())
        self.platform_sockid = os.environ.get('OHOS_SOCKID', str(random.randint(100000, 999999)))
        
        return True

    def find_symbol_file(self, cmp_res):
        """
        find_symbol_file: Find the binary/.so with debug info for breakpoints.
        Search order:
          1. cmp_res itself (if it's an existing file path)
          2. lib{cmp_res}.so or {cmp_res}.so in known build output dirs
          3. First .so found in build output dirs (fallback)
        Returns: file path or None
        """
        # 1. Direct path
        if cmp_res and os.path.isfile(cmp_res):
            print(f"[SYM] Using symbol file: {cmp_res}")
            return cmp_res

        # 2. Search by name pattern in build output
        arch = self.lldb_arch_dir
        search_dirs = [
            os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates', 'libs', 'default', arch),
            os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates', 'libs', 'default', arch, 'ohos'),
            os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates', 'cangjie'),
            os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates'),
        ]

        name_patterns = [
            f'lib{cmp_res}.so',
            f'{cmp_res}.so',
            f'{cmp_res}',
        ]

        for d in search_dirs:
            if not os.path.isdir(d):
                continue
            for pattern in name_patterns:
                full = os.path.join(d, pattern)
                if os.path.isfile(full):
                    print(f"[SYM] Found symbol file by name match: {full}")
                    return full
            # Recursive search for pattern
            for root, dirs, files in os.walk(d):
                for pattern in name_patterns:
                    if pattern in files:
                        full = os.path.join(root, pattern)
                        print(f"[SYM] Found symbol file (recursive): {full}")
                        return full

        # 3. Fallback: prefer libohos*.so, then any .so in build output
        for d in search_dirs:
            if not os.path.isdir(d):
                continue
            for root, dirs, files in os.walk(d):
                for f in files:
                    if f.startswith('libohos') and f.endswith('.so'):
                        full = os.path.join(root, f)
                        print(f"[SYM] Using libohos*.so as symbol file (fallback): {full}")
                        return full

        print(f"[SYM] No symbol file found for '{cmp_res}' under {self.project_path}")
        print(f"[SYM] Searched dirs: {search_dirs}")
        return None
    
    def copy_source_file(self, test_case, cmp_res):
        """
        copy_source_file: Find ALL .cj files from info file (DEPENDENCE line),
        transform each, copy to project cangjie dir.
        If all .cj files already exist in the project (previously inserted),
        skip entirely - use existing files as-is for debugging.
        Transformations per .cj file (idx = 1, 2, ...):
          1. Replace existing package or insert 'package ohos_app_cangjie_entry' at line 9
          2. Rename 'main(' to 'func cj_main{idx}(' (numbered by file order)
          3. Remove line containing 'sleep(Duration.millisecond'
        Then insert 'cj_main{idx}()' calls into index.cj (skip existing).
        Note: Inserted files are NOT deleted after test execution (see cleanup()).
        """
        print(f"[COPY] project_path={self.project_path}", flush=True)

        dst_dir = os.path.join(self.project_path, 'entry', 'src', 'main', 'cangjie')

        # Determine .cj file name (fallback when no DEPENDENCE line)
        cj_name = cmp_res + '.cj' if not cmp_res.endswith('.cj') else cmp_res
        test_dir = os.path.dirname(os.path.abspath(test_case))

        # Find ALL .cj files from DEPENDENCE line in .info file (preserve order)
        cj_files = []  # list of (src_path, cj_name)

        with open(test_case, 'r', encoding='UTF-8') as f:
            for line in f:
                if 'DEPENDENCE:' in line:
                    deps = line.split('DEPENDENCE:')[1].strip().split()
                    for dep in deps:
                        if dep.endswith('.cj'):
                            dep_path = os.path.join(test_dir, dep) if not os.path.isabs(dep) else dep
                            dep_path = os.path.normpath(dep_path)
                            if os.path.exists(dep_path):
                                cj_files.append((dep_path, os.path.basename(dep_path)))
                    break

        # Fallback: search by name in test dir and parent dirs (single file)
        if not cj_files:
            for search_dir in [test_dir, os.path.dirname(test_dir), os.path.dirname(os.path.dirname(test_dir))]:
                candidate = os.path.join(search_dir, cj_name)
                if os.path.exists(candidate):
                    cj_files.append((candidate, cj_name))
                    break

        if not cj_files:
            print(f"[COPY] .cj file '{cj_name}' not found, skip", flush=True)
            return True

        # If all .cj files already exist in project, skip insertion entirely
        all_exist = all(os.path.exists(os.path.join(dst_dir, name)) for _, name in cj_files)
        if all_exist:
            print(f"[COPY] .cj files already in project, skip insertion (use existing)", flush=True)
            return True

        print(f"[COPY] found {len(cj_files)} .cj file(s), inserting", flush=True)

        # Dest: project cangjie dir
        os.makedirs(dst_dir, exist_ok=True)

        # Process each .cj file in order (idx starts at 1)
        for idx, (src_cj, cj_name) in enumerate(cj_files, 1):
            print(f"[COPY] source {idx}: {src_cj}", flush=True)

            # Read original file
            with open(src_cj, 'r', encoding='UTF-8') as f:
                lines = f.readlines()

            print(f"[COPY] original: {len(lines)} lines, name: {cj_name}", flush=True)

            # Step 1: Replace existing package or insert new one at line 9
            package_found = False
            for i, line in enumerate(lines):
                if line.strip().startswith('package '):
                    lines[i] = 'package ohos_app_cangjie_entry\n'
                    print(f"[COPY] replaced package at line {i+1}", flush=True)
                    package_found = True
                    break
            if not package_found and len(lines) >= 8:
                lines.insert(8, 'package ohos_app_cangjie_entry\n')
                print(f"[COPY] inserted package at line 9", flush=True)

            # Step 2: Rename main to cj_main{idx}
            for i, line in enumerate(lines):
                stripped = line.strip()
                if stripped.startswith('func main(') or stripped.startswith('func main '):
                    lines[i] = line.replace('func main(', f'func cj_main{idx}(').replace('func main ', f'func cj_main{idx} ')
                    print(f"[COPY] renamed main to cj_main{idx} at line {i+1}", flush=True)
                elif stripped.startswith('main(') or stripped.startswith('main ('):
                    lines[i] = line.replace('main(', f'cj_main{idx}(', 1).replace('main (', f'cj_main{idx} (', 1)
                    if not lines[i].strip().startswith('func '):
                        lines[i] = lines[i].replace(f'cj_main{idx}', f'func cj_main{idx}', 1)
                    print(f"[COPY] renamed main to cj_main{idx} at line {i+1}", flush=True)

            # Step 3: Remove sleep(Duration.millisecond line
            new_lines = []
            for line in lines:
                if 'sleep(Duration.millisecond' in line:
                    print(f"[COPY] removed sleep line", flush=True)
                    continue
                new_lines.append(line)
            lines = new_lines

            # Write to dest
            dst_cj = os.path.join(dst_dir, cj_name)
            with open(dst_cj, 'w', encoding='UTF-8') as f:
                f.writelines(lines)

            print(f"[COPY] transformed -> {dst_cj} ({len(lines)} lines)", flush=True)

        # Step 4: Insert cj_main{idx}() calls into index.cj (skip if already exists)
        index_cj = os.path.join(dst_dir, 'index.cj')
        if os.path.exists(index_cj):
            with open(index_cj, 'r', encoding='UTF-8') as f:
                idx_lines = f.readlines()
            inserted = 0
            for idx in range(1, len(cj_files) + 1):
                call_str = f'cj_main{idx}()'
                if any(call_str in line for line in idx_lines):
                    print(f"[COPY] {call_str} already in index.cj, skip", flush=True)
                    continue
                if len(idx_lines) < 31:
                    print(f"[COPY] index.cj too short, skip {call_str}", flush=True)
                    continue
                # Insert after last existing cj_mainN() call, or at line 32
                insert_pos = 31
                for i, line in enumerate(idx_lines):
                    if re.search(r'cj_main\d*\(\)', line):
                        insert_pos = i + 1
                idx_lines.insert(insert_pos, f'                        {call_str}\n')
                inserted += 1
            if inserted > 0:
                with open(index_cj, 'w', encoding='UTF-8') as f:
                    f.writelines(idx_lines)
                print(f"[COPY] inserted {inserted} cj_mainN() call(s) into index.cj", flush=True)

        return True

    def insert_all_source_files(self, info_folder):
        """
        insert_all_source_files: Collect all .cj files from info DEPENDENCE lines,
        insert each into a separate sub-package under entry/src/main/cangjie/test{N}/.
        Each file gets package ohos_app_cangjie_entry.test{N}, main renamed to
        public func cj_main{N}(). index.cj gets import lines + cj_mainN() calls.
        """
        import shutil

        print(f"[INSERT] project_path={self.project_path}", flush=True)
        print(f"[INSERT] scanning folder: {info_folder}", flush=True)

        dst_dir = os.path.join(self.project_path, 'entry', 'src', 'main', 'cangjie')

        # Clean up old .cj files and subdirectories
        keep_files = {'index.cj', 'ability_stage.cj', 'main_ability.cj', 'ability_mainability_entry.cj', 'module_entry_entry.cj'}
        if os.path.isdir(dst_dir):
            for f in os.listdir(dst_dir):
                full_path = os.path.join(dst_dir, f)
                if os.path.isfile(full_path) and f.endswith('.cj') and f not in keep_files:
                    os.remove(full_path)
                    print(f"[INSERT] removed old: {f}", flush=True)
                elif os.path.isdir(full_path) and re.match(r'^test\d+$', f):
                    shutil.rmtree(full_path)
                    print(f"[INSERT] removed old dir: {f}/", flush=True)
            # Clean up index.cj: remove old imports and cj_mainN() calls
            index_cj = os.path.join(dst_dir, 'index.cj')
            if os.path.exists(index_cj):
                with open(index_cj, 'r', encoding='UTF-8') as f:
                    idx_lines = f.readlines()
                new_idx = [line for line in idx_lines
                           if not re.search(r'import ohos_app_cangjie_entry\.test\d+\.\*', line)
                           and not re.search(r'cj_main\d*\(\)', line)]
                if len(new_idx) != len(idx_lines):
                    with open(index_cj, 'w', encoding='UTF-8') as f:
                        f.writelines(new_idx)
                    print(f"[INSERT] cleaned old imports and cj_mainN() from index.cj", flush=True)

        # Scan all .info files, collect unique .cj files from DEPENDENCE lines
        all_cj_files = []
        seen_names = set()

        for f in sorted(os.listdir(info_folder)):
            if not f.endswith('.info'):
                continue
            info_path = os.path.join(info_folder, f)
            test_dir = os.path.dirname(os.path.abspath(info_path))
            print(f"[INSERT] scanning: {f}", flush=True)
            with open(info_path, 'r', encoding='UTF-8') as fh:
                for line in fh:
                    if 'DEPENDENCE:' in line:
                        deps = line.split('DEPENDENCE:')[1].strip().split()
                        for dep in deps:
                            if dep.endswith('.cj'):
                                dep_path = os.path.join(test_dir, dep) if not os.path.isabs(dep) else dep
                                dep_path = os.path.normpath(dep_path)
                                if os.path.exists(dep_path):
                                    cj_name = os.path.basename(dep_path)
                                    if cj_name not in seen_names:
                                        all_cj_files.append((dep_path, cj_name))
                                        seen_names.add(cj_name)
                        break

        if not all_cj_files:
            print(f"[INSERT] No .cj files found in {info_folder}", flush=True)
            return False

        print(f"[INSERT] found {len(all_cj_files)} .cj file(s), inserting", flush=True)

        os.makedirs(dst_dir, exist_ok=True)

        # Process each .cj file into its own sub-package
        for idx, (src_cj, cj_name) in enumerate(all_cj_files, 1):
            print(f"[INSERT] source {idx}: {src_cj}", flush=True)

            with open(src_cj, 'r', encoding='UTF-8') as f:
                lines = f.readlines()

            print(f"[INSERT] original: {len(lines)} lines, name: {cj_name}", flush=True)

            # Step 1: Replace existing package or insert new one at line 9
            pkg_name = f'ohos_app_cangjie_entry.test{idx}'
            package_found = False
            for i, line in enumerate(lines):
                if line.strip().startswith('package '):
                    lines[i] = f'package {pkg_name}\n'
                    print(f"[INSERT] replaced package at line {i+1} -> {pkg_name}", flush=True)
                    package_found = True
                    break
            if not package_found and len(lines) >= 8:
                lines.insert(8, f'package {pkg_name}\n')
                print(f"[INSERT] inserted package at line 9 -> {pkg_name}", flush=True)

            # Step 2: Rename main to public func cj_main{idx}
            for i, line in enumerate(lines):
                stripped = line.strip()
                if stripped.startswith('func main(') or stripped.startswith('func main '):
                    lines[i] = line.replace('func main(', f'public func cj_main{idx}(').replace('func main ', f'public func cj_main{idx} ')
                    print(f"[INSERT] renamed main to public cj_main{idx} at line {i+1}", flush=True)
                elif stripped.startswith('main(') or stripped.startswith('main ('):
                    lines[i] = line.replace('main(', f'cj_main{idx}(', 1).replace('main (', f'cj_main{idx} (', 1)
                    if not lines[i].strip().startswith('public '):
                        lines[i] = lines[i].replace(f'cj_main{idx}', f'public func cj_main{idx}', 1)
                    print(f"[INSERT] renamed main to public cj_main{idx} at line {i+1}", flush=True)

            # Step 3: Remove sleep(Duration.millisecond line
            new_lines = []
            for line in lines:
                if 'sleep(Duration.millisecond' in line:
                    print(f"[INSERT] removed sleep line", flush=True)
                    continue
                new_lines.append(line)
            lines = new_lines

            # Write to sub-directory test{idx}/
            sub_dir = os.path.join(dst_dir, f'test{idx}')
            os.makedirs(sub_dir, exist_ok=True)
            dst_cj = os.path.join(sub_dir, cj_name)
            with open(dst_cj, 'w', encoding='UTF-8') as f:
                f.writelines(lines)
            print(f"[INSERT] transformed -> {dst_cj} ({len(lines)} lines)", flush=True)

        # Step 4: Update index.cj - insert imports and cj_mainN() calls
        index_cj = os.path.join(dst_dir, 'index.cj')
        if os.path.exists(index_cj):
            with open(index_cj, 'r', encoding='UTF-8') as f:
                idx_lines = f.readlines()

            # Insert import lines after line 17 (0-based index 17)
            num_files = len(all_cj_files)
            import_lines = [f'import ohos_app_cangjie_entry.test{idx}.*\n' for idx in range(1, num_files + 1)]
            for offset, imp_line in enumerate(import_lines):
                idx_lines.insert(17 + offset, imp_line)
            print(f"[INSERT] inserted {num_files} import line(s) into index.cj", flush=True)

            # Insert cj_mainN() calls AFTER the line containing 'this.message = "Hello Cangjie"'
            call_pos = None
            for i, line in enumerate(idx_lines):
                if 'this.message' in line and 'Hello Cangjie' in line:
                    call_pos = i + 1  # insert after this line
                    break
            if call_pos is None:
                # Fallback: find 'this.message' line
                for i, line in enumerate(idx_lines):
                    if 'this.message' in line:
                        call_pos = i + 1
                        break
            if call_pos is None:
                print(f"[INSERT] WARNING: could not find 'this.message' line, skip cj_mainN() insertion", flush=True)
            else:
                call_lines = [f'                        cj_main{idx}()\n' for idx in range(1, num_files + 1)]
                for offset, call_line in enumerate(call_lines):
                    idx_lines.insert(call_pos + offset, call_line)
                print(f"[INSERT] inserted {num_files} cj_mainN() call(s) into index.cj at line {call_pos + 1}", flush=True)

            with open(index_cj, 'w', encoding='UTF-8') as f:
                f.writelines(idx_lines)

        print(f"[INSERT] Done. {len(all_cj_files)} .cj file(s) inserted into sub-packages.", flush=True)
        return True

    def load_deveco_env(self):
        """
        load_deveco_env: Read deveco_env.txt and set environment variables
        File location: DEVECO_ENV_FILE env var or {PROJECT_PATH}/deveco_env.txt
        """
        env_file = os.environ.get('DEVECO_ENV_FILE', '')
        if not env_file:
            env_file = os.path.join(self.project_path, 'deveco_env.txt')
        if not os.path.exists(env_file):
            print(f"[BUILD] env file not found: {env_file}", flush=True)
            print(f"[BUILD] generate it in DevEco terminal: set > \"{env_file}\"", flush=True)
            return False
        with open(env_file, 'r', encoding='UTF-8', errors='replace') as f:
            for line in f:
                line = line.strip()
                if '=' in line:
                    key, val = line.split('=', 1)
                    key = key.strip()
                    val = val.strip()
                    if key and not key.startswith('='):
                        os.environ[key] = val
        print(f"[BUILD] loaded env from {env_file}", flush=True)
        return True

    def build_project(self):
        """
        build_project: Run hvigorw.bat to build HAP with debug symbols
        Step 1: Use template project (already created and signed)
        Step 2: Signing already configured in template
        Step 3: Build with hvigorw assembleHap --mode debug
        """
        # Load DevEco environment from file
        self.load_deveco_env()

        # Find hvigorw: from HVIGORW_HOME, DEVECO_HOME, or PATH
        # Find hvigorw: from HVIGORW_HOME, DEVECO_HOME, or PATH
        hvigorw = None
        hvigorw_home = ''
        # 1. HVIGORW_HOME
        hvigorw_home = os.environ.get('HVIGORW_HOME', '')
        if hvigorw_home:
            for name in ['hvigorw.bat', 'hvigorw']:
                candidate = os.path.join(hvigorw_home, name)
                if os.path.exists(candidate):
                    hvigorw = candidate
                    break
        # 2. DEVECO_HOME/tools/hvigor/bin
        if not hvigorw:
            deveco_home = os.environ.get('DEVECO_HOME', '')
            if deveco_home:
                hvigorw_home = os.path.join(deveco_home, 'tools', 'hvigor', 'bin')
                for name in ['hvigorw.bat', 'hvigorw']:
                    candidate = os.path.join(hvigorw_home, name)
                    if os.path.exists(candidate):
                        hvigorw = candidate
                        break
        # 3. PATH (fallback)
        if not hvigorw:
            import shutil
            for name in ['hvigorw.bat', 'hvigorw']:
                found = shutil.which(name)
                if found:
                    hvigorw = found
                    hvigorw_home = os.path.dirname(found)
                    break
        if not hvigorw:
            print(f"[BUILD] hvigorw not found", flush=True)
            print(f"[BUILD] skip build, assuming HAP already exists", flush=True)
            return True

        # Don't set DEVECO_SDK_HOME - let hvigorw find it like the terminal does

        # Skip build if HAP already exists
        hap_path = os.path.join(self.project_path, 'entry', 'build', 'default', 'outputs', 'default', 'entry-default-signed.hap')
        if os.path.exists(hap_path):
            print(f"[BUILD] HAP already exists, skip build", flush=True)
            return True

        build_cmd = f'cd /d "{self.project_path}" && "{hvigorw}" assembleHap --mode module -p product=default -p buildMode=debug --no-daemon'
        print(f"[BUILD] cmd: {build_cmd}", flush=True)
        ret = os.system(build_cmd)
        print(f"[BUILD] rc={ret}", flush=True)
        if ret != 0:
            print(f"[BUILD] build failed", flush=True)
            return False

        # Verify build output
        hap_path = os.path.join(self.project_path, 'entry', 'build', 'default', 'outputs', 'default', 'entry-default-signed.hap')
        so_dir = os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates', 'libs', 'default', self.lldb_arch_dir)
        if os.path.exists(hap_path):
            print(f"[BUILD] HAP: {hap_path} OK", flush=True)
        else:
            print(f"[BUILD] HAP not found after build!", flush=True)
            return False
        if os.path.isdir(so_dir):
            so_files = [f for f in os.listdir(so_dir) if f.endswith('.so')]
            print(f"[BUILD] .so files: {so_files}", flush=True)
        else:
            print(f"[BUILD] .so dir not found: {so_dir}", flush=True)

        return True

    def kill_residual_process(self):
        """
        kill_residual_process: Kill residual process before starting
        """
        hdc_shell(f"aa force-stop {self.bundle_name}", device_id=self.device_id)
        print(f"Killed residual process: {self.bundle_name}")
        time.sleep(1)
        return True
    
    def copy_prebuilt_files(self):
        """
        copy_prebuilt_files: Copy pre-built HAP and .so from aaa_ohos_hap folder
        to project build output directories. Creates dirs if missing.
        """
        import shutil

        hap_src_dir = os.path.join(os.getcwd(), 'aaa_ohos_hap')
        if not os.path.isdir(hap_src_dir):
            return True

        # Copy HAP -> entry/build/default/outputs/default/
        hap_src = os.path.join(hap_src_dir, 'entry-default-signed.hap')
        hap_dst_dir = os.path.join(self.project_path, 'entry', 'build', 'default', 'outputs', 'default')
        hap_dst = os.path.join(hap_dst_dir, 'entry-default-signed.hap')
        if os.path.exists(hap_src):
            os.makedirs(hap_dst_dir, exist_ok=True)
            shutil.copy2(hap_src, hap_dst)
            print(f"[COPY] HAP -> {hap_dst}", flush=True)

        # Copy .so -> entry/build/default/intermediates/libs/default/{arch}/
        so_src = os.path.join(hap_src_dir, 'libohos_app_cangjie_entry.so')
        so_dst_dir = os.path.join(self.project_path, 'entry', 'build', 'default', 'intermediates', 'libs', 'default', self.lldb_arch_dir)
        so_dst = os.path.join(so_dst_dir, 'libohos_app_cangjie_entry.so')
        if os.path.exists(so_src):
            os.makedirs(so_dst_dir, exist_ok=True)
            shutil.copy2(so_src, so_dst)
            print(f"[COPY] .so -> {so_dst}", flush=True)

        return True

    def install_and_start_app(self):
        """
        install_and_start_app: Install HAP and start application with aa start
        """
        hap_path = os.path.join(self.project_path, 'entry', 'build', 'default', 'outputs', 'default', 'entry-default-signed.hap')
        print(f"[STEP] HAP path: {hap_path}", flush=True)
        print(f"[STEP] HAP exists: {os.path.exists(hap_path)}", flush=True)

        if not os.path.exists(hap_path):
            print(f"HAP file not found: {hap_path}", flush=True)
            print(f"PROJECT_PATH={self.project_path}", flush=True)
            return False

        print("[STEP] sending HAP to device...", flush=True)
        if not hdc_file_send(hap_path, '/data/local/tmp/entry-default-signed.hap', device_id=self.device_id):
            print(f"ERROR: hdc file send failed", flush=True)
            return False

        print("[STEP] installing HAP...", flush=True)
        install_out, install_ret = hdc_shell('bm install -p /data/local/tmp/entry-default-signed.hap', device_id=self.device_id)
        print(f"bm install rc={install_ret}, out={install_out.strip()[:100]}", flush=True)
        hdc_shell('rm -rf /data/local/tmp/entry-default-signed.hap', device_id=self.device_id)

        print("[STEP] starting application (aa start)...", flush=True)
        start_out, start_ret = hdc_shell(f'aa start -a EntryAbility -b {self.bundle_name} -m entry', device_id=self.device_id)
        print(f"aa start rc={start_ret}, out={start_out.strip()[:100]}", flush=True)

        time.sleep(2)
        return True
    
    def simulate_click(self, x=None, y=None):
        """
        simulate_click: Use uitest click to tap screen center
        """
        if x is None and y is None:
            import re
            # Try multiple commands to get screen resolution
            w, h = None, None
            for cmd in ['hidumper -s WindowManagerService -a "-a"', 'uitest dumpLayout']:
                out, _ = hdc_shell(cmd, device_id=self.device_id)
                # Try [x y w h] format: [0 0 1260 2720]
                m = re.search(r'\[\s*\d+\s+\d+\s+(\d{3,4})\s+(\d{3,4})\s*\]', out)
                if m:
                    w, h = int(m.group(1)), int(m.group(2))
                    print(f"[CLICK] resolution from '{cmd[:20]}': {w}x{h}", flush=True)
                    break
            if w and h:
                x, y = w // 2, h // 2
                print(f"[CLICK] click center ({x},{y})", flush=True)
            else:
                x = int(os.environ.get('OHOS_CLICK_X', '630'))
                y = int(os.environ.get('OHOS_CLICK_Y', '1360'))
                print(f"[CLICK] resolution unknown, use default ({x},{y})", flush=True)
        else:
            x = x or int(os.environ.get('OHOS_CLICK_X', '630'))
            y = y or int(os.environ.get('OHOS_CLICK_Y', '1360'))
        click_cmd = f'uitest uiInput click {x} {y}'
        print(f"[CLICK] {click_cmd}", flush=True)
        out, ret = hdc_shell(click_cmd, device_id=self.device_id)
        print(f"[CLICK] rc={ret}, out={out.strip()[:100]}", flush=True)
        time.sleep(1)
        return ret == 0
    
    def setup_lldb_server(self):
        """
        setup_lldb_server: Push lldb-server and set permissions
        """
        lldb_server_path = get_ohos_lldb_server_path(preferred_arch=self._lldb_arch_tag)
        if not lldb_server_path:
            print("Warning: lldb-server path not found, check DEVECO_HOME")
            return False

        remote_path = f"{OHOS_DEVICE_DIR}{self.bundle_name}/lldb-server"

        print(f"Setting up lldb-server directory...")
        # Combine mkdir + chmod + setenforce + ptrace_scope into one hdc shell call
        setup_cmd = (
            f"mkdir -p {OHOS_DEVICE_DIR}{self.bundle_name} && "
            f"chmod 757 {OHOS_DEVICE_DIR}{self.bundle_name} && "
            f"setenforce 0 2>/dev/null || su -c setenforce 0 2>/dev/null; "
            f"echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>/dev/null; true"
        )
        hdc_shell(setup_cmd, device_id=self.device_id)

        print(f"Pushing lldb-server from {lldb_server_path} -> {remote_path}")
        if not hdc_file_send(lldb_server_path, remote_path, device_id=self.device_id):
            return False

        hdc_shell(f"chmod 757 {remote_path}", device_id=self.device_id)

        self._lldb_server_remote_path = remote_path

        self.lldb_port, self.lldb_port_lock = choose_lldb_server_port()
        if not self.lldb_port:
            print("Failed to choose lldb-server port")
            return False
        print(f"Selected lldb-server port: {self.lldb_port}")

        return True
    
    def get_pid_from_simulator(self, max_retries=8, interval=0.5):
        """
        get_pid_from_simulator: Get process PID from running simulator
        Retries with polling because the app may take a few seconds to start.
        Tries multiple process name patterns (app name and bundle name).
        """
        patterns = [self.app_name, self.bundle_name, self.bundle_name.split('.')[-1]]
        seen_patterns = []
        for p in patterns:
            if p and p not in seen_patterns:
                seen_patterns.append(p)

        for attempt in range(1, max_retries + 1):
            for pat in seen_patterns:
                output, _ = hdc_shell(f"pgrep -f {pat}", device_id=self.device_id)
                if output and output.strip():
                    self.ohos_pid = output.strip().split('\n')[0].strip()
                    print(f"Process found on simulator: {pat} PID={self.ohos_pid} (attempt {attempt})")
                    return self.ohos_pid
            print(f"Waiting for app process (attempt {attempt}/{max_retries})...")
            time.sleep(interval)

        ps_out, _ = hdc_shell("ps -A", device_id=self.device_id)
        matching = [l for l in ps_out.split('\n') if self.app_name in l or self.bundle_name in l]
        if matching:
            parts = matching[0].split()
            if len(parts) >= 2:
                self.ohos_pid = parts[1]
                print(f"Process found via ps fallback: PID={self.ohos_pid}")
                return self.ohos_pid

        print(f"Warning: No PID found for {self.app_name}/{self.bundle_name} after {max_retries} retries")
        return None
    
    def start_lldb_server(self):
        """
        start_lldb_server: Start lldb-server directly on device (unix-abstract, /// fix applied)
        """
        lldb_remote = getattr(self, '_lldb_server_remote_path',
                              f"{OHOS_DEVICE_DIR}{self.bundle_name}/lldb-server")
        cmd = (f"{lldb_remote} platform "
               f"--listen unix-abstract:///{self.bundle_name}/platform-{self.platform_sockid}.sock "
               f"--log-file {OHOS_DEVICE_DIR}{self.bundle_name}/platform.log")

        self.lldb_server_proc = subprocess.Popen(
            build_hdc_cmd('shell', cmd, device_id=self.device_id),
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            text=True
        )

        time.sleep(1)

        if self.lldb_server_proc.poll() is not None:
            print(f"ERROR: lldb-server exited with code {self.lldb_server_proc.returncode}")
            return False

        running, _ = hdc_shell("pgrep -f lldb-server", device_id=self.device_id)
        if not running.strip():
            print("ERROR: lldb-server is not running on device.")
            return False

        print(f"Started lldb-server: platform-{self.platform_sockid}.sock")
        return True
    
    def attach_debug_permission(self):
        """
        attach_debug_permission: Configure debug permission using aa attach
        """
        out, ret = hdc_shell(f"aa attach -b {self.bundle_name}", device_id=self.device_id)
        print(f"aa attach -b {self.bundle_name} -> rc={ret}, out={out.strip() or '(empty)'}")
        if ret != 0:
            print("[WARN] aa attach failed, trying with su ...")
            out2, ret2 = hdc_shell(f"su -c 'aa attach -b {self.bundle_name}'", device_id=self.device_id)
            print(f"su aa attach -> rc={ret2}, out={out2.strip() or '(empty)'}")
        print(f"Attached debug permission for {self.bundle_name}")
        return True
    
    def cleanup(self):
        """
        cleanup: Clean up processes (lldb-server, cjdb, app on device).
        Note: Inserted .cj files and index.cj cj_mainN() calls are NOT deleted
        after test execution (per requirement).
        """
        try:
            if self.lldb_server_proc:
                self.lldb_server_proc.terminate()
            if self.cjdb_proc:
                self.cjdb_proc.terminate()
            # Kill app on device
            if self.device_id and self.bundle_name:
                hdc_shell(f"aa force-stop {self.bundle_name}", device_id=self.device_id)
                print(f"[CLEANUP] killed app: {self.bundle_name}", flush=True)
        except Exception:
            pass
        finally:
            if self.lldb_port_lock:
                self.lldb_port_lock.release()
                print(f"Released lldb port lock for port {self.lldb_port}")


def read_execline(test_case):
    """
    read_execline: read *.info(exec command) line by line
    """
    f_e = open(test_case, encoding='UTF-8')
    lines_e = f_e.readlines()
    # find 'test#', split exec-cmd and debug-cmd
    test_index = lines_e.index("test#\n")
    lines_e = lines_e[test_index + 1:]
    if "run_stdx" in lines_e:
        os.environ["DYLD_LIBRARY_PATH"] = os.getenv("DYLD_LIBRARY_PATH")
    else:
        pass
    return f_e, lines_e


def split_cmd(line_e, run_env):
    """
    split_cmd: based on first 'special symbol' to split command
    firstcmd: description and run_env
    doline: debug command
    result: expect result
    """
    symbol = None
    for char in line_e:
        if not char.isalpha() and not char.isdigit() and char != " ":
            symbol = char
            break
    if symbol is None:
        return line_e.replace("\n", ""), "", ""
    firstcmd = line_e.split(symbol)[0]
    doline = line_e.split(symbol)[1]
    result = symbol.join(line_e.split(symbol)[2:]).replace("\n", "")
    if "android_aarch64" in run_env and "cjdb" in firstcmd:
        doline = "cjdb"
    if "ohos_aarch64" in run_env and "cjdb" in firstcmd:
        doline = "cjdb"
    if ("cjnative" in run_env and "android_aarch64" not in run_env and "ios_simulator" not in run_env and "ohos_aarch64" not in run_env and 'AOT' in firstcmd) or ("cjti" in run_env and 'CJVM' in firstcmd) or (
            'AOT' not in firstcmd and 'CJVM' not in firstcmd and 'Android' not in firstcmd and not (
                ("android_aarch64" in run_env or "ios_simulator" in run_env or "ohos_aarch64" in run_env) and firstcmd.strip() == "r")) or (
            "android_aarch64" in run_env and 'Android' in firstcmd):
        print("__________________________")
        print("|" + firstcmd + "|")
        print("|" + doline + "|")
        print("|" + result + "|")
        print("__________________________")
    return firstcmd, doline, result


class check_free_port(object):
    """
    check_free_port: Check the port is open (cross-platform)
    """

    def __init__(self, start, stop):
        self.port = None
        self.sock = socket.socket()
        port_list = list(range(start, stop))
        random.shuffle(port_list)
        for port in port_list:
            try:
                self.sock.bind(('127.0.0.1', port))
                self.port = port
                break
            except Exception:
                continue

    def release(self):
        if self.port is not None:
            self.sock.close()


class choose_free_port(object):
    def __init__(self, start, stop):  # port choose range
        self.lock = None
        self.bind = None
        self.port = None
        while self.port == None:
            bind = check_free_port(start, stop)
            if bind.port is None:
                bind.release()
                continue
            lock = InterProcessLock(path=os.path.join(LOCK_DIR, 'port_{}.lock'.format(bind.port)))  # Lock the Port
            success = lock.acquire(blocking=False)
            if success:
                self.lock = lock
                self.port = bind.port
                bind.release()
                break
            bind.release()
        print("")
        print("----CHOOSE CJVM-PORT: {}----".format(self.port))

    def release(self):
        self.lock.release()


def choose_lldb_server_port():
    """
    Choose a free port for lldb-server
    Returns: (port_string, lock_object) or (None, None) on failure
    """
    for _ in range(50):
        bind = check_free_port(LLDB_SERVER_PORT_START, LLDB_SERVER_PORT_END)
        if bind.port is None:
            bind.release()
            time.sleep(0.1 + random.random() * 0.2)
            continue
        lock = InterProcessLock(path=os.path.join(LOCK_DIR, 'lldb_port_{}.lock'.format(bind.port)))
        success = lock.acquire(blocking=False)
        if success:
            port = bind.port
            bind.release()
            return str(port), lock
        else:
            bind.release()
            time.sleep(0.05 + random.random() * 0.1)
    return None, None


def send_and_expect(process, cmd, timeout=None):
    """
    send_and_expect: Send command to cjdb, consume command echo, then wait for prompt.
    Returns the command output (between echo and prompt).
    """
    if timeout is None:
        timeout = LLDB_CMD_TIMEOUT
    process.sendline(cmd)
    process.expect_exact(cmd, timeout=5)
    process.expect(['\\(cjdb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=timeout)
    return process.before


def send_and_expect_lldb(process, cmd, timeout=None):
    """
    send_and_expect_lldb: Send command to lldb, wait for echo and prompt.
    Returns the command output.
    """
    if timeout is None:
        timeout = LLDB_CMD_TIMEOUT
    process.sendline(cmd)
    process.expect([re.escape(cmd.strip()), pexpect.EOF, pexpect.TIMEOUT], timeout=5)
    process.expect(['\\(lldb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=timeout)
    return process.before


def _safe_wait(process, drain_timeout=3):
    """Drain PTY output then wait() to avoid macOS PTY deadlock.

    On macOS, ptyprocess.wait() can block forever if the PTY has unread
    output even after the child has exited. Drain remaining output first,
    force-kill if the process is still alive, then wait().
    """
    try:
        process.expect([pexpect.EOF, pexpect.TIMEOUT], timeout=drain_timeout)
    except Exception:
        pass
    try:
        if process.isalive():
            process.kill(_KILL_SIGNAL)
            try:
                process.expect([pexpect.EOF, pexpect.TIMEOUT], timeout=drain_timeout)
            except Exception:
                pass
    except Exception:
        pass
    try:
        process.wait()
    except Exception:
        pass


def on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num, android_session=None, process=None, ohos_session=None):
    """
    launch_debug method: based on different run_platform & run_env
    """
    p = None
    ohos_clicked = False
    for line_e in lines_e:
        firstcmd, doline, result = split_cmd(line_e, run_env)
        # 'cjdb' in firstcmd: lanunch cjdb - start debugging
        if "cjdb" in firstcmd:
            if process is not None:
                continue
            if run_platform == 'windows':
                if "ohos_aarch64" in run_env:
                    process = make_spawn(doline.strip(), timeout=15, maxread=200000)
                    process.expect(['target create[\\s\\S]*\\(cjdb\\)', '\\(cjdb\\)',
                                   pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)
                elif "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        continue
                    process = make_spawn(doline.strip(), timeout=15,
                                         maxread=30000)
                    process.expect(['target create[\\s\\S]*\\(cjdb\\)',
                                   pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)
                    if sys.platform == 'win32':
                        process.sendline('settings set symbols.enable-external-lookup false')
                        process.expect(['\\(cjdb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_CMD_TIMEOUT)
                elif "cjti" in run_env:
                    pass
            elif run_platform == 'darwin' or run_platform == 'linux':
                if "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        continue
                elif "cjti" in run_env:
                    if 'AOT' in firstcmd:
                        continue
                    elif 'CJVM' in firstcmd:
                        freeport = choose_free_port(start=3001, stop=20000)
                        port_num = freeport.port
                        if "javaCallcj" not in test_case:
                            p = subprocess.Popen('cj ' + cmp_res + '.cbc', executable=None,
                                                 shell=True,
                                                 preexec_fn=os.setsid
                                                 )
                        else:
                            p = subprocess.Popen(cmp_res + '.cbc -classpath . Main',
                                                 executable=None,
                                                 shell=True,
                                                 preexec_fn=os.setsid
                                                 )
                        time.sleep(2)
                process = pexpect.spawnu(doline, timeout=15, maxread=200000)
                process.expect(['target create[\\s\\S]*\\(cjdb\\)', '\\(cjdb\\)',
                               pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)
            result = '[\\s\\S]*' + result + '[\\s\\S]*'

            # OHOS: send setup commands after starting cjdb
            if "ohos_aarch64" in run_env and ohos_session:
                print("[STEP] platform select remote-ohos", flush=True)
                send_and_expect(process, 'platform select remote-ohos')
                # print(f"[STEP] settings set target.default-arch {ohos_session.target_arch}", flush=True)
                # send_and_expect(process, f'settings set target.default-arch {ohos_session.target_arch}')

                print(f"[STEP] platform connect unix-abstract-connect://{ohos_session.device_id}/{ohos_session.bundle_name}/platform-{ohos_session.platform_sockid}.sock", flush=True)
                alive, _ = hdc_shell("pgrep -f lldb-server", device_id=ohos_session.device_id)
                print(f"[STEP] lldb-server alive: {bool(alive.strip())}", flush=True)
                if not alive.strip():
                    print("[ERROR] lldb-server not running before platform connect!", flush=True)
                connect_url = f'unix-abstract-connect://{ohos_session.device_id}/{ohos_session.bundle_name}/platform-{ohos_session.platform_sockid}.sock'
                pc_out = send_and_expect(process, f'platform connect {connect_url}')
                if pc_out and 'error' in pc_out.lower():
                    print(f"[WARN] platform connect: {pc_out.strip()[:200]}", flush=True)

                arch_lib_dir = ohos_session.lldb_arch_dir
                base = os.path.join(ohos_session.project_path, 'entry', 'build', 'default', 'intermediates')
                search_paths = [
                    os.path.join(base, 'libs', 'default', arch_lib_dir),
                ]
                for path in search_paths:
                    if os.path.isdir(path):
                        print(f"[STEP] exec-search-paths += {path}", flush=True)
                        send_and_expect(process, f'settings append target.exec-search-paths {path}')

                print("[STEP] process handle -s false SIGSEGV", flush=True)
                send_and_expect(process, 'process handle -s false SIGSEGV', timeout=5)
                print("[STEP] settings set auto-confirm true", flush=True)
                send_and_expect(process, 'settings set auto-confirm true', timeout=5)
                print("[STEP] settings set symbols.debug-info-symlink-paths /proc/self/cwd", flush=True)
                send_and_expect(process, 'settings set symbols.debug-info-symlink-paths /proc/self/cwd', timeout=5)

                if ohos_session.ohos_pid:
                    print(f"[STEP] attach {ohos_session.ohos_pid}", flush=True)
                    attach_out = send_and_expect(process, f'attach {ohos_session.ohos_pid}', timeout=LLDB_ATTACH_TIMEOUT)
                    print(f"[STEP] attach result: {attach_out.strip()[:200] or '(ok)'}", flush=True)

                    # Wait for "Executable module" (library loading complete)
                    if 'Executable module' not in attach_out:
                        print("[STEP] waiting for Executable module...", flush=True)
                        process.expect(['Executable module', pexpect.TIMEOUT], timeout=20)
                        process.expect(['\\(cjdb\\)', pexpect.TIMEOUT], timeout=10)
                    print("[STEP] library loading complete", flush=True)

            continue

        # stop cjdb process using quit-cmd
        elif "quit" in firstcmd or "q" in firstcmd or "exit" in firstcmd:
            process.sendline(doline)
            process.expect(['proc', pexpect.EOF, pexpect.TIMEOUT], timeout=5)
            try:
                process.sendline("y")
            except OSError:
                pass
            _safe_wait(process)
            break

        # AOT-cmd only run on cjnative (non-Android/iOS/OHOS) backend
        elif "AOT" in firstcmd and ("android_aarch64" in run_env or "ios_simulator" in run_env or "ohos_aarch64" in run_env):
            continue

        # CJVM-cmd only run on cjti-backend
        elif "CJVM" in firstcmd and "cjti" not in run_env:
            continue

        # Android-cmd: android_aarch64 executes normally, ios_simulator executes doline
        elif "Android" in firstcmd:
            if "android_aarch64" in run_env:
                dotest(process, doline, result, f_e, run_env, run_platform, p)
            elif "ios_simulator" in run_env and doline.strip():
                print(f"[iOS Debug] Executing Android line: doline={doline}, result={result}")
                dotest(process, doline, result, f_e, run_env, run_platform, p)
            elif "ohos_aarch64" in run_env and doline.strip():
                print(f"[OHOS] Executing Android line: doline={doline}, result={result}")
                if doline.strip() in ('c', 'continue'):
                    c_timeout = int(os.environ.get('OHOS_CLICK_TIMEOUT', '30'))
                    process.sendline(doline)
                    time.sleep(1)
                    if ohos_session and not ohos_clicked:
                        print("[CLICK] clicking now...", flush=True)
                        ohos_session.simulate_click()
                        ohos_clicked = True
                    expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*\\(cjdb\\)'
                    index = process.expect([expected_pattern, pexpect.TIMEOUT], timeout=c_timeout)
                    indextest(process, doline, index, f_e, run_env, run_platform, p)
                else:
                    dotest(process, doline, result, f_e, run_env, run_platform, p)
            continue

        # Skip 'r' (run) command for Android/iOS/OHOS: process is already attached, use 'c' instead
        elif ("android_aarch64" in run_env or "ios_simulator" in run_env or "ohos_aarch64" in run_env) and (firstcmd.strip() == "r" or firstcmd.strip() == "rerun"):
            continue

        # Android remote debugging
        elif "android_aarch64" in run_env and "cjdb" not in firstcmd:
            if android_session is None:
                print("Error: Android session not initialized")
                raise DebugTestFailed("Android session not initialized")
            dotest(process, doline, result, f_e, run_env, run_platform, p)

        # iOS simulator debugging
        elif "ios_simulator" in run_env and "cjdb" not in firstcmd:
            dotest(process, doline, result, f_e, run_env, run_platform, p)

        # OHOS remote debugging
        elif "ohos_aarch64" in run_env and "cjdb" not in firstcmd:
            cmd = firstcmd.strip()
            if cmd in ('b', 'break', 'breakpoint', '_breakpoint-set'):
                bp_out = send_and_expect(process, doline)
                print(f"[BP] b output: {bp_out.strip()[:200]}", flush=True)
                if 'pending' in bp_out.lower() or 'no locations' in bp_out.lower():
                    print(f"[OHOS] breakpoint NOT resolved (pending)", flush=True)
                    raise DebugTestFailed("Breakpoint not resolved: " + doline)
                else:
                    print(f"[OHOS] breakpoint set OK", flush=True)
            elif cmd in ('c', 'continue', 'r', 'run'):
                c_timeout = int(os.environ.get('OHOS_CLICK_TIMEOUT', '30'))

                # Send c once (from test case)
                process.sendline(doline)
                time.sleep(1)

                # Click to trigger breakpoint
                if ohos_session and not ohos_clicked:
                    print("[CLICK] clicking now...", flush=True)
                    ohos_session.simulate_click()
                    ohos_clicked = True

                # Wait for breakpoint hit using result as expected pattern
                expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*\\(cjdb\\)'
                index = process.expect([expected_pattern, pexpect.TIMEOUT], timeout=c_timeout)
                indextest(process, doline, index, f_e, run_env, run_platform, p)
            else:
                dotest(process, doline, result, f_e, run_env, run_platform, p)

        # CJVM need 'process connect' command to connect server
        elif "process" in firstcmd and "CJVM" in firstcmd:
            # cjnative: linux-x86-64, linux-aarch64, windows-x86-64
            if "cjnative" in run_env:
                continue
            # cjti: linux-x86-64
            elif "cjti" in run_env:
                if doline.endswith(":"):
                    doline += str(port_num)
                if result.endswith(":"):
                    result += str(port_num)
                dotest(process, doline, result, f_e, run_env, run_platform, p)

        # corner case: rerun command
        elif "rerun" in firstcmd:
            if "cjnative" in run_env:
                process.sendline(doline)
                # Input 'n' after rerun to cancel
                if result == "n":
                    process.sendline(result)
                else:
                    dotest(process, "y", result, f_e, run_env, run_platform)
            # rerun not support on cjti
            elif "cjti" in run_env:
                continue

        else:
            dotest(process, doline, result, f_e, run_env, run_platform, p)

    # Auto quit cjdb process using command "quit"
    if not ("quit" in firstcmd or "q" in firstcmd or "exit" in firstcmd):
        process.sendline("q")
        process.expect(['proc', pexpect.EOF, pexpect.TIMEOUT], timeout=5)
        try:
            process.sendline("y")
        except OSError:
            pass
        _safe_wait(process)

    return process, p


def dotest(process, doline, result, f_e, run_env, run_platform, p=None):
    """
    dotest: send debug command and match expected result
    """
    if run_platform == 'windows':
        result = result.replace(r'(\r|\n|\r\n)', r'[\s\S]*?')
        result = result.replace(r'(\r\n|\r|\n)', r'[\s\S]*?')
        result = re.sub(r'[^\x00-\x7F]+', lambda m: r'[\s\S]*?', result)

    process.sendline(doline)
    
    if "ios_simulator" in run_env:
        process.expect([re.escape(doline.strip()), pexpect.EOF, pexpect.TIMEOUT], timeout=5)
        
        if doline.strip() in ['c', 'continue']:
            expected_pattern = '[\\s\\S]*' + result + '[\\s\\S]*stopped'
        else:
            expected_pattern = '[\\s\\S]*' + result + '[\\s\\S]*'
        
        index = process.expect([expected_pattern, pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_CMD_TIMEOUT)
        
        if index == 0:
            process.expect(['\\(lldb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=3)

    else:
        expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*\\(cjdb\\)'
        index = process.expect([expected_pattern, pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_CMD_TIMEOUT)
    
    indextest(process, doline, index, f_e, run_env, run_platform, p)
    return


class DebugTestFailed(Exception):
    """
    DebugTestFailed: Exception raised when debug test fails
    """
    pass


def indextest(process, doline, index, f_e, run_env, run_platform, p):
    """
    index: pass testcase or report error info 
    """
    if index == 0:
        pass
    else:
        error_log = str(process.before.strip()).replace('\\r', '').replace('\\n', r'\n')
        print("--------------------------")
        print("\033[31mFail: \033[0m")
        print("ERROR: " + doline)
        try:
            sys.stdout.buffer.write(("RECEIVED: " + error_log + "\n").encode('utf-8', 'replace'))
            sys.stdout.flush()
        except Exception:
            print("RECEIVED: <unprintable>")
        print("--------------------------")
        if p:
            clean_process(p, run_platform)

        process.sendline("q")
        process.sendline("y")
        _safe_wait(process)
        f_e.close()

        raise DebugTestFailed("Debug command failed: " + doline)
    return


def clean_process(p, run_platform='linux'):
    """
    clean_process: kill cjti on pid to ensure next textcase can run.
    On Windows, p.terminate() only kills the immediate child; cjti/cjdb may
    spawn helper processes that survive and leak handles/ports into the next
    test. Use taskkill /T /F /PID to take down the whole tree.
    Linux/Mac behaviour is unchanged (killpg on the session id).
    """
    try:
        if run_platform == 'windows':
            try:
                subprocess.run(
                    ['taskkill', '/T', '/F', '/PID', str(p.pid)],
                    capture_output=True, text=True)
            except (FileNotFoundError, subprocess.SubprocessError):
                # taskkill missing or failed; fall back to terminate()
                p.terminate()
        else:
            os.killpg(os.getpgid(p.pid), signal.SIGTERM)
    except (ProcessLookupError, OSError):
        pass


def debugging():
    """
    start debugging: compare actual_result and expect_result 
    """
    test_case, cmp_res, run_env, port_num = get_argv()
    run_platform = get_platform()
    f_e, lines_e = read_execline(test_case)

    android_session = None
    ios_session = None
    ohos_session = None
    process = None
    p = None
    test_failed = False

    try:
        if "ios_simulator" in run_env:
            ios_session = IOSDebugSession()

            if not ios_session.setup(test_case, cmp_res):
                print("Failed to setup iOS simulator debug environment")
                return False

            if run_platform == 'darwin':
                process = pexpect.popen_spawn.PopenSpawn(['xcrun', 'lldb'], timeout=LLDB_STARTUP_TIMEOUT,
                                                         encoding='utf-8',
                                                         maxread=200000,
                                                         codec_errors='replace'
                                                         )
            else:
                process = pexpect.spawnu('xcrun lldb', timeout=LLDB_STARTUP_TIMEOUT, maxread=200000)
            process.expect(['\\(lldb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)

            cangjie_home = os.environ.get('CANGJIE_HOME')
            cjdb_script_path = os.path.join(cangjie_home, 'tools', 'script', 'cangjie_cjdb.py')
            send_and_expect_lldb(process, f'command script import {cjdb_script_path}')

            ios_pid, ios_app_path = ios_session.run_ios_simulator(ios_session.exec_file)
            if not ios_pid:
                print("Failed to get iOS simulator process PID")
                ios_session.cleanup()
                return False

            send_and_expect_lldb(process, f'attach {ios_pid}', timeout=LLDB_ATTACH_TIMEOUT)

        elif "android_aarch64" in run_env:
            android_session = AndroidDebugSession()
            if not android_session.setup(test_case, cmp_res):
                print("Failed to setup Android debug environment")
                return False

            android_session.start_lldb_server()

            subprocess.run(build_adb_cmd('forward', f'tcp:{android_session.lldb_port}', f'tcp:{android_session.lldb_port}', device_id=android_session.device_id),
                          capture_output=True)

            time.sleep(2)

            os.environ['ANDROID_SERIAL'] = android_session.device_id

            if run_platform == 'windows':
                process = pexpect.popen_spawn.PopenSpawn(['cjdb'], timeout=LLDB_STARTUP_TIMEOUT,
                                                         encoding='utf-8',
                                                         maxread=200000,
                                                         codec_errors='replace'
                                                         )
            else:
                process = pexpect.spawnu('cjdb', timeout=LLDB_STARTUP_TIMEOUT, maxread=200000)
            process.expect(['\\(cjdb\\)', pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)
            send_and_expect(process, 'platform select remote-android')
            send_and_expect(process, 'settings set target.default-arch aarch64')
            send_and_expect(process, f'file {cmp_res}')
            send_and_expect(process, f'platform connect connect://localhost:{android_session.lldb_port}')

            if not android_session.start_app(android_session.exec_file):
                print("Failed to start application on Android")
                android_session.cleanup()
                return False

            if android_session and android_session.android_pid:
                send_and_expect(process, f'attach {android_session.android_pid}', timeout=LLDB_ATTACH_TIMEOUT)

        elif "ohos_aarch64" in run_env:
            ohos_session = OHOSDebugSession()
            if not ohos_session.setup(test_case, cmp_res):
                print("Failed to setup OHOS debug environment")
                return False
            
            # print("[STEP] copy source file", flush=True)
            # ohos_session.copy_source_file(test_case, cmp_res)

            # print("[STEP] build project (hvigorw assembleHap)", flush=True)
            # if not ohos_session.build_project():
            #     print("Failed to build project")
            #     ohos_session.cleanup()
            #     return False

            print("[STEP] copy prebuilt HAP and .so", flush=True)
            ohos_session.copy_prebuilt_files()

            print("[STEP] kill residual process", flush=True)
            ohos_session.kill_residual_process()

            print("[STEP] install HAP", flush=True)
            if not ohos_session.install_and_start_app():
                print("Failed to install HAP")
                ohos_session.cleanup()
                return False
            
            print("[STEP] setup lldb-server (push + chmod)", flush=True)
            if not ohos_session.setup_lldb_server():
                print("Failed to setup lldb-server")
                ohos_session.cleanup()
                return False

            print("[STEP] get PID", flush=True)
            ohos_session.get_pid_from_simulator()
            if not ohos_session.ohos_pid:
                print("Failed to get application PID")
                ohos_session.cleanup()
                return False

            print("[STEP] start lldb-server (direct)", flush=True)
            if not ohos_session.start_lldb_server():
                print("Failed to start lldb-server")
                ohos_session.cleanup()
                return False

            print("[STEP] aa attach (debug permission)", flush=True)
            ohos_session.attach_debug_permission()

            print("[STEP] entering on_debugging()", flush=True)

        process, p = on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num, android_session, process, ohos_session)

        if p:
            clean_process(p, run_platform)

        if android_session:
            android_session.cleanup()
            android_session = None

        if ios_session:
            ios_session.cleanup()
            ios_session = None

        if ohos_session:
            ohos_session.cleanup()
            ohos_session = None

        f_e.close()
        try:
            process.kill(_KILL_SIGNAL)
        except Exception:
            pass
    except Exception as e:
        print(f"Test failed: {e}")
        if android_session:
            android_session.cleanup()
            android_session = None
        if ios_session:
            ios_session.cleanup()
            ios_session = None
        if ohos_session:
            ohos_session.cleanup()
            ohos_session = None
        if process:
            try:
                process.kill(_KILL_SIGNAL)
            except Exception:
                pass
        if f_e:
            f_e.close()
        test_failed = True
    finally:
        if android_session:
            try:
                android_session.cleanup()
            except Exception:
                pass
        if ios_session:
            try:
                ios_session.cleanup()
            except Exception:
                pass
        if ohos_session:
            try:
                ohos_session.cleanup()
            except Exception:
                pass
        if process:
            try:
                process.kill(_KILL_SIGNAL)
            except Exception:
                pass
        if f_e:
            try:
                f_e.close()
            except Exception:
                pass

    return not test_failed


def insert_ohos_source():
    """
    insert_ohos_source: Scan folder for all .info files, collect all .cj files
    from their DEPENDENCE lines, insert all into project template at once.
    Usage: python cjdb_test.py --insert <info_folder>
    Does NOT build, install, or start debugging.
    """
    info_folder = sys.argv[2]

    session = OHOSDebugSession()
    session.project_path = os.environ.get('PROJECT_PATH', os.getcwd())

    print(f"[INSERT] project_path={session.project_path}")
    print(f"[INSERT] info_folder={info_folder}")
    session.insert_all_source_files(info_folder)
    print(f"[INSERT] Done. Run hvigorw assembleHap manually, then execute test cases.")
    os._exit(0)


def debugging_with_retry():
    """Windows/Mac: retry 2 times (3 total). Linux: run once, no retry.
    ohos_aarch64: never retry (build/install/click flow is stateful)."""
    if sys.platform == 'win32' and not _HAS_WINPTY:
        print('ERROR: pywinpty not installed. Run: pip install pywinpty')
        os._exit(1)
    run_env = sys.argv[3] if len(sys.argv) > 3 else ''
    if "ohos_aarch64" in run_env:
        max_attempts = 1
    else:
        max_attempts = 3 if sys.platform in ('win32', 'darwin') else 1
    for attempt in range(1, max_attempts + 1):
        try:
            ok = debugging()
        except Exception as e:
            print(f"attempt {attempt} crashed: {e}")
            ok = False
        if ok:
            os._exit(0)
        if attempt < max_attempts:
            time.sleep(2)
    os._exit(1)


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == '--insert':
        insert_ohos_source()
    else:
        debugging_with_retry()
