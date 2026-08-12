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


def ensure_windows_dll_path():
    """
    On Windows, cjdb.exe / liblldb.dll depends on python311.dll, but the
    system may have a different Python version.  Search common locations
    (Android NDK, Python 3.11 installs) and prepend the directory to PATH.
    Also ensures cangjie tools\\bin is on PATH for LLVM/LLDB runtime DLLs.
    """
    if sys.platform != 'win32':
        return

    extra_paths = []

    cangjie_home = os.environ.get('CANGJIE_HOME', '')
    if cangjie_home:
        tools_bin = os.path.join(cangjie_home, 'tools', 'bin')
        if os.path.isdir(tools_bin):
            extra_paths.append(tools_bin)

    # Recursively walk well-known roots looking for python311.dll that is
    # accompanied by a Lib\ directory (a complete embeddable Python tree).
    search_roots = []
    ndk_root = os.environ.get('NDK_ROOT', '')
    if ndk_root:
        search_roots.append(ndk_root)

    local_appdata = os.environ.get('LOCALAPPDATA', '')
    search_roots.extend([
        os.path.join(local_appdata, 'Android', 'Sdk', 'ndk'),
        os.path.join(os.environ.get('PROGRAMFILES', ''), 'Android', 'Android Studio',
                     'plugins', 'android-ndk'),
        os.path.join(local_appdata, 'Programs', 'Python', 'Python311'),
        r'C:\Python311',
    ])

    for root in search_roots:
        if not os.path.isdir(root):
            continue
        for dirpath, dirnames, filenames in os.walk(root):
            if 'python311.dll' in filenames:
                # Prefer a directory that also contains Lib\ (full Python)
                if os.path.isdir(os.path.join(dirpath, 'Lib')):
                    extra_paths.append(dirpath)
                    break
                # Otherwise accept bare DLL directory as fallback
                elif dirpath not in extra_paths:
                    extra_paths.append(dirpath)

    if extra_paths:
        existing = os.environ.get('PATH', '')
        os.environ['PATH'] = ';'.join(extra_paths) + ';' + existing


ANDROID_DEVICE_DIR = "/data/local/tmp/run/"
ANDROID_RUNTIME_DIR = "linux_android_aarch64_cjnative"
ANDROID_RUNTIME_MARKER = ANDROID_DEVICE_DIR + ".runtime_marker"
ANDROID_RUNTIME_PUSH_LOCK_PATH = os.path.join(LOCK_DIR, 'android_runtime_push_lock')

LLDB_SERVER_PORT_START = 12000
LLDB_SERVER_PORT_END = 35000

LLDB_STARTUP_TIMEOUT = int(os.environ.get('LLDB_STARTUP_TIMEOUT', 10))
LLDB_ATTACH_TIMEOUT = int(os.environ.get('LLDB_ATTACH_TIMEOUT', 5))
LLDB_CMD_TIMEOUT = int(os.environ.get('LLDB_CMD_TIMEOUT', 10))


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
    firstcmd = line_e.split(symbol)[0]
    doline = line_e.split(symbol)[1]
    result = symbol.join(line_e.split(symbol)[2:]).replace("\n", "")
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


