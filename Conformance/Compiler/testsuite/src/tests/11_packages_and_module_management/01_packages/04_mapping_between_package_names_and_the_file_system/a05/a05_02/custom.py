# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Implemented driver for test 11.1.4.a05_02
'''

from os.path import join, dirname, exists
from os import makedirs, listdir
from os import name as os_name
import shutil

def no_valid_files_handler(self, test, result):
    global out_dir
    if os.listdir(os.path.join(out_dir)) != []:
        test.result = "failed" 

root_dir = "src"
out_dir  = join(output_dir, 'src', 'build', 'default')

if exists(out_dir):
    shutil.rmtree(out_dir)

pkg_dir = join(source_dir, "src", "directory_0")
pkg_out = join(output_dir, 'src', 'build', 'default', 'libdir0.a')
makedirs(dirname(pkg_out), exist_ok=True)

on_compile(cjc(option=f'--import-path {join(output_dir, "src", "build")} --output-type=staticlib',
           source=f'-p "{pkg_dir}"', output=pkg_out), handler=no_valid_files_handler)
