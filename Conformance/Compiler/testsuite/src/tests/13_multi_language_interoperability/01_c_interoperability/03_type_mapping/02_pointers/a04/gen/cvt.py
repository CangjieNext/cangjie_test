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
template_neg_cj = env.get_template("cvt_neg.cj.tpl")
template_c = env.get_template("cvt.c.tpl")
n = 1
output_dir = os.path.normpath(os.path.join(os.getcwd(), ".."))

ctypes = {
  "Unit":       ("void",     "",                        ""),
  "Int8":       ("int8_t",   "-77",                     "-77i8"),
  "UInt8":      ("uint8_t",  "128",                     "128u8"),
  "Int16":      ("int16_t",  "-32000",                  "-32000i16"),
  "UInt16":     ("uint16_t", "64000",                   "64000u16"),
  "Int32":      ("int32_t",  "-2000000000",             "-2000000000i32"),
  "UInt32":     ("uint32_t", "4000000000UL",            "4000000000u32"),
  "Int64":      ("int64_t",  "-9000000000000000000LL",  "-9000000000000000000i64"),
  "UInt64":     ("uint64_t", "18000000000000000000ULL", "18000000000000000000u64"),
  "UIntNative": ("size_t",   "2000000000",              "2000000000"),
  "Float32":    ("float",    "1.41421356237",           "1.41421356237f32"),
  "Float64":    ("double",   "1.41421356237",           "1.41421356237f64"),
}

def gen_cvt_pos(src, dst):
    global n
    testname = "test_a04_" + format(n, "02d")
    path = os.path.join(output_dir, testname)
    os.makedirs(path)
    testfile = os.path.join(path, testname + ".cj")
    global template_cj, template_c
    with open(testfile, 'w') as f:
        content = template_cj.render(dict(Dst=dst, Src=src, EVal=ctypes[dst][2], num=format(n, "02d")))
        f.write(content)
    testfile = os.path.join(path, "test.c")
    with open(testfile, 'w') as f:
        content = template_c.render(dict(Dst=ctypes[dst][0], Src=ctypes[src][0], Val=ctypes[dst][1]))
        f.write(content)
    shutil.copy("custom.py", path)
    shutil.copy("custom.json", path)

def gen_cvt_neg(src, dst):
    global n
    testname = "test_a04_" + format(n, "02d")
    testfile = os.path.join(output_dir, testname + ".cj")
    global template_neg_cj
    with open(testfile, 'w') as f:
        content = template_neg_cj.render(dict(Dst=dst, Src=src, num=format(n, "02d")))
        f.write(content)

for dst in ctypes.keys():
    for src in ctypes.keys():
        if dst != src:
            gen_cvt_pos(src, dst)
            n += 1

for dst in ctypes.keys():
    for src in ctypes.keys():
        gen_cvt_neg(src, dst)
        n += 1
