# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys

if os.name == 'nt':
    shared_lib_ext = '.dll'
    cc_shared_flags = '-shared -Wl,--export-all-symbols'
    cjc_linking_option = f'-L {output_dir} --output-type=exe'
else:
    shared_lib_ext = '.so' 
    cc_shared_flags = '-shared -fPIC'
    cjc_linking_option = f'-L {output_dir} --output-type=exe'

if self.cfg.is_jet:
    cjc_linking_option = '--output-type=cbc'

lib_name = f'libfunc{shared_lib_ext}'
lib_path = os.path.join(output_dir, lib_name)

on_compile(f'{self.cfg.cc} '
           f'{self.cfg.cc_flags} '
           f'{cc_shared_flags} '
           f'"{os.path.join(source_dir, "test.c")}" '
           f'-o "{lib_path}"')

cjc_options = f'-p "{source_dir}" -lfunc {cjc_linking_option}'

on_compile(cjc(cjc_options, output=output_bin))
on_execute(cj(output_bin))
