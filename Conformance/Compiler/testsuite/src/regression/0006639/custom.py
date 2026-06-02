# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

def typo_check(self, test, result):
  errs = result.stderr
  if b'defintion' in errs or b'Declareation' in errs:
    result.stdout += b'A typo(s) were found in the compilation error'
    test.result = 'Failed'

on_compile(cjc(source=test.test_path, output=output_bin, option="--enable-ad"), handler=typo_check)
