# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
 
# call cj func here.
from ctypes import *

def foo(func):
    func(pointer(c_int8(1)),pointer(c_int8(1)),pointer(c_int16(1)),pointer(c_int32(1)),pointer(c_int64(1)),
    pointer(c_uint8(1)),pointer(c_uint16(1)),pointer(c_uint32(1)),pointer(c_uint64(1)),
    pointer(c_float(0.1)),pointer(c_double(0.1)),pointer(c_char(b'1')),pointer(c_bool(True)))