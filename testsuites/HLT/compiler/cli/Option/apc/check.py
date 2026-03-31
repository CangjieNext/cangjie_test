# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import os

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument('--dir_path', help='dir to be checked.')
arg_parser.add_argument('--expected_count', help='number of .ll files.')

args = arg_parser.parse_args()

dir_path: str = args.dir_path
expected_count = int(args.expected_count)

counter = 0
for file_name in os.listdir(dir_path):
    if file_name.endswith('.ll'):
        counter += 1

print(f'expected count: {expected_count}')
print(f'  actual count: {counter}')

if counter == expected_count:
    exit(0)
else:
    exit(1)
