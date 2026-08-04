#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys

time_str = sys.argv[1]
time_num = float(time_str[:-2])  # 取出数值部分
time_unit = time_str[-2:]  # 取出单位部分

if time_unit == "ns":
    result = time_num
elif time_unit == "us":
    result = time_num * 1000
elif time_unit == "ms":
    result = time_num * 1000000
elif time_str[-1:] == "s":
    result = float(time_str[:-1]) * 1000000000
else:
    print("输入的时间单位不正确！")
    exit()

print(result, "ns/op")