# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
    Special driver to test output after main will exit
'''

def my_handler(self, test, result):
  if 'Print after sleep' in str(result.stdout):
    result.stdout += b'Thread execution wasn\'t interrupted'
    test.result = 'failed'

on_compile(cjc(option = '--output-type=cbc' if self.cfg.is_jet else '--output-type=exe', source=f'-p "{source_dir}"',
           output=output_bin))

on_execute(cj(output_bin), output_contains=None, handler=my_handler)
