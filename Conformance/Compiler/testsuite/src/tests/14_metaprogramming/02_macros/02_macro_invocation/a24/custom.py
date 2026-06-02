# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

from os.path import join, dirname
from os import name as os_name
from os import makedirs


macro_option = '--compile-macro'
  

def my_handler(self, test, result):
  strs = ['Compiling the macro `Twice`', 'Compiling the macro `Joint`', 'Compiling the macro `MacroWithoutParens`']
  if not all(substring.lower() in str(result.stdout).lower() for substring in strs):
    result.stdout += b'Output is wrong'
    test.result = 'failed'

macro_output = join(output_dir, 'default')
makedirs(macro_output, exist_ok=True)

on_compile(cjc(option=f'--import-path "{output_dir}" {macro_option} ', source=join(source_dir, 'aux_macros_01.cj'),
               output=macro_output))

depends = self.default_libs_arg + f' --import-path "{macro_output}" '

on_compile(f'{self.cfg.cjc} {self.cfg.cjc_flags} --import-path "{output_dir}" "{join(source_dir, "test_a24_01.cj")}" '
           f'{depends} '
           f'{"--output-type=cbc" if self.cfg.is_jet else "--output-type=exe"} -o "{output_bin}"',
           handler=my_handler)
