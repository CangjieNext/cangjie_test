# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
File: custom.py

Description:
Driver for passing command-line arguments
'''

from os.path import join

on_compile(cjc(source=f'"{join(source_dir, "test_a01_02.cj")}"', output=output_bin))
on_execute(cj(output_bin, args='hello'))
