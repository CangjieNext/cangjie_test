#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

LOOP_N = 20000

with open("parameters_arguments_in_one_func.cj", "a") as f:
    f.write("func parameters_arguments_in_one_func(")
    for i in range(LOOP_N - 1):
        f.write("a{}: Int64, ".format(i))
    f.write("a{}: Int64".format(LOOP_N - 1))
    f.write("): Unit {\nprint(")
    for i in range(LOOP_N - 1):
        f.write("a{} + ".format(i))
    f.write("a{}".format(LOOP_N - 1))
    f.write(")\n}\n")
    f.write("main() {\nparameters_arguments_in_one_func(")
    for i in range(LOOP_N - 1):
        f.write("{}, ".format(1))
    f.write("1")
    f.write(")\nreturn 1\n}\n")

