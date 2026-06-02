# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for 11.1.4.a06_02
'''

from os.path import join, dirname
from os import makedirs
from os import name as os_name

root_dir = "custom_src"

def my_handler(self, test, result):
  if 'error' not in str(result.stderr):
    result.stdout += b'Something went wrong! "error: found more than one package declaration" expected'
    test.result = 'failed'

pkg_dir = join(source_dir, root_dir, "directory_0", "directory_1")
pkg_out = join(output_dir, root_dir, 'build', 'default', 'libdir0_dir1.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, root_dir, "build")} --output-type=staticlib',
           source=f'-p "{pkg_dir}"', output=pkg_out), handler=my_handler)

