#! /usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
This script attempts to generate testcases for cjc with the `--coverage` option.
Since the coverage only affects the LLVM bitcode generation (it instruments extra code)
and does not change the original program semantics,
we reuse testcases under the `Codegen` directory to check whether bitcode is still correct after coverage instrumentation.
To avoid huge test overhead, we reuse and sample testcases.
Finally, all generated/reused testcases are compiled with `--coverage` and executes.
'''


import os
import random
from pathlib import Path


def prob_sample() -> bool:
    '''
    The probability to sample a test case.
    Currently, it is set as 40%.
    '''
    SAMPLE_PROB = 40
    value = random.randint(0, 99)
    return value < SAMPLE_PROB


def gen_new_testcase(old_path: str, testcase_dir: str):
    if not os.path.exists(old_path):
        print(f'{old_path} does not exist.')
        return
    with open(old_path, 'r') as old_fd:
        name = os.path.basename(old_path)
        new_path = os.path.join(testcase_dir, name)
        if os.path.exists(new_path):
            print(f'{new_path} exists.')
            return
        with open(new_path, 'w') as new_fd:
            for line in old_fd:
                line = line.replace('%cmp_opt', '%cmp_opt %coverage_opt')
                new_fd.write(line)


if __name__ == '__main__':
    nr_tot_cj_file = 0
    nr_tot_sample = 0

    curr_dir = Path(os.path.realpath(__file__)).parent
    code_gen_dir = curr_dir.parent / 'Codegen'
    for root, dirs, files in os.walk(code_gen_dir.absolute()):
        if root.endswith('pkg') or root.endswith('LegacyTests'):
            continue
        for f in files:
            nr_tot_cj_file += 1
            if f.endswith('.cj') and prob_sample():
                old_path = os.path.join(root, f)
                gen_new_testcase(old_path, curr_dir.absolute())
                nr_tot_sample += 1

    print(f'Sampled: {nr_tot_sample}/{nr_tot_cj_file} ({float(nr_tot_sample)/nr_tot_cj_file})')