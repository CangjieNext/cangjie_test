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
import signal
import random
import socket
import re
import threading
import tempfile

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

LLDB_SERVER_PORT_START = 12000
LLDB_SERVER_PORT_END = 35000

LLDB_STARTUP_TIMEOUT = int(os.environ.get('LLDB_STARTUP_TIMEOUT', 60))
LLDB_ATTACH_TIMEOUT = int(os.environ.get('LLDB_ATTACH_TIMEOUT', 15))
LLDB_CMD_TIMEOUT = int(os.environ.get('LLDB_CMD_TIMEOUT', 60))
LLDB_ECHO_TIMEOUT = int(os.environ.get('LLDB_ECHO_TIMEOUT', 10))
LLDB_QUIT_TIMEOUT = int(os.environ.get('LLDB_QUIT_TIMEOUT', 8))


class CaseResources:
    """Own per-test resources and release them in reverse acquisition order."""
    def __init__(self):
        self.items = []

    def add(self, resource):
        if resource is not None and resource not in self.items:
            self.items.append(resource)
        return resource

    def cleanup(self):
        errors = []
        for resource in reversed(self.items):
            try:
                cleanup = getattr(resource, 'cleanup', None)
                if cleanup:
                    cleanup()
                elif callable(resource):
                    resource()
            except Exception as exc:
                errors.append(str(exc))
        self.items[:] = []
        return errors


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
    firstcmd = line_e.split(symbol)[0].strip()
    doline = line_e.split(symbol)[1].strip()
    result = symbol.join(line_e.split(symbol)[2:]).replace("\n", "").strip()
    if "android_aarch64" in run_env and "cjdb" in firstcmd:
        doline = "cjdb"
    if ("cjnative" in run_env and "android_aarch64" not in run_env and "ios_simulator" not in run_env and 'AOT' in firstcmd) or ("cjti" in run_env and 'CJVM' in firstcmd) or (
            'AOT' not in firstcmd and 'CJVM' not in firstcmd and 'Android' not in firstcmd and 'cjdb' not in firstcmd and not (
                ("android_aarch64" in run_env or "ios_simulator" in run_env) and firstcmd.strip() == "r")) or (
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
        if self.sock is not None:
            self.sock.close()
            self.sock = None


class choose_free_port(object):
    def __init__(self, start, stop):  # port choose range
        self.lock = None
        self.port = None
        for _ in range(max(1, stop - start)):
            bind = check_free_port(start, stop)
            if bind.port is None:
                bind.release()
                continue
            lock = InterProcessLock(path=os.path.join(LOCK_DIR, 'port_{}.lock'.format(bind.port)))
            success = lock.acquire(blocking=False)
            if success:
                self.lock = lock
                self.port = bind.port
                bind.release()
                break
            bind.release()
        if self.port is None:
            raise RuntimeError('No free port available in range {}-{}'.format(start, stop - 1))
        print("")
        print("----CHOOSE CJVM-PORT: {}----".format(self.port))

    def release(self):
        if self.lock is not None:
            self.lock.release()
            self.lock = None


def choose_lldb_server_port():
    """
    Choose a free port for lldb-server
    Returns: (port_string, lock_object) or (None, None) on failure
    """
    for _ in range(10):
        bind = check_free_port(LLDB_SERVER_PORT_START, LLDB_SERVER_PORT_END)
        if bind.port is None:
            bind.release()
            continue
        lock = InterProcessLock(path=os.path.join(LOCK_DIR, 'lldb_port_{}.lock'.format(bind.port)))
        success = lock.acquire(blocking=False)
        if success:
            port = bind.port
            bind.release()
            return str(port), lock
        else:
            bind.release()
    return None, None


def wait_for_prompt(process, prompt='cjdb', timeout=None):
    """Wait until the debugger is ready for the next command."""
    if timeout is None:
        timeout = LLDB_CMD_TIMEOUT
    pattern = '\\(lldb\\)' if prompt == 'lldb' else '\\(cjdb\\)'
    return process.expect([pattern, pexpect.EOF, pexpect.TIMEOUT], timeout=timeout)


def expect_initial_prompt(process, prompt='cjdb'):
    index = wait_for_prompt(process, prompt=prompt, timeout=LLDB_STARTUP_TIMEOUT)
    if index == 1:
        raise DebugTestFailed('{} exited before initial prompt'.format(prompt.upper()))
    if index == 2:
        raise DebugTestFailed('{} initial prompt timed out'.format(prompt.upper()))


def command_output(process, cmd, prompt='cjdb', timeout=None):
    """Send one command and return only the output before its next prompt."""
    if timeout is None:
        timeout = LLDB_CMD_TIMEOUT
    process.sendline(cmd)
    prompt_pattern = '\\(lldb\\)' if prompt == 'lldb' else '\\(cjdb\\)'
    patterns = [prompt_pattern, pexpect.EOF, pexpect.TIMEOUT]
    if not isinstance(process, popen_spawn.PopenSpawn):
        patterns.insert(0, re.escape(cmd.strip()))
    index = process.expect(patterns, timeout=timeout)
    if isinstance(process, popen_spawn.PopenSpawn):
        prompt_index, eof_index, timeout_index = 0, 1, 2
    else:
        prompt_index, eof_index, timeout_index = 1, 2, 3
        if index == 0:
            index = process.expect(
                [prompt_pattern, pexpect.EOF, pexpect.TIMEOUT],
                timeout=timeout
            )
            prompt_index, eof_index, timeout_index = 0, 1, 2
    output = process.before or ''
    if index == eof_index:
        raise DebugTestFailed(
            'Debugger exited while running {}. Received: {}'.format(
                cmd, summarize_output(output)
            )
        )
    if index == timeout_index:
        raise DebugTestFailed(
            'Debugger command timed out: {}. Received: {}'.format(
                cmd, summarize_output(output)
            )
        )
    if index != prompt_index:
        raise DebugTestFailed('Unexpected debugger state while running ' + cmd)
    return output


def summarize_output(output, limit=4000):
    output = str(output).replace('\r', '')
    if len(output) > limit:
        return '...<{} characters omitted>...{}'.format(
            len(output) - limit, output[-limit:]
        )
    return output


def send_and_expect(process, cmd, timeout=None):
    """Send a cjdb command and return its prompt-delimited output."""
    return command_output(process, cmd, timeout=timeout)


def send_and_expect_lldb(process, cmd, timeout=None):
    """Send an lldb command and return its prompt-delimited output."""
    return command_output(process, cmd, prompt='lldb', timeout=timeout)


def debugger_is_alive(process):
    if process is None:
        return False
    proc = getattr(process, 'proc', None)
    if proc is not None:
        return proc.poll() is None
    try:
        return process.isalive()
    except (AttributeError, OSError, pexpect.ExceptionPexpect):
        return False


def quit_debugger(process, prompt='cjdb'):
    """Request debugger exit; forced termination is left to final cleanup."""
    if not debugger_is_alive(process):
        return
    try:
        process.sendline('q')
        index = process.expect(
            [r'(?i)(?:quit|terminate|process).*\?',
             '\\(lldb\\)' if prompt == 'lldb' else '\\(cjdb\\)',
             pexpect.EOF, pexpect.TIMEOUT],
            timeout=LLDB_QUIT_TIMEOUT
        )
        if index == 0:
            process.sendline('y')
            process.expect([pexpect.EOF, pexpect.TIMEOUT],
                           timeout=LLDB_QUIT_TIMEOUT)
    except (OSError, pexpect.ExceptionPexpect):
        pass


def cleanup_debugger(process, prompt='cjdb'):
    if process is None:
        return
    quit_debugger(process, prompt=prompt)
    if not debugger_is_alive(process):
        # pexpect.isalive() already performs a non-blocking waitpid and records
        # the exit status. Calling spawn.wait() here can block indefinitely on
        # macOS while the debugger is in its final exit transition.
        return
    try:
        proc = getattr(process, 'proc', None)
        if proc is not None:
            proc.terminate()
            try:
                proc.wait(timeout=LLDB_QUIT_TIMEOUT)
            except subprocess.TimeoutExpired:
                proc.kill()
                proc.wait(timeout=LLDB_QUIT_TIMEOUT)
        else:
            # terminate(force=True) polls and reaps a pexpect.spawn child.
            process.terminate(force=True)
    except (AttributeError, OSError, pexpect.ExceptionPexpect,
            subprocess.TimeoutExpired):
        try:
            process.kill(signal.SIGKILL)
        except (AttributeError, OSError, pexpect.ExceptionPexpect):
            pass


def cleanup_subprocess(process, run_platform='linux'):
    if process is None:
        return
    if process.poll() is not None:
        process.wait()
        return
    try:
        if run_platform == 'windows':
            process.terminate()
        else:
            os.killpg(os.getpgid(process.pid), signal.SIGTERM)
        process.wait(timeout=LLDB_QUIT_TIMEOUT)
    except (ProcessLookupError, OSError, subprocess.TimeoutExpired):
        try:
            if run_platform == 'windows':
                process.kill()
            else:
                os.killpg(os.getpgid(process.pid), signal.SIGKILL)
            process.wait(timeout=LLDB_QUIT_TIMEOUT)
        except (ProcessLookupError, OSError, subprocess.TimeoutExpired):
            pass


def debugger_environment():
    """Build the debugger environment from the active Cangjie SDK."""
    environment = os.environ.copy()
    sdk_home = environment.get('CANGJIE_HOME')
    if not sdk_home:
        return environment
    library_paths = [
        os.path.join(sdk_home, 'third_party', 'llvm', 'lib'),
        os.path.join(sdk_home, 'tools', 'lib'),
    ]
    existing = environment.get('DYLD_LIBRARY_PATH', '')
    if existing:
        library_paths.append(existing)
    environment['DYLD_LIBRARY_PATH'] = os.pathsep.join(
        path for path in library_paths if path
    )
    return environment


def is_quit_command(firstcmd):
    tokens = firstcmd.strip().lower().split()
    return bool(tokens) and tokens[-1] in ('q', 'quit', 'exit')


def on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num, android_session=None, process=None,
                 resources=None):
    """
    launch_debug method: based on different run_platform & run_env
    """
    p = None
    last_firstcmd = ''
    own_resources = resources is None or isinstance(resources, list)
    if resources is None:
        resources = CaseResources()
    elif isinstance(resources, list):
        registry = CaseResources()
        for resource in resources:
            registry.add(resource)
        resources = registry
    for line_e in lines_e:
        firstcmd, doline, result = split_cmd(line_e, run_env)
        last_firstcmd = firstcmd
        # 'cjdb' in firstcmd: lanunch cjdb - start debugging
        if "cjdb" in firstcmd:
            if process is not None:
                continue
            skip_launch = False
            if run_platform == 'windows':
                if "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        skip_launch = True
                    else:
                        process = pexpect.popen_spawn.PopenSpawn(
                            ["cmd", "/c", doline],
                            timeout=LLDB_STARTUP_TIMEOUT,
                            encoding='utf-8', maxread=200000,
                            codec_errors='replace', env=debugger_environment()
                        )
                elif "cjti" in run_env:
                    skip_launch = True
            elif run_platform == 'darwin' or run_platform == 'linux':
                if "cjnative" in run_env and 'CJVM' in firstcmd:
                    skip_launch = True
                elif "cjti" in run_env and 'AOT' in firstcmd:
                    skip_launch = True
                else:
                    if "cjti" in run_env and 'CJVM' in firstcmd:
                        freeport = choose_free_port(start=3001, stop=20000)
                        resources.add(freeport)
                        port_num = freeport.port
                        if "javaCallcj" not in test_case:
                            p = subprocess.Popen(
                                'cj ' + cmp_res + '.cbc', shell=True,
                                start_new_session=True
                            )
                        else:
                            p = subprocess.Popen(
                                cmp_res + '.cbc -classpath . Main', shell=True,
                                start_new_session=True
                            )
                        resources.add(
                            lambda proc=p: cleanup_subprocess(proc, run_platform)
                        )
                        time.sleep(2)
                    process = pexpect.spawnu(
                        doline, timeout=LLDB_STARTUP_TIMEOUT, maxread=200000,
                        env=debugger_environment()
                    )
            if skip_launch:
                continue
            if process is None:
                raise DebugTestFailed(
                    "Debugger is not supported for {} on {}".format(
                        run_env, run_platform
                    )
                )
            resources.add(lambda proc=process: cleanup_debugger(proc))
            expect_initial_prompt(process)
            # cjdb emits asynchronous symbol-loading output after its first
            # prompt. Give it a short settling window before sending commands,
            # otherwise the first command can be consumed during startup.
            time.sleep(1)
            continue

        # stop cjdb process using quit-cmd
        elif is_quit_command(firstcmd):
            if process is None:
                raise DebugTestFailed('No debugger process for quit command')
            quit_debugger(
                process, prompt='lldb' if "ios_simulator" in run_env else 'cjdb'
            )
            break

        # AOT-cmd only run on cjnative (non-Android/iOS) backend
        elif "AOT" in firstcmd and ("android_aarch64" in run_env or "ios_simulator" in run_env):
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
            continue

        # Skip 'r' (run) command for Android/iOS: process is already attached, use 'c' instead
        elif ("android_aarch64" in run_env or "ios_simulator" in run_env) and (firstcmd.strip() == "r" or firstcmd.strip() == "rerun"):
            continue

        # Android remote debugging
        elif "android_aarch64" in run_env and "cjdb" not in firstcmd:
            if android_session is None:
                raise DebugTestFailed("Android session not initialized")
            dotest(process, doline, result, f_e, run_env, run_platform, p)

        # iOS simulator debugging
        elif "ios_simulator" in run_env and "cjdb" not in firstcmd:
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
                # Input 'n' after rerun to cancel.
                if result == "n":
                    command_output(process, result)
                else:
                    dotest(process, "y", result, f_e, run_env, run_platform)
            # rerun not support on cjti
            elif "cjti" in run_env:
                continue

        else:
            dotest(process, doline, result, f_e, run_env, run_platform, p)

    if process is not None and not is_quit_command(last_firstcmd):
        quit_debugger(
            process, prompt='lldb' if "ios_simulator" in run_env else 'cjdb'
        )

    if own_resources:
        errors = resources.cleanup()
        if errors:
            raise DebugTestFailed('Cleanup failed: ' + '; '.join(errors))
    return process, p


