# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# File cfunc02.py

# Import args_processor extended module and convert the argument list of the callback function to c_void_p.
import args_processor
from ctypes import *

# `foo` get a function pointer and call it.
def foo(func):
    # 1. convert argument list to c_void_p
    mixed_list = [
        42,                             # int
        "hello",                        # str
        (123, "str", [1, 2, 3]),        # tuple
        {"name": "Alice", "age": 26},   # dict
        [4, 5, 6],                      # list
        bool(True),                     # bool
        3.14,                           # float
        {7, 8, 9},                      # set
        slice(1, 5, 2),                 # slice
    ]
    pyobj_list = args_processor.process_list(mixed_list)
    # 2. call func
    func(pyobj_list)
    # 3. release pyobj_list
    args_processor.release_list(pyobj_list)