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


def my_handler(self, test, result):
  if 'string=abcde' not in str(result.stdout).lower():
    result.stdout += b'Output is wrong'
    test.result = 'failed'


on_compile(f'echo "hello from on_compile simplePyRunner unittest" >{output_bin}', output_contains='abcde')
on_execute(f'cat {output_bin}', output_contains='abcde', handler=my_handler)
