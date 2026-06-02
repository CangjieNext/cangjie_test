# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.4.a11_02
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

output_main = join(output_dir, 'test_a11_03{}'.format(bin_ext))
pkg_dir_a = join(source_dir, "a")
pkg_out_a = join(output_dir, 'build', 'liba.a')
makedirs(dirname(pkg_out_a), exist_ok=True)
on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, "build")),
           source='-p "{}"'.format(pkg_dir_a), output=pkg_out_a))

pkg_dir_b = join(source_dir, "a", "b")
pkg_out_b = join(output_dir, 'build', 'libab.a')
makedirs(dirname(pkg_out_b), exist_ok=True)
on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, "build")),
           source='-p "{}"'.format(pkg_dir_b), output=pkg_out_b))

on_compile(cjc(option='--import-path {} '.format(join(output_dir+"", "build")) + 
               '{} '.format("--output-type=cbc" if self.cfg.is_jet else "-L \"" + join(output_dir, "build") + "\" --output-type=exe") + 
               ' -la -lab', 
               source='{}'.format(join(source_dir, "test_a11_03.cj")), output=output_main))
