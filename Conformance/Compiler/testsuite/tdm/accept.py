# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# -*- coding: utf-8 -*-
import argparse

import os
import platform
import re
import shutil
import subprocess
import time
import zipfile
from datetime import datetime
from os.path import join
from subprocess import PIPE, run

parser = argparse.ArgumentParser()
parser.add_argument('--test', help='TDM test keyword [consistent, memory, error, replay]')
parser.add_argument('--suite', help='Path to TEST SUITE', default=os.getcwd())
parser.add_argument('--harness', help='Path to HARNESS', default=join('..', 'harness'))

args = parser.parse_args()

func_to_test = args.test

suite_root_dir = args.suite
work_dir       = join(suite_root_dir, "tdm", "work")
utils_dir      = join(work_dir, 'utils')

harness_root_dir = args.harness
harness          = os.path.join(harness_root_dir, 'harness.py')
reporter         = os.path.join(harness_root_dir, 'report.py')

PT_BOLD_RED     = '\033[31;1m'
PT_BOLD_GREEN   = '\033[32;1m'
PT_BOLD         = '\033[1m'
PT_RED          = '\033[31m'
PT_END_COLORING = '\033[0m' 

clang = 'clang-8'
cc_flags = '""'
python_exec = 'python3'
dylib = '.so'
ext   = ''

if platform.system() == 'Windows':
    clang = 'clang'
    cc_flags = '"-target x86_64-pc-windows-gnu"'
    python_exec = 'python'
    dylib = '.dll'
    ext = '.exe'


def wd_cleanup():
    if os.path.exists(join(suite_root_dir, 'tdm', 'work')):
        shutil.rmtree(join(suite_root_dir, 'tdm', 'work'))
    try:
        os.mkdir(join(suite_root_dir, 'tdm', 'work'))
    except:
        tdm_print(f'Please run accept.py script from test suite home folder.')
        tdm_print(f'For example: {PT_BOLD}{python_exec} {join("tdm", "accept.py")} --test consistent{PT_END_COLORING} ')
        exit(1)


def check_test(condition, test_name):
    if condition:
        tdm_print(f'{PT_BOLD}{test_name} {PT_BOLD_GREEN}PASSED {PT_END_COLORING}')
    else:
        tdm_print(f'{PT_BOLD}{test_name} {PT_BOLD_RED}FAILED {PT_END_COLORING}')


def tdm_print(msg):
    ctime = datetime.now().isoformat(sep=' ', timespec='milliseconds')
    print(f'{ctime} :[TDM_INFO]: {msg}')


