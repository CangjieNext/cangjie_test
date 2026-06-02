# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for compilation & execution hw.c test
'''

from os.path import join, dirname
from os import makedirs
from os import name as os_name

if self.cfg.is_jet:
  bin_ext = '.cbc'
elif os_name == 'nt':
  bin_ext = '.exe'
else:
  bin_ext = ''

pkg_dir1 = join(source_dir, "src", "pkg1")
pkg_out1 = join(output_dir, 'src', 'build', 'default', 'libpkg1.a')
makedirs(dirname(pkg_out1), exist_ok=True)

pkg_dir2 = join(source_dir, "src", "pkg2")
pkg_out2 = join(output_dir, 'src', 'build', 'default', 'libpkg2.a')
makedirs(dirname(pkg_out2), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, "src", "build")} --output-type=staticlib',
           source=f'{join(pkg_dir1, "pkg1.cj")} {join(pkg_dir2, "pkg2.cj")}', output=pkg_out1))

on_compile(cjc(option=f'--import-path {join(output_dir, "src", "build")} --output-type=staticlib',
           source=f'{join(pkg_dir1, "pkg1.cj")} {join(pkg_dir2, "pkg2.cj")}', output=pkg_out2))