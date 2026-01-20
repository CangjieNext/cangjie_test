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
    for char in line_e:
        if not char.isalpha() and not char.isdigit() and char != " ":
            symbol = char
            break
    firstcmd = line_e.split(symbol)[0]
    doline = line_e.split(symbol)[1]
    result = symbol.join(line_e.split(symbol)[2:]).replace("\n", "")
    if ("cjnative" in run_env and 'AOT' in firstcmd) or ("cjti" in run_env and 'CJVM' in firstcmd) or (
            'AOT' not in firstcmd and 'CJVM' not in firstcmd):
        print("__________________________")
        print("|" + firstcmd + "|")
        print("|" + doline + "|")
        print("|" + result + "|")
        print("__________________________")
    return firstcmd, doline, result


class check_free_port(object):
    """
    check_free_port: Check the port is open
    """

    def __init__(self, start, stop):
        self.port = None
        self.sock = socket.socket()
        while True:
            port_using_list = os.popen('ss -tunlp').readlines()
            port_list = [i for i in range(start, stop)]
            for port_using in port_using_list:
                try:
                    port_list.remove(int(port_using.split()[4].split(':')[-1]))
                except ValueError:
                    continue
            port = random.choice(port_list)  # choose the port from free port
            try:
                self.sock.bind(('127.0.0.1', port))  # check port
                self.port = port
                break
            except Exception:
                continue

    def release(self):
        assert self.port is not None
        self.sock.close()


class choose_free_port(object):
    def __init__(self, start, stop):  # port choose range
        self.lock = None
        self.bind = None
        self.port = None
        while self.port == None:
            bind = check_free_port(start, stop)
            port_using_list = os.popen('ss -tunlp').readlines()
            port_list = [i for i in range(start, stop)]
            for port_using in port_using_list:
                try:
                    port_list.remove(int(port_using.split()[4].split(':')[-1]))
                except ValueError:
                    continue
            # if bind.port in port_list:
            #    print(f'the chosed port was used , will release port , choose again: {bind.port}')
            #    bind.release()
            #    continue
            lock = InterProcessLock(path='/tmp/socialdna/port_{}_lock'.format(bind.port))  # Lock the Port
            success = lock.acquire(blocking=False)
            if success:
                self.lock = lock
                self.port = bind.port
                bind.release()
                break
        print("")
        print("----CHOOSE CJVM-PORT: {}----".format(self.port))
        bind.release()

    def release(self):
        self.lock.release()


def on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num):
    """
    launch_debug method: based on different run_platform & run_env
    """
    p = None
    for line_e in lines_e:
        firstcmd, doline, result = split_cmd(line_e, run_env)
        # 'cjdb' in firstcmd: lanunch cjdb - start debugging
        if "cjdb" in firstcmd:
            if run_platform == 'windows':
                if "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        continue
                    process = pexpect.popen_spawn.PopenSpawn(["cmd", "/c", doline], timeout=15,
                                                             encoding='utf-8',
                                                             maxread=3000
                                                             )
                elif "cjti" in run_env:
                    # not cjnative not support windows yet
                    pass
            elif run_platform == 'darwin' or run_platform == 'linux':
                if "cjnative" in run_env:
                    if 'CJVM' in firstcmd:
                        continue
                # cjti: linux-x86-64
                elif "cjti" in run_env:
                    if 'AOT' in firstcmd:
                        continue
                    elif 'CJVM' in firstcmd:
                        # choose open port to support running testcases paral
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
                process = pexpect.spawn(doline, timeout=15, encoding='utf-8', maxread=3000)
            result = '[\\s\\S]*' + result + '[\\s\\S]*'

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

        # CJVM-cmd not run on cjnative-backend
        elif "CJVM" in firstcmd and "cjnative" in run_env:
            continue

        # AOT-cmd not run on not cjnative-backend
        elif "AOT" in firstcmd and "cjti" in run_env:
            continue

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

        # stop cjdb process using quit-cmd
        elif "quit" in firstcmd or "q" in firstcmd or "exit" in firstcmd:
            process.sendline(doline)
            process.sendline('y')
            if run_platform != 'darwin':
                process.wait()
            break

        else:
            dotest(process, doline, result, f_e, run_env, run_platform, p)

    # Auto quit cjdb process using command "quit"
    if not ("quit" in firstcmd or "q" in firstcmd or "exit" in firstcmd):
        process.sendline("q")
        process.sendline("y")
        if run_platform != 'darwin':
            process.wait()

    return process, p


def dotest(process, doline, result, f_e, run_env, run_platform, p=None):
    """
    dotest: send debug command and match expected result
    """
    process.sendline(doline)
    if run_platform == 'linux':
        result = '\n[\\s\\S]*' + result + '[\\s\\S]*\\(cjdb\\)'
    else:
        result = '\n[\\s\\S]*' + result + '[\\s\\S]*'
    # index for both win and linux
    index = process.expect([result, pexpect.EOF, pexpect.TIMEOUT], timeout=15)
    indextest(process, doline, index, f_e, run_env, p)
    return


def indextest(process, doline, index, f_e, run_env, p):
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
        # if actual result not match the expect result
        # Need to kill not cjnative's pid to make sure the next correct test can pass 
        if p:
            clean_process(p)

        process.sendline("q")
        process.sendline("y")
        if 'darwin' not in run_env:
            process.wait()
        f_e.close()
        process.kill(0)

        os._exit(1)
    return


def clean_process(p):
    """
    clean_process: kill cjti on pid to ensure next textcase can run
    """
    try:
        os.killpg(p.pid, signal.SIGTERM)
    except ProcessLookupError:
        pass


def debugging():
    """
    start debugging: compare actual_result and expect_result 
    """
    test_case, cmp_res, run_env, port_num = get_argv()
    run_platform = get_platform()
    f_e, lines_e = read_execline(test_case)

    # only not cjnative need subprocess(p) to run testcase
    process, p = on_debugging(f_e, lines_e, test_case, cmp_res, run_platform, run_env, port_num)

    # if current testcase can pass, kill subprocess on not cjnative-backend
    # Need to kill not cjnative's pid to make sure the next correct test can pass 
    if p:
        clean_process(p)

    # close file and kill process
    f_e.close()
    process.kill(0)
    os._exit(0)


if __name__ == "__main__":
    debugging()
