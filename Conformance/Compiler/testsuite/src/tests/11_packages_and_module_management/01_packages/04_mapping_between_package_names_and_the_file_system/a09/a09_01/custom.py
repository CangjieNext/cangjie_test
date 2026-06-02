# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.01.04.a09_01
'''

from os.path import join, dirname
from os import makedirs
from os import name as os_name

pkg_dir = join(source_dir, "src", "directory_0", "directory_1")
pkg_out = join(output_dir, 'src', 'build', 'default', 'libdir0_dir1.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, "src", "build")} --output-type=staticlib',
           source=f'-p "{pkg_dir}"', output=pkg_out))