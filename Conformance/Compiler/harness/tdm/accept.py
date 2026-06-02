# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# -*- coding: utf-8 -*-
import argparse
import filecmp
import os
import platform
import re
import shutil
import subprocess
import time
from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument('--test', help='enter TDM test keyword [parallel, consistent, report, timeout, replay]')
parser.add_argument('-v', '--verbose', help='print detailed information for 5.2 Parallel test', action='store_true',
                    default=False)
args = parser.parse_args()
func_to_test = args.test
verbose = args.verbose

run_threads = [1, 4, 16, 32]
harness_path = os.path.join('..', 'harness.py')
reporter_path = os.path.join('..', 'report.py')
clang = 'clang-8'
cc_flags = '""'

if platform.system() == 'Windows':
    clang = 'clang'
    cc_flags = '"-target x86_64-pc-windows-gnu"'


def wd_cleanup():
    if os.path.exists('work'):
        shutil.rmtree('work')
    os.mkdir('work')


def check_test(condition, test_name):
    if condition:
        tdm_print('\33[0m{}'.format(test_name) + '\033[32m {}'.format('PASSED') + '\33[0m {}'.format('\n'))
    else:
        tdm_print('\33[0m{}'.format(test_name) + '\033[31m {}'.format('FAILED') + '\33[0m {}'.format('\n'))


def tdm_print(msg):
    ctime = datetime.now().isoformat(sep=' ', timespec='milliseconds')
    print(ctime + ':[TDM_INFO]: ' + msg)


