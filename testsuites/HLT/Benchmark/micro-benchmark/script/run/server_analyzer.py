#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import json
import sys

filepath = sys.argv[1]
# 读取json文件
with open(filepath, 'r') as f:
    data = json.load(f)

# 提取medianResTime数据并输出
for key, value in data.items():
    median_res_time = value['meanResTime'] * 1000000
    print(f"{key}: {median_res_time} ns/op")
