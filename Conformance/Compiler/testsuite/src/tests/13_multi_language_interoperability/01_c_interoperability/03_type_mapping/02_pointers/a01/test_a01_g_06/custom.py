# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
loc_cc_flags=''
if sys.platform != "win32":
    loc_cc_flags = ' -shared -fPIC'
on_compile(f'{self.cfg.cc}' +
           f' {self.cfg.cc_flags}' +
           loc_cc_flags +
           f' {os.path.join(source_dir, "test.c")}' +
           f' -o {os.path.join(output_dir, "libfunc.so")}')
on_compile(cjc(f' -p {source_dir}' +
               f' -lfunc',
               option = '--output-type=cbc' if self.cfg.is_jet else f'-L {output_dir} --output-type=exe',
               output = output_bin))
on_execute(cj(output_bin))

