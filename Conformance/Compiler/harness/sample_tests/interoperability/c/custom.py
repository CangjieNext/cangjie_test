# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for compilation & execution interoperability c test
'''

from os.path import join


def my_handler(self, test, result):
  if 'string=abcde' not in str(result.stdout).lower():
    result.stdout += b'Output is wrong'
    test.result = 'failed'


on_compile(cc(option='-c', source=join(source_dir, 'putsi.c'), output=join(output_dir, 'putsi.o')))
on_compile(cjc(option='--output-type=exe', source=f'-p "{source_dir}" "{join(output_dir, "putsi.o")}"', output=output_bin))
on_execute(output_bin, output_contains='string=abcde', handler=my_handler)
