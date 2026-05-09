# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys

def main() -> None:
    file_path = sys.argv[1]
    with open(file_path, 'r', encoding='utf-8', newline='') as f:
        content = f.read()
    
    content = content.replace('\r', '')

    with open(file_path, 'w', encoding='utf-8', newline='') as f:
        f.write(content)

if __name__ == '__main__':
    main()
