# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
 
import sys
import shutil

key = "Found lib:"


def parse_default_lib(x, target):
    with open(x, 'r') as f:
        content = f.readlines()
        srf = ""
        for c in content:
            if key in c:
                print(c)
                srf = c[c.index(key) + len(key):].strip()[:-1]
        shutil.copy(srf, './' + target)


if __name__ == '__main__':
    x = sys.argv
    parse_default_lib(x[1], x[2])
