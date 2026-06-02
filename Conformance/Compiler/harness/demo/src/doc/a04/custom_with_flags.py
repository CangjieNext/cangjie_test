# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description: Implemented driver for compilation & execution
             interoperability c test
'''

def my_handler(self, test, result):
    if 'string=abcde' not in str(result.stdout).lower():
        result.stdout += b'Output is wrong'
        test.result = 'failed'

on_compile(
  f'{self.cfg.cc}
    {self.cfg.cc_flags}
    -c {os.path.join(source_dir, "putsi.c")} '
  f'-o {os.path.join(output_dir, "putsi.o")}')

on_compile(
  f'{self.cfg.cjc}
    --import-path {source_dir}
    {self.cfg.cjc_flags}
    -p {source_dir}'
  f'{os.path.join(output_dir, "putsi.o")}
    --output-type=exe
    --output-dir {output_dir}
    -o {bin_name}')

on_execute(f'{os.path.join(output_dir, bin_name)}',
           output_contains='string=abcde',
           handler=my_handler)