def dotest(process, doline, result, f_e, run_env, run_platform, p=None):
    """Run one debugger command and verify the expected output appears."""
    del f_e, run_platform, p
    prompt = 'lldb' if "ios_simulator" in run_env else 'cjdb'
    prompt_pattern = '\\(lldb\\)' if prompt == 'lldb' else '\\(cjdb\\)'
    expected = result
    if "ios_simulator" in run_env and doline.strip() in ['c', 'continue']:
        expected = '[\\s\\S]*' + result + '[\\s\\S]*stopped'
    try:
        re.compile(expected)
    except re.error as exc:
        raise DebugTestFailed(
            'Invalid expected pattern for {}: {}'.format(doline, exc)
        )

    process.sendline(doline)
    patterns = [expected, pexpect.EOF, pexpect.TIMEOUT]
    if not isinstance(process, popen_spawn.PopenSpawn):
        patterns.insert(0, re.escape(doline.strip()))
    index = process.expect(patterns, timeout=LLDB_CMD_TIMEOUT)
    if not isinstance(process, popen_spawn.PopenSpawn) and index == 0:
        index = process.expect(
            [expected, pexpect.EOF, pexpect.TIMEOUT],
            timeout=LLDB_CMD_TIMEOUT
        )
    if index == 0:
        prompt_index = process.expect(
            [prompt_pattern, pexpect.EOF, pexpect.TIMEOUT],
            timeout=LLDB_CMD_TIMEOUT
        )
        if prompt_index == 0:
            return
        index = prompt_index + 1

    output = summarize_output(process.before or '')
    reason = 'exited' if index == 1 else 'timed out'
    print("--------------------------")
    print("\033[31mFail: \033[0m")
    print("ERROR: " + doline)
    print("EXPECTED: " + result)
    print("RECEIVED: " + output)
    print("--------------------------")
    raise DebugTestFailed(
        "Debug command {} while waiting for result: {}".format(reason, doline)
    )


