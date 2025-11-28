# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys

# 根据平台确定共享库扩展名和编译选项
if os.name == 'nt':  # Windows
    shared_lib_ext = '.dll'
    cc_shared_flags = '-shared -Wl,--export-all-symbols'
    cjc_linking_option = f'-L {output_dir} --output-type=exe'
else:  # Linux/Unix
    shared_lib_ext = '.so' 
    cc_shared_flags = '-shared -fPIC'
    cjc_linking_option = f'-L {output_dir} --output-type=exe'

# 如果是 Jet 模式（字节码），调整输出类型
if self.cfg.is_jet:
    cjc_linking_option = '--output-type=cbc'

# 编译 C 动态库
lib_name = f'libfunc{shared_lib_ext}'
lib_path = os.path.join(output_dir, lib_name)

on_compile(f'{self.cfg.cc} '
           f'{self.cfg.cc_flags} '
           f'{cc_shared_flags} '
           f'"{os.path.join(source_dir, "test.c")}" '
           f'-o "{lib_path}"')

# 编译主程序，链接动态库
cjc_options = f'-p "{source_dir}" -lfunc {cjc_linking_option}'

# Windows 特定：如果需要显式导出符号，添加 --shared 选项
if os.name == 'nt' and not self.cfg.is_jet:
    cjc_options += ' --shared'

on_compile(cjc(cjc_options, output=output_bin))

# 执行测试
on_execute(cj(output_bin))