def check_env():
    if not os.path.exists(harness):
        tdm_print(f'\033[31m Could not find {harness} \33[0m ')
        exit(1)

    try:
        subprocess.run(['cjc', '-v'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except:
        tdm_print('\033[31m Could not find cjc compiler \33[0m')
        exit(1)

    try:
        subprocess.run([clang, '-v'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except:
        tdm_print('\033[31m Could not find clang-8 compiler \33[0m')
        exit(1)


def exec_harness(cmd, work_dir):
    cmd = f"{python_exec} {harness} {cmd} --cc {clang} --cc-flags {cc_flags} --work-dir {join('tdm', 'work', work_dir)}"
    print('\n' + cmd)
    os.system(cmd)
    with open(os.path.join('tdm', 'work', work_dir, 'results.log'), 'r') as file:
        return file.read()

  
def get_test_name(test):
    try:
        split_path = re.search('.*src\Wtests\W(.*)\Wa\d*\Wtest(_a.*).cj', test)
        test_name = '_'.join(re.findall(r'\d+', split_path.group(1))) + '_a' + '_'.join(re.findall(r'\d+', split_path.group(2)))
        return test_name
    except:
        split_path = re.search('.*\W(.*).cj', test).group(1)
        test_name = f'exec_{split_path}'
        return test_name
    

def build_utils():
    os.makedirs(utils_dir, exist_ok=True)
    os.system(f'cjc --import-path "{work_dir}" -p "{suite_root_dir}/src/utils/assert" --output-type=staticlib -o "{utils_dir}/libutils_utils.a"')
    os.system(f'cjc -p "{suite_root_dir}/src/utils/macros" --compile-macro -o "{utils_dir}/"')


def consistent(dirname):
    tdm_print(f"{PT_BOLD}5.3 CONSISTENT TEST STARTED{PT_END_COLORING}")
    os.environ['CANGJIE_PATH'] = f'{work_dir}'
    tdm_print(f'Set the CANGJIE_PATH environment variable to {work_dir}')

    test_dir=join(suite_root_dir, "tdm", "tests", dirname)

    os.makedirs(join(work_dir, dirname), exist_ok=True)

    direct_ret_code_1 = 0
    direct_ret_code_0 = 0

    with open(join(test_dir, 'include.lst'), 'r') as f:
        mylist = f.read().splitlines()      
        for line in mylist:
            test_name = get_test_name(line)
            cmd=f'cjc "{join(suite_root_dir, line)}" -L "{utils_dir}" -lutils_utils --import-path "{utils_dir}" --output-dir "{join(work_dir, dirname)}" -o "{test_name}{ext}"'
            tdm_print(f'Direct test compilation:\n{cmd}')
            os.system(cmd)

            cmd=f'{join(work_dir, dirname, test_name)}'
            tdm_print(f'Direct test execution:\n{cmd}\n')
            result = subprocess.call(cmd, shell=True)

            if result == 0:
                direct_ret_code_0 += 1
            else:
                direct_ret_code_1 += 1
            time.sleep(1)

    log = exec_harness(f' --included-tests {join(suite_root_dir, "tdm", "tests", dirname, "include.lst")} --log-mode verbose', dirname)
    harness_ret_code_1 = log.count("return code: 1")
    harness_ret_code_0 = len(mylist) - harness_ret_code_1
    tdm_print(f'{PT_BOLD}Direct tests compilation & execution: {PT_BOLD_GREEN}{direct_ret_code_0} FINISHED {PT_END_COLORING}{PT_BOLD}and {PT_BOLD_RED}{direct_ret_code_1}{PT_BOLD} CRASHED{PT_END_COLORING}')
    tdm_print(f'{PT_BOLD}Harness tests compilation & execution: {PT_BOLD_GREEN}{harness_ret_code_0} FINISHED {PT_END_COLORING}{PT_BOLD}and {PT_BOLD_RED}{harness_ret_code_1}{PT_BOLD} CRASHED{PT_END_COLORING}')

    check_test(direct_ret_code_0 == harness_ret_code_0 and direct_ret_code_1 == harness_ret_code_1 , '5.3 CONSISTENT TEST ')


def memory(dirname):
    tdm_print(f'{PT_BOLD}5.4 MEMORY TEST STARTED{PT_END_COLORING}')
    os.environ['CANGJIE_PATH'] = f'{work_dir}'
    tdm_print(f'Set the CANGJIE_PATH environment variable to {work_dir}')
    mprof = subprocess.call('mprof run --help', shell=True, stdout=subprocess.DEVNULL)
    if mprof != 0:
        tdm_print("Something went wrong! Could not find mprof. Please add mprof binary to PATH.")
        exit(1)

    test_dir = join(suite_root_dir, 'tdm', 'tests', dirname)
    os.makedirs(join(work_dir, dirname), exist_ok=True)

    with zipfile.ZipFile(join(test_dir, "results.zip")) as zip:
        zip.extractall(join(work_dir, dirname))
 
    cmd=f'{python_exec} {join(suite_root_dir, "tdm", "plot_run_time.py")} -i {join(work_dir, dirname, "results.log.json")} -o {join(work_dir, dirname, "exec_time.html")}'
    tdm_print(f'Checking amount of executable tests:\n{cmd}\n')
    plot_run_time_ret = subprocess.call(cmd, shell=True)

    with open(join(test_dir, 'include.lst'), 'r') as f:
        mylist = f.read().splitlines()
        mem_cons = 0
        for line in mylist:
            test_name = get_test_name(line)
            cmd=f'cjc "{join(suite_root_dir, line)}" -L "{utils_dir}" -lutils_utils --import-path "{utils_dir}" --output-dir "{join(work_dir, dirname)}" -o "exec_{test_name}{ext}"'
            tdm_print(f'{test_name} COMPILATION:\n{cmd}')
            os.system(cmd)
            time.sleep(1)
            cmd=f'mprof run -o {join(work_dir, dirname, f"mprof_{test_name}.out")} --include-children {join(work_dir, dirname, f"exec_{test_name}{ext}")}'
            tdm_print(f'{test_name} EXECUTION:\n{cmd}')
            start = time.time()
            subprocess.call(cmd, shell=True)
            finish = time.time()
            with open(os.path.join(f'{join(work_dir, dirname, f"mprof_{test_name}.out")}'), 'r') as file:
                mem_cons = re.search("MEM\s(\d*[.]\d\d)\d*\s", file.read()).group(1)
            tdm_print(f'{get_test_name(line)} CONSUMED MEMORY PEAK {mem_cons} MB , FINISHED IN {round(finish - start, 2)} SECONDS\n')    
    check_test(plot_run_time_ret == 0, '5.4 MEMORY TEST')


def errors(dirname):
    tdm_print(f'{PT_BOLD}5.5 ERROR PROCESSING TEST STARTED{PT_END_COLORING}')

    test_dir = join(suite_root_dir, 'tdm', 'tests', dirname)

    log_failed = exec_harness(f" --tests {join(test_dir, 'test_failed.cj')} --log-mode verbose", dirname)
    time.sleep(1)
    log_errored_1 = exec_harness(f" --tests {join(test_dir, 'test_errored_1.cj')} --log-mode verbose", dirname)
    # compiler throws internal error right now but it could change with new cjc verisons
    log_errored_2 = exec_harness(f" --tests {join(test_dir, 'test_errored_2.cj')} --log-mode verbose", dirname)

    check_test('Failed 1' in log_failed and 'Errored 1' in log_errored_1, '5.5 ERROR PROCESSING TEST')
       

def replay(dirname):
    tdm_print(f'{PT_BOLD}5.6 REPLAY MODE TEST STARTED{PT_END_COLORING}')

    test_dir = join(suite_root_dir, 'tdm', 'tests', dirname)

    passed = 0
    failed = 0
    errored = 0
    skipped = 0
    incomplete = 0

    for i in range(5):
        log = exec_harness(f' --log-mode short --test-root {test_dir}', dirname)
        res = re.search(
            ".*Test results:.* Passed (\d*), Failed (\d*), Errored (\d*), Skipped (\d*), Incomplete (\d*).*", log)
        passed += int(res.group(1))
        failed += int(res.group(2))
        errored += int(res.group(3))
        skipped += int(res.group(4))
        incomplete += int(res.group(5))
        time.sleep(1)

    log = exec_harness(f" --log-mode short --test-root {join(suite_root_dir, 'tdm', 'tests', 'replay')} --replay", 'replay')
    run_res = f'Passed {passed}, Failed {failed}, Errored {errored}, Skipped {skipped}, Incomplete {incomplete}'
    tdm_print(f'Test run 5 times: {run_res}')
    res = re.search(".*Test results: (.* Incomplete \d*).*", log).group(1)
    tdm_print(f'Replay mode results : {res}')
    check_test(run_res in res, '5.6 REPLAY MODE TEST ')

tests = [
    [consistent, 'consistent'],
    [memory, 'memory'],
    [errors, 'errors'],
    [replay, 'replay']
]

wd_cleanup()
check_env()
build_utils()

if func_to_test is not None:
    for test in tests:
        if func_to_test in test[1]:
            test[0](test[1])
else:
    for test in tests:
        test[0](test[1])
