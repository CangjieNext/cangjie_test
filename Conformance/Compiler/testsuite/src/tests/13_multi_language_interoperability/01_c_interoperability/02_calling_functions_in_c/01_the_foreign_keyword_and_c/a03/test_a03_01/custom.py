# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

on_compile(f'{self.cfg.cc}' +
           f' {self.cfg.cc_flags}' +
           f' -shared -fPIC' +
           f' {os.path.join(source_dir, "test.c")}' +
           f' -o {os.path.join(output_dir, "libfunc.so")}')
on_compile(f'{self.cfg.cjc}' +
           f' -p {source_dir}' +
           f' -lfunc' +
           f' {self.default_libs_arg} ' +
           f' {"--output-type=cbc" if self.cfg.is_jet else "-L " + output_dir + " --output-type=exe"} ' +
           f' -o {output_bin}')
on_execute(cj(output_bin))
