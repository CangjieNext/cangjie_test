# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.
import os
import sys
import signal
import subprocess
import time
import platform
from subprocess import check_output
import shlex


def create_new_session():
    if platform.system() == 'Windows':
        return None
    else:
        try:
            return os.setsid
        except AttributeError:
            return None


class heapTest():
    """
    heapTest: father class of heapExportTest and heapAnalyzeTest
    How cjprof heap <option> work
    """

    def __init__(self):
        if len(sys.argv) < 3:
            print("Error: Missing arguments. Usage: python script.py <compile_result> <run_env>")
            sys.exit(1)

        compile_result = sys.argv[1]
        run_env = sys.argv[2]

        self.p = self.run_CJ_case(compile_result, run_env)
        self.real_pid = self.find_CJ_pid(compile_result, run_env)

    def heap_running(self):
        """
        heap_running: start heap command and clean env
        """
        if not hasattr(self, 'heap_export_cmd'):
            raise AttributeError("Attribute 'heap_export_cmd' not found in instance")

        self.p_heap, compare_res = self.heap_command(self.heap_export_cmd)
        self.clean_env(self.p, self.p_heap)
        if compare_res == 2:
            sys.exit(2)
        elif compare_res == 1:
            sys.exit(1)

    def run_CJ_case(self, compile_result, run_env):
        """
        run_CJ_case: run the *.cj compile_result
        """
        print("-------- Run {} -------- ".format(compile_result))

        session_func = create_new_session()

        if "cjnative" in run_env:
            cmd = "./{}".format(compile_result)
        else:
            cmd = "cj " + compile_result
        cmd_list = shlex.split(cmd)
        p = subprocess.Popen(cmd_list, executable=None, preexec_fn=session_func, close_fds=True)
        time.sleep(0.5)
        return p

    def find_CJ_pid(self, inputfile, run_env):
        """
        find_CJ_pid: find pid correspond to *.cj
        """
        if "cjnative" in run_env:
            try:
                real_pid = subprocess.check_output(["pidof", inputfile]).split()[0].decode('utf-8')
            except FileNotFoundError:
                print("Warning: 'pidof' command not found on this system (likely Windows).")
                return "0"
            except Exception as e:
                print(f"Error finding PID: {e}")
                return "0"

            print("-------- cjprof heap {0} real_pid: {1} -------- ".format(inputfile, real_pid))
            return real_pid


    def heap_command(self, heap_export_cmd):
        """
        heap_command: start cjprof heap process
        """
        print("-------- cjprof heap {0} -------- ".format(heap_export_cmd))

        session_func = create_new_session()

        cmd = "cjprof heap {0}".format(heap_export_cmd)
        cmd_list = shlex.split(cmd)
        p_heap = subprocess.Popen(cmd_list, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=session_func)

        print("———————————————————————————————————————————————————————————————")
        print("Cjprof Output: ")

        p_heap_stdouts = p_heap.stdout.readlines()
        for p_heap_stdout in p_heap_stdouts:
            print(p_heap_stdout.decode('utf-8').strip())

        print("———————————————————————————————————————————————————————————————")

        p_heap.communicate()
        # start compare the generated-heapdata and expected-heapdata
        compare_res = self.compare_heap_data(p_heap_stdouts)

        return p_heap, compare_res

    def clean_subprocess(self, p):
        if platform.system() == 'Windows':
            try:
                p.kill()
            except ProcessLookupError:
                pass
        else:
            try:
                os.killpg(p.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
            except Exception:
                p.kill()

    def clean_env(self, p, p_heap):
        # Check to kill subprocess
        self.clean_subprocess(p)
        self.clean_subprocess(p_heap)

    def compare_heap_data(self, p_heap_stdout):
        return 0


class heapExportTest(heapTest):
    """
    heapExportTest: extends to heapTest
    How cjprof heap export data based on sampling
    """

    def __init__(self):
        try:
            super().__init__()
        except Exception as e:
            print(f"Initialization error in heapExportTest: {e}")


class heapAnalyzeTest(heapTest):
    """
    heapAnalyzeTest: extends to heapTest
    How cjprof heap Analyze data based on export-data
    """

    def __init__(self):
        try:
            super().__init__()
        except Exception as e:
            print(f"Initialization error in heapAnalyzeTest: {e}")

    def run_CJ_case(self, compile_result, run_env):
        """
        run_CJ_case: no need on heapAnalyzeTest
        """
        print("-------- No need to run CJ case  -------- ")
        session_func = create_new_session()
        p = subprocess.Popen("", executable=None, preexec_fn=session_func
                             )
        return p

    def find_CJ_pid(self, inputfile, run_env):
        """
        find_CJ_pid: no need on heapAnalyzeTest
        """
        print("-------- No need to find CJ pid  -------- ")
        return 0
