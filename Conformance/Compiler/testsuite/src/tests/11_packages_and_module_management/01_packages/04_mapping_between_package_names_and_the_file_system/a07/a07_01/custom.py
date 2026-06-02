# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.4.a07_01
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

root_dir = "src"

output_main = join(output_dir, root_dir, 'build', 'main{}'.format(bin_ext))
pkg_dir1 = join(source_dir, root_dir, "directory_0")
pkg_out1 = join(output_dir, root_dir, 'build', 'default', 'libdir0.a')
makedirs(dirname(pkg_out1), exist_ok=True)

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, root_dir, "build")),
           source='-p "{}"'.format(pkg_dir1), output=pkg_out1))

pkg_dir2 = join(source_dir, root_dir, "directory_0", "directory_1")
pkg_out2 = join(output_dir, root_dir, 'build', 'default', 'libdir0_dir1.a')
makedirs(dirname(pkg_out2), exist_ok=True)

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, root_dir, "build")),
           source='-p "{}"'.format(pkg_dir2), output=pkg_out2))

on_compile(cjc(option='--import-path {} '.format(join(output_dir, root_dir, "build", "default")) + 
               '{} '.format("--output-type=cbc" if self.cfg.is_jet else "-L \"" + join(output_dir, root_dir, "build", "default") + "\" --output-type=exe") + 
               ' -ldir0 -ldir0_dir1', 
               source='{}'.format(join(source_dir, root_dir, "main.cj")), output=output_main))
