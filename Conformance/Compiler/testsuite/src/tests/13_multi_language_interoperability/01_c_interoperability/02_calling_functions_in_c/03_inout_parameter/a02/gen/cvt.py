#!/usr/bin/env python3
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import jinja2
import os
import shutil
from jinja2 import Environment, PackageLoader, select_autoescape

env = Environment(
    loader=jinja2.FileSystemLoader('.'),
    autoescape=False,
    trim_blocks=True
)

template_cj = env.get_template("cvt.cj.tpl")
n = 1
output_dir = os.path.normpath(os.path.join(os.getcwd(), ".."))

ctypes = {
  "Bool":       ("_Bool",    "0",                       "false",                   "true"),
  "Int8":       ("int8_t",   "-77",                     "-77i8",                   "66i8"),
  "UInt8":      ("uint8_t",  "128",                     "128u8",                   "255u8"),
  "Int16":      ("int16_t",  "-32000",                  "-32000i16",               "32000i16"),
  "UInt16":     ("uint16_t", "64000",                   "64000u16",                "777u16"),
  "Int32":      ("int32_t",  "-2000000000",             "-2000000000i32",          "666i32"),
  "UInt32":     ("uint32_t", "4000000000UL",            "4000000000u32",           "777u32"),
  "Int64":      ("int64_t",  "-9000000000000000000LL",  "-9000000000000000000i64", "123456789i64"),
  "UInt64":     ("uint64_t", "18000000000000000000ULL", "18000000000000000000u64", "123456789u64"),
  "UIntNative": ("size_t",   "2000000000",              "2000000000",              "9876543210"),
  "Float32":    ("float",    "1.41421356237",           "1.41421356237f32",        "-3.14159265359f32"),
  "Float64":    ("double",   "1.41421356237",           "1.41421356237f64",        "-3.14159265359f64"),
}

def gen_cvt_ptr(ty):
    global n
    testname = "test_a02_" + format(n, "02d")
    testfile = os.path.join(output_dir, testname + ".cj")
    global template_cj
    with open(testfile, 'w') as f:
        content = template_cj.render(dict(CJType=ty, Val1=ctypes[ty][2], Val2=ctypes[ty][3], num=format(n, "02d")))
        f.write(content)

for ty in ctypes.keys():
    gen_cvt_ptr(ty)
    n += 1
