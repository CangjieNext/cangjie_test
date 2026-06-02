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
  out = result.stdout.decode('utf-8').strip()
  err = result.stderr

  out = str(result.stdout)
  idx1 = out.find('The context state is Ended')
  idx2 = out.find('Exception: could not create a thread to a closed context')
  if not (idx2 > idx1 and idx1 > -1):
    result.stdout += b'Invalid output'
    test.result = 'failed'

on_compile(cjc(option = '--output-type=cbc' if self.cfg.is_jet else '--output-type=exe', source=f'-p "{source_dir}"',
           output=output_bin))

on_execute(output_bin, output_contains=None, handler=my_handler)