class DebugTestFailed(Exception):
    """
    DebugTestFailed: Exception raised when debug test fails
    """
    pass


def clean_process(p, run_platform='linux'):
    """Terminate and reap a cjti debuggee."""
    cleanup_subprocess(p, run_platform)


def debugging():
    """Start debugging and return a framework-compatible exit status."""
    test_case, cmp_res, run_env, port_num = get_argv()
    run_platform = get_platform()
    f_e, lines_e = read_execline(test_case)
    resources = CaseResources()
    android_session = None
    ios_session = None
    process = None
    p = None
    status = 1
    try:
        if "ios_simulator" in run_env:
            ios_session = resources.add(IOSDebugSession())
            if not ios_session.setup(test_case, cmp_res):
                raise DebugTestFailed("Failed to setup iOS simulator debug environment")
            if run_platform == 'darwin':
                process = pexpect.popen_spawn.PopenSpawn(
                    'xcrun lldb', timeout=LLDB_STARTUP_TIMEOUT,
                    encoding='utf-8', maxread=200000, codec_errors='replace',
                    env=debugger_environment()
                )
            else:
                process = pexpect.spawnu(
                    'xcrun lldb', timeout=LLDB_STARTUP_TIMEOUT, maxread=200000,
                    env=debugger_environment()
                )
            resources.add(lambda proc=process: cleanup_debugger(proc, prompt='lldb'))
            expect_initial_prompt(process, prompt='lldb')
            cangjie_home = os.environ.get('CANGJIE_HOME')
            cjdb_script_path = os.path.join(cangjie_home, 'tools', 'script', 'cangjie_cjdb.py')
            send_and_expect_lldb(process, 'command script import ' + cjdb_script_path)
            ios_pid, _ = ios_session.run_ios_simulator(ios_session.exec_file)
            if not ios_pid:
                raise DebugTestFailed("Failed to get iOS simulator process PID")
            send_and_expect_lldb(process, 'attach ' + ios_pid, timeout=LLDB_ATTACH_TIMEOUT)
        elif "android_aarch64" in run_env:
            android_session = resources.add(AndroidDebugSession())
            if not android_session.setup(test_case, cmp_res):
                raise DebugTestFailed("Failed to setup Android debug environment")
            android_session.start_lldb_server()
            subprocess.run(build_adb_cmd(
                'forward', 'tcp:{}'.format(android_session.lldb_port),
                'tcp:{}'.format(android_session.lldb_port),
                device_id=android_session.device_id
            ), capture_output=True)
            os.environ['ANDROID_SERIAL'] = android_session.device_id
            if run_platform == 'windows':
                process = pexpect.popen_spawn.PopenSpawn(
                    'cjdb', timeout=LLDB_STARTUP_TIMEOUT, encoding='utf-8',
                    maxread=200000, codec_errors='replace',
                    env=debugger_environment()
                )
            else:
                process = pexpect.spawnu(
                    'cjdb', timeout=LLDB_STARTUP_TIMEOUT, maxread=200000,
                    env=debugger_environment()
                )
            resources.add(lambda proc=process: cleanup_debugger(proc))
            expect_initial_prompt(process)
            send_and_expect(process, 'platform select remote-android')
            send_and_expect(process, 'settings set target.default-arch aarch64')
            send_and_expect(process, 'file ' + cmp_res)
            send_and_expect(process, 'platform connect connect://localhost:{}'.format(android_session.lldb_port))
            if not android_session.start_app(android_session.exec_file):
                raise DebugTestFailed("Failed to start application on Android")
            if android_session.android_pid:
                send_and_expect(process, 'attach ' + android_session.android_pid, timeout=LLDB_ATTACH_TIMEOUT)
        process, p = on_debugging(
            f_e, lines_e, test_case, cmp_res, run_platform, run_env,
            port_num, android_session, process, resources
        )
        status = 0
    except Exception as exc:
        print("Test failed: {}".format(exc))
    finally:
        f_e.close()
        for error in resources.cleanup():
            print("Cleanup warning: {}".format(error))
    return status


if __name__ == "__main__":
    sys.exit(debugging())
