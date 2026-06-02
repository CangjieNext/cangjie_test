# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.3.a05_01
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

output_main = join(output_dir, 'src', 'build', 'main{}'.format(bin_ext))
pkg_dir = join(source_dir, "src", "dir1")
pkg_out = join(output_dir, 'src', 'build', 'default', 'libdefault_dir1.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, "src", "build")),
           source='-p "{}"'.format(pkg_dir), output=pkg_out))

on_compile(cjc(option='--import-path {} '.format(join(output_dir, "src", "build", "default")) + 
               '{} '.format("--output-type=cbc" if self.cfg.is_jet else "-L \"" + join(output_dir, "src", "build", "default") + "\" --output-type=exe") + 
               ' -ldefault_dir1', 
               source=f'{join(source_dir, "src", "main.cj")}', output=output_main))
