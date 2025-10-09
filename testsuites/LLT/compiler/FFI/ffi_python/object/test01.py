# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

a = 10
b = 20.1
c = True
d = "string in python"

def func01():
    print("func01 called.")

def func02(param1, param2):
    print("func02 with ", param1, " and ", param2)
    print("param1 is ", type(param1))
    print("param2 is ", type(param2))
    return param1 + param2

class A:
    def __str__(self):
        return "A class"

class B:
    def __str__(self):
        return "B class"

class C:
    def __str__(self):
        print("C class __str__ without return.")

pylist = ['1', "2", 3, 4.5, False]
pyset = {'Array', 'a', 1, 1.1}