def on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num, android_session=None, process=None):
    """
    launch_debug method: based on different run_platform & run_env
    """
    p = None
    for line_e in lines_e:
        firstcmd, doline, result = split_cmd(line_e, run_env)
        # 'cjdb' in firstcmd: lanunch cjdb - start debugging
        if "cjdb" in firstcmd:
            if process is not None:
                continue
            if run_platform == 'windows':
                if "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        continue
                    # On Windows, PopenSpawn does NOT split a string command line
                    # (see pexpect popen_spawn.py: if ... sys.platform != 'win32').
                    # Pass a list so subprocess.Popen receives correct argv.
                    process = pexpect.popen_spawn.PopenSpawn(doline.strip().split(), timeout=15,
                                                             encoding='utf-8',
                                                             maxread=200000,
                                                             codec_errors='replace'
                                                             )
                    # When cjdb is launched with a binary on the command line, it loads
                    # the target during startup ("target create"). Under concurrent load
                    # this may lag behind the first debug command. Wait for target create
                    # to complete: match either "target create ... (cjdb)" or bare "(cjdb)".
                    process.expect(['target create[\\s\\S]*\\(cjdb\\)', '\\(cjdb\\)',
                                   pexpect.EOF, pexpect.TIMEOUT], timeout=LLDB_STARTUP_TIMEOUT)
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
            continue

        # stop cjdb process using quit-cmd
        elif "quit" in firstcmd or "q" in firstcmd or "exit" in firstcmd:
            process.sendline(doline)
            process.expect(['proc', pexpect.EOF, pexpect.TIMEOUT], timeout=5)
            try:
                process.sendline("y")
            except OSError:
                pass
            if run_platform != 'darwin':
                process.wait()
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
                print("Error: Android session not initialized")
                os._exit(1)
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
        if run_platform != 'darwin':
            process.wait()

    return process, p


def dotest(process, doline, result, f_e, run_env, run_platform, p=None):
    """
    dotest: send debug command and match expected result
    """
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
        step_commands = ['r', 'run', 'c', 'continue', 'n', 'next', 's', 'step', 'finish']
        if doline.strip().split()[0] in step_commands:
            skip_keywords = ['Watchpoint', 'watchpoint', 'Process', 'exited', 'stopped', 'error', 'Command requires', 'resuming']
            if any(kw in result for kw in skip_keywords):
                expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*'
            else:
                expected_pattern = '\r?\n[\\s\\S]*(stopped|exited)[\\s\\S]*' + result + '[\\s\\S]*'
        elif run_platform == 'linux' or "android_aarch64" in run_env:
            expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*\\(cjdb\\)'
        else:
            expected_pattern = '\r?\n[\\s\\S]*' + result + '[\\s\\S]*'
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
        print("RECEIVED: " + error_log)
        print("--------------------------")
        if p:
            clean_process(p, run_platform)

        process.sendline("q")
        process.sendline("y")
        if run_platform != 'darwin':
            process.wait()
        f_e.close()
        process.kill(0)

        raise DebugTestFailed("Debug command failed: " + doline)
    return


def clean_process(p, run_platform='linux'):
    """
    clean_process: kill cjti on pid to ensure next textcase can run
    """
    try:
        if run_platform == 'windows':
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
    ensure_windows_dll_path()
    f_e, lines_e = read_execline(test_case)

    android_session = None
    ios_session = None
    process = None
    test_failed = False
    
    try:
        if "ios_simulator" in run_env:
            ios_session = IOSDebugSession()
            
            if not ios_session.setup(test_case, cmp_res):
                print("Failed to setup iOS simulator debug environment")
                test_failed = True
                return
            
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
                test_failed = True
                return
            
            send_and_expect_lldb(process, f'attach {ios_pid}', timeout=LLDB_ATTACH_TIMEOUT)
           
        elif "android_aarch64" in run_env:
            android_session = AndroidDebugSession()
            if not android_session.setup(test_case, cmp_res):
                print("Failed to setup Android debug environment")
                test_failed = True
                return
            
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
                test_failed = True
                return

            if android_session and android_session.android_pid:
                send_and_expect(process, f'attach {android_session.android_pid}', timeout=LLDB_ATTACH_TIMEOUT)

        process, p = on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num, android_session, process)

        if p:
            clean_process(p, run_platform)

        if android_session:
            android_session.cleanup()
        
        if ios_session:
            ios_session.cleanup()

        f_e.close()
        process.kill(0)
    except DebugTestFailed as e:
        print(f"Test failed: {e}")
        if android_session:
            android_session.cleanup()
        if ios_session:
            ios_session.cleanup()
        if process:
            process.kill(0)
        if f_e:
            f_e.close()
        test_failed = True
    
    if test_failed:
        os._exit(1)
    
    os._exit(0)


if __name__ == "__main__":
    debugging()
