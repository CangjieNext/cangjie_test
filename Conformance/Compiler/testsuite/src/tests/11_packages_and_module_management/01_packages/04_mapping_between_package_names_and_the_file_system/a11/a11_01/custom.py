# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.01.04.a11_01/
'''

from os.path import join, dirname
from os import makedirs
from os import name as os_name

root_dir = "src"

pkg_dir = join(source_dir, root_dir, "A")
pkg_out = join(output_dir, root_dir, 'build', 'default', 'libA.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, root_dir, "build")),
           source='-p "{}"'.format(pkg_dir), output=pkg_out))
