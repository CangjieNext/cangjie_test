# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys
import platform

def get_trim_path(pwd, cj_file, c):
    if cj_file == "trim_path4":
        return pwd.rsplit(c, 1)[0]  # 截取最后一个 '\' 前的路径 'D:\asd\qwe\zxc' => 'D:\asd\qwe'
    elif cj_file == "trim_path5":
        return pwd.rsplit(c, 1)[0][:-1]  # 截取最后一个 '\' 前的路径并且最后一级的目录去掉一个字符 'D:\asd\qwe\zxc' => 'D:\asd\qw'
    elif cj_file == "trim_path6":
        return pwd.split(c, 1)[0]  # windows 用例上截取第一个斜杠前的盘符 'D:\asd\qwe\zxc' => 'D:'
    elif cj_file == "trim_path7":
        return c + pwd.split(c, 2)[1] # windows 用例上截取路径中第一个目录字符串，最前方再加上一个 '\', 'D:\asd\qwe\zxc' => '\asd'
    else:
        return pwd

cj_file = sys.argv[1]
suffix = sys.argv[2]
pwd = os.getcwd()

if platform.system().lower() == "windows":
    trim_path = get_trim_path(pwd, cj_file, "\\")
else:
    trim_path = get_trim_path(pwd, cj_file, "/")

cmp_opt = "--error-count-limit=10000 --diagnostic-format=noColor"

cmd = f"cjc {cj_file}.cj {cmp_opt} --trimpath {trim_path} -o {cj_file}.{suffix}"
print(cmd)
os.system(cmd)