def check_env():
    if not os.path.exists(harness_path):
        tdm_print(f'Could not find {harness_path}')
        exit(1)

    try:
        subprocess.run(['cjc', '-v'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except:
        tdm_print('Could not find cjc compiler')
        exit(1)

    try:
        subprocess.run([clang, '-v'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except:
        tdm_print('Could not find clang-8 compiler')
        exit(1)


def exec_harness(cmd, work_dir):
    cmd = f"python3 {harness_path} {cmd} --cc {clang} --cc-flags {cc_flags} --work-dir {os.path.join('work', work_dir)}"
    print('\n' + cmd)
    os.system(cmd)
    with open(os.path.join('work', work_dir, 'results.log'), 'r') as file:
        return file.read()


def timeout(test_dir):
    tdm_print("5.7 TIMEOUT TEST STARTED")
    log = exec_harness(f' --base-timeout 5 --log-mode verbose --test-root {test_dir}', 'timeout')
    check_test('The 5.0-second timeout has expired' in log, '5.7 TIMEOUT TEST')


def parallel(test_dir):
    tdm_print('5.2 PARALLEL TEST STARTED')
    time_res = []
    mem_res = []

    for thread in run_threads:
        workdir = os.path.join('work', f'parallel_{thread}')
        os.mkdir(workdir)
        cmd = f"mprof run -o {os.path.join(workdir, 'mprofile.out')} --include-children python3 {harness_path} --comp" \
              f"-threads {thread} --exec-threads {thread} --log-mode progress --test-root {test_dir} --wor" \
              f"k-dir {workdir} --profile"

        print('\n' + cmd)
        os.system(cmd)

        with open(os.path.join(workdir, 'mprofile.out'), 'r') as file:
            mem_cons = re.findall("MEM\s(\d*)[.]\d*\s", file.read())
            mem_res.append(max(mem_cons, key=lambda x: int(x)))

        with open(os.path.join(workdir, 'results.log'), 'r') as file:
            exec_time = re.search("Incomplete \d .([^s]*)", file.read()).group(1)
            time_res.append(float(exec_time))

    for (exec_time, threads, memory) in zip(time_res, run_threads, mem_res):
        tdm_print(
            f'TEST WITH --comp-threads {threads} --exec-threads {threads} CONSUMED MEMORY PEAK {memory} MB , FINISHED '
            f'IN {exec_time} SECONDS')

    check_test(sorted(time_res, reverse=True) == time_res, '5.2 PARALLEL TEST')


def consistent(test_dir):
    tdm_print("5.3 CONSISTENT TEST STARTED")
    results = []
    reports_2_compare = []
    workdir = f'consistent'
    os.mkdir(os.path.join('work', workdir))
    os.mkdir(os.path.join('work', workdir, 'reports_2_compare'))
    for threads in run_threads:
        log = exec_harness(
            f' --comp-threads {threads} --exec-threads {threads} --log-mode progress --test-root {test_dir}', workdir)
        res = re.search(".*(Test results:.* Incomplete \d*).*", log).group(1)
        results.append([f'--exec-threads {threads} --comp-threads {threads}', f'{res}'])

        subprocess.run([reporter_path, '--no-color', '-i', os.path.join('work', workdir, 'results.log.json'), '-o',
                        os.path.join('work', workdir, f'report_{threads}.log')])

        with open(os.path.join('work', workdir, f'report_{threads}.log'), 'r') as lines, open(
                os.path.join('work', workdir, 'reports_2_compare', f'report_{threads}.log'), 'w') as file:
            n = 0
            for line in lines:
                if 'Passed tests' in line or n == 1:
                    n = 1
                    line = re.sub('Compile time:\s\d*[.]\d*s', '', line)
                    line = re.sub('Execution time:\s\d*[.]\d*s', '', line)
                    file.write(line)
        tdm_print(f"Log report_{threads}.log stored in {os.path.join('work', workdir, 'reports_2_compare')}")

        reports_2_compare.append(
            open(os.path.join('work', workdir, 'reports_2_compare', f'report_{threads}.log')).read().replace('\n', ''))

    for result in results:
        print(result)

    are_reports_2_compare_the_same = all(filecmp.cmp(f'work/consistent/reports_2_compare/report_{run_threads[0]}.log',
                                                     f'work/consistent/reports_2_compare/report_{thread}.log') for
                                         thread in run_threads)
    are_test_results_the_same = all(element[1] == results[0][1] for element in results)

    check_test(are_reports_2_compare_the_same and are_test_results_the_same, '5.3 CONSISTENT TEST')


def report(test_dir):
    tdm_print('5.4 VISUALIZED RESULTS TEST STARTED')
    test_res = {}
    run_modes = [
        ['mixed', '--run-mode mixed',
         'Test results: Total: 121, Passed 110, Failed 10, Errored 1, Skipped 0, Incomplete 0'],
        ['compile', '--run-mode compile',
         'Test results: Total: 121, Passed 109, Failed 10, Errored 1, Skipped 0, Incomplete 1'],
        ['execute', '--run-mode execute',
         'Test results: Total: 121, Passed 0, Failed 0, Errored 11, Skipped 110, Incomplete 0']
    ]

    for run_mode in run_modes:
        workdir = f'report_{run_mode[0]}'
        log = exec_harness(f' {run_mode[1]} --log-mode progress --test-root {test_dir}', workdir)
        res = re.search(".*(Test results:.* Incomplete \d*).*", log).group(1)

        run_reporter = f"{reporter_path} -l short -i {os.path.join('work', workdir, 'results.log.json')}"
        print(f'\n {run_reporter}')
        os.system(run_reporter)

        if res not in run_mode[2]:
            tdm_print(f'EXPECTED RESULT: {run_mode[2]}')
            tdm_print(f'ACTUAL RESULT: {res}')
            check_test(False, '5.4 VISUALIZED RESULTS TEST')
            return

        test_res[run_mode[0]] = res

    for val in test_res:
        tdm_print(f'--run-mode {val}  {test_res[val]}')

    check_test(True, '5.4 VISUALIZED RESULTS TEST')


def replay(test_dir):
    tdm_print("5.6 REPLAY MODE TEST STARTED")
    passed = failed = errored = skipped = incomplete = 0
    for i in range(5):
        log = exec_harness(f' --log-mode short --test-root {test_dir}', 'replay')
        res = re.search(
            ".*Test results:.* Passed (\d*), Failed (\d*), Errored (\d*), Skipped (\d*), Incomplete (\d*).*", log)
        passed += int(res.group(1))
        failed += int(res.group(2))
        errored += int(res.group(3))
        skipped += int(res.group(4))
        incomplete += int(res.group(5))
        time.sleep(1)

    log = exec_harness(f' --log-mode short --test-root {os.path.join("tests", "replay")} --replay', 'replay')
    run_res = f'Passed {passed}, Failed {failed}, Errored {errored}, Skipped {skipped}, Incomplete {incomplete}'
    tdm_print(f'Test run 5 times: {run_res}')
    res = re.search(".*Test results: (.* Incomplete \d*).*", log).group(1)
    tdm_print(f'Replay mode results : {res}')

    check_test(run_res in res, '5.6 REPLAY MODE TEST ')


tests = [
    [parallel, 'parallel', os.path.join('tests', 'concurrency')],
    [consistent, 'consistent', os.path.join('tests', 'main')],
    [report, 'report', os.path.join('tests', 'main')],
    [timeout, 'timeout', os.path.join('tests', 'timeout')],
    [replay, 'replay', os.path.join('tests', 'replay')]
]

wd_cleanup()
check_env()

if func_to_test is not None:
    for test in tests:
        if func_to_test in test[1]:
            test[0](test[2])
else:
    for test in tests:
        test[0](test[2])
