# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.5.1.a7_02
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

root_dir    = "pkg1"
output_dir     = join(output_dir, "pkg1")

makedirs(output_dir, exist_ok=True)

output_main = join(output_dir, f'test_a07_01{bin_ext}')

on_compile(cjc(option=f'{"--output-type=cbc" if self.cfg.is_jet else "--output-type=exe"} ',
               source=f' -p {join(source_dir, root_dir)}', output=output_main))
