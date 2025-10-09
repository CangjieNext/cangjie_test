# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

def function01(a = 1):
    print("function01 call.")
    print("a is", a)

def function02(b, c = 1):
    print("function02 call.")
    print("b is", b)
    print("c is", c)

def function03(d, e, f = 1, g = 2):
    print("function03 call.")
    print("d is", d)
    print("e is", e)
    print("f is", f)
    print("g is", g)
