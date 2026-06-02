# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for 11.1.5.1.a05_01
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

output_main = join(output_dir, 'test_a05_01{}'.format(bin_ext))

def my_handler(self, test, result):
  if 'Hello, world!' not in str(result.stdout):
    result.stdout += b'Something went wrong! "Hello, world!" expected'
    test.result = 'failed'

pkg_dir = join(source_dir, "pkg1")
pkg_out = join(output_dir, 'build', 'default', 'libpkg1.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option='--import-path {} --output-type=staticlib'.format(join(output_dir, "build")),
           source='-p "{}"'.format(pkg_dir), output=pkg_out))

on_compile(cjc(option='--import-path {} '.format(join(output_dir, "build")) + 
               '{} '.format("--output-type=cbc" if self.cfg.is_jet else "-L \""+ join(output_dir, "build", "default")  +"\" --output-type=exe") + 
               ' -lpkg1',
               source='{}'.format(join(source_dir, "test_a05_01.cj")), output=output_main))

on_execute(cj(output_main), handler=my_handler)
