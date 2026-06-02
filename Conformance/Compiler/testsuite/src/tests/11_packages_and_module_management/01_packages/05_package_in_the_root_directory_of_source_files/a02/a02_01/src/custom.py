# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for 11.1.5.a02_01
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

module_name = 'customName'

output_main = join(output_dir, f'test_a02_01{bin_ext}')
makedirs(dirname(join(output_dir, 'build', module_name)), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, "build")} '
               f'{"--output-type=cbc" if self.cfg.is_jet else "--output-type=exe"} ', 
           source=f'{join(source_dir, "test_a02_01.cj")}', output=output_main))

on_execute(cj(output_main))