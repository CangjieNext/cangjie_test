# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

def my_handler(self, test, result):
  if 'This function is defined in Cangjie.' not in str(result.stdout):
    result.stdout += b'Output is wrong'
    test.result = 'failed'

on_compile(cjc(f' -p {source_dir}',
               option = '--output-type=cbc' if self.cfg.is_jet else '--output-type=exe',
               output = output_bin))
on_execute(cj(output_bin), handler=my_handler)
