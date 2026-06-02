#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

LOOP_N = 20000
with open("multi_return.cj", "a") as f:
    f.write("main() {\n")
    f.write("return " * LOOP_N)
    f.write("}\n")
