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

import os
from os.path import join

def my_handler(self, test, result):
  if 'foo' not in str(result.stdout):
    result.stdout += b'Output is wrong'
    test.result = 'failed'

# 平台相关的配置
if os.name == 'nt':
    shared_lib_ext = '.dll'
    cc_shared_flags = '-shared -Wl,--export-all-symbols'
    lib_name = 'libfoo.dll'
else:
    shared_lib_ext = '.so'
    cc_shared_flags = '-shared -fPIC'
    lib_name = 'libfoo.so'

lib_path = join(output_dir, lib_name)

# 编译共享库
on_compile(cc(option=cc_shared_flags, source=join(source_dir, 'foo.c'), output=lib_path))

# 配置cjc链接选项
if self.cfg.is_jet:
    cjc_linking_option = '--output-type=cbc'
else:
    cjc_linking_option = f'-L {output_dir} --output-type=exe'

# 编译主程序
on_compile(cjc(option=cjc_linking_option, source=f'-p "{source_dir}" -lfoo', output=output_bin))

# 执行测试
on_execute(cj(output_bin), output_contains='foo', handler=my_handler)
