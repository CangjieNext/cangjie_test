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

def my_handler(self, test, result):
  if "Hello, world!" not in str(result.stdout):
    test.result = "failed"

root_dir = "src"

output_main = join(output_dir, f'test_a03_01{bin_ext}')
makedirs(join(output_dir, root_dir, "build"), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, root_dir, "build")} '
               f'{"--output-type=cbc" if self.cfg.is_jet else "--output-type=exe"} ', 
               source=f'{join(source_dir, root_dir, "main.cj")}', output=output_main))

on_execute(cj(output_main), handler=my_handler)
