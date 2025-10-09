# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

class MyIntegral():
    def __add__(self, other):
        if isinstance(other, MyIntegral):
            print("MyIntegral add")
            return self
        else:
            return NotImplemented

    def __radd__(self, other):
        if isinstance(other, MyIntegral):
            print("MyIntegral radd")
            return self
        else:
            return NotImplemented
