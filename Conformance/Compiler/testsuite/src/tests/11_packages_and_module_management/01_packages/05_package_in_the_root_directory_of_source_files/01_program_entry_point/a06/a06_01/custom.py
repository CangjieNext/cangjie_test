# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.5.1.a06_01
'''

from os.path import join, dirname, exists
from os import makedirs, listdir
from os import name as os_name
import shutil

def my_handler(self, test, result):
  global out_dir
  if os.listdir(os.path.join(out_dir)) != []:
    result.stdout += b"Something went wrong! Found files in ~/a06/pkg1/"
    test.result = "failed" 

if self.cfg.is_jet:
  bin_ext = '.cbc'
elif os_name == 'nt':
  bin_ext = '.exe'
else:
  bin_ext = ''

root_dir    = "pkg1"
out_dir     = join(output_dir, "pkg1")

if exists(out_dir):
    shutil.rmtree(out_dir)

makedirs(out_dir, exist_ok=True)

output_main = join(out_dir, f'test_a06_01{bin_ext}')

on_compile(cjc(option=f'{"--output-type=cbc" if self.cfg.is_jet else "--output-type=exe"} ', 
               source=f' -p {join(source_dir, root_dir)}', output=output_main), handler=my_handler)
