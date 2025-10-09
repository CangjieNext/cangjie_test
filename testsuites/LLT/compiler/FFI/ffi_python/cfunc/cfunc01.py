# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# File test.py
# If you want transfer pointer type to @C function, you need import ctypes.
from ctypes import *

# `foo` get a function pointer and call it.
def foo(func):
    func(True, 10, 40)

# `fooptr` get a function pointer and call it with pointer type args.
def fooptr(func):
    a = c_int(10)
    # c_char_p will get whole symbols, but c_wchar_p only get first one symbol 'd'.
    func(pointer(a), c_char_p(b'abc'), c_wchar_p('def'))