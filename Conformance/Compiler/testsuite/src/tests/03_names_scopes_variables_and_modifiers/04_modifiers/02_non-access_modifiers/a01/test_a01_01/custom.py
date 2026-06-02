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

from os.path import join

def my_handler(self, test, result):
  if 'Hello world!' not in str(result.stdout):
    result.stdout += b'Output is wrong'
    test.result = 'failed'

on_compile(cc(option='-shared -fPIC', source=join(source_dir, 'hw.c'), output=join(output_dir, 'libhw.so')))
on_compile(cjc(option = '--output-type=cbc' if self.cfg.is_jet else f'-L {output_dir} --output-type=exe', source=f'-p "{source_dir}" -lhw ',
           output=output_bin))
on_execute(cj(output_bin), output_contains='Hello world!', handler=my_handler)
