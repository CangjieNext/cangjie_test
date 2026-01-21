# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import json
import subprocess
import os
import shutil
import time
import argparse
from datetime import datetime

android_project_dir_path = os.path.join(os.environ['CANGJIE_TEST'], 'testsuites/HLT/configs/cjnative/android/MyApplication')

if __name__ == '__main__':
    test_case_dir_path = os.getcwd()
    p = os.path.join(android_project_dir_path, 'app/src/main/java/UNNAMED')
    if os.path.exists(p):
        shutil.rmtree(p)
    shutil.copyfile(os.path.join(os.environ['JAVA_INTEROP_UTIL'], 'logger.cj'), os.path.join(os.getcwd(), 'logger.cj'))
    android_java_dir_path = os.path.join(android_project_dir_path, 'app/src/main/java')
    hello_dir_path = os.path.join(android_java_dir_path, 'com/example/myapplication')
    # shutil.rmtree(hello_dir_path)
    os.makedirs(hello_dir_path, exist_ok=True)
    shutil.copyfile(os.path.join(os.environ['JAVA_INTEROP_SCRIPTS'], 'Logger.java'), os.path.join(test_case_dir_path, 'Logger.java'))
    shutil.copyfile(os.path.join(test_case_dir_path, 'Logger.java'), os.path.join(hello_dir_path, 'Logger.java'))