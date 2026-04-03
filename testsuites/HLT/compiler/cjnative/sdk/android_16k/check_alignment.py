# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import os
import subprocess

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument('--dir-path', dest='dir_path', help='dir to be checked.')
arg_parser.add_argument('--cmd', dest='cmd', help='readelf command.')
arg_parser.add_argument('--expected-alignment', dest='expected_alignment', help='expected alignment value.')

args = arg_parser.parse_args()

dir_path: str = args.dir_path
cmd = args.cmd.split()
expected_alignment: str = args.expected_alignment

for file_name in os.listdir(dir_path):
    if not file_name.endswith('.so'):
        continue
    so_file_path = os.path.join(dir_path, file_name)
    result = subprocess.run(
        cmd + [so_file_path],
        capture_output=True,
        text=True,
        timeout=3,
    )
    for line in result.stdout.split('\n'):
        if 'LOAD' in line:
            alignment = line.strip().split()[-1]
            if expected_alignment != alignment:
                print(f'check failed: {so_file_path} has alignment {alignment}')
                exit(1)

exit(0)
