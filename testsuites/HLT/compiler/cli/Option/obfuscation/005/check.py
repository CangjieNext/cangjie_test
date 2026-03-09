#
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
#

import sys

a = int(sys.argv[1])
b = int(sys.argv[2])

print(f'sys.argv[1] = {a}, sys.argv[2] = {b}')

if a - b > 0:
    exit(0)
else:
    exit(1)
