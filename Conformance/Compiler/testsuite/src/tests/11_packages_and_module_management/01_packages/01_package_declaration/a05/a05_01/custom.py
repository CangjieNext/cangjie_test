# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11_01_05_a05_01
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

root_dir = "modified_root_dir"

def my_handler(self, test, result):
  if 'Hello World!' not in str(result.stdout):
    result.stdout += b'Something went wrong! "Hello World!" expected'
    test.result = 'failed'
  else:
    test.result = 'passed'

output_main = join(output_dir, 'test_a05_01{}'.format(bin_ext))
pkg_dir = join(source_dir, root_dir, "dir1")
pkg_out = join(output_dir, root_dir, 'build', 'default', 'libdefault_dir1.a')
makedirs(dirname(pkg_out), exist_ok=True) 

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, root_dir, "build")),
           source='-p "{}"'.format(pkg_dir), output=pkg_out))

on_compile(cjc(option='--import-path {} '.format(join(output_dir, root_dir, "build/default")) + 
               '{} '.format("--output-type=cbc" if self.cfg.is_jet else "-L \"" + join(output_dir, root_dir, "build", "default")+ "\" --output-type=exe") + 
               ' -ldefault_dir1', 
               source='{}'.format(join(source_dir, root_dir, "main.cj")), output=output_main))

on_execute(cj(output_main), handler=my_handler)
