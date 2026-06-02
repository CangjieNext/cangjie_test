# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import gen_prefix
import gen_infix
import gen_postfix

counter = 1
dir = os.path.dirname(os.path.realpath(__file__))
path = dir + '/test_' + os.path.basename(dir) + '_{}.cj'

counter = gen_prefix.gen(path, counter)
counter = gen_infix.gen(path, counter)
counter = gen_postfix.gen(path, counter)