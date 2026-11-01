# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import subprocess
import sys

cjpm = sys.argv[1]
try:
    r = subprocess.run([cjpm, 'init', '--name', 'a' * 30000, '--path', 'test_long_name_cli'])
    print('returncode:', r.returncode)
    sys.exit(r.returncode)
except OSError as e:
    print('OSError:', e)
    sys.exit(0)
