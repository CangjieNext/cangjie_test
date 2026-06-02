# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os, sys

j_file = "cjpm.toml.bak"
res_file = "cjpm.toml"
if not os.path.exists(j_file):
    print("{} not exist!".format(j_file))
    sys.exit(1)
if os.path.exists(res_file):
    print("{} existed!".format(res_file))
    sys.exit(1)
current_path = os.path.abspath(__file__)
father_path = os.path.abspath(os.path.dirname(current_path))
father_path = os.path.join(father_path, '..')
father_path = os.path.join(father_path, 'c')
new_content = ''
with open(j_file, 'r') as f:
    contents = f.readlines()
    for content in contents:
        if "replaceme" in content:
            content = content.replace('replaceme', father_path)
        content = content.replace("\\", "\\\\")
        new_content += content
with open(res_file, 'w') as f:
    f.write(new_content)
    print('cjpm.toml generated!')
