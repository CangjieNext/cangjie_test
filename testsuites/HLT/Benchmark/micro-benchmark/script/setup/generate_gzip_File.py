#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import time
import random
def generategzipFile(sizeFile):
    filename="gzipL%d"%(sizeFile)
    file=open('../../cj/gzip/%s'%filename,'w')
    for i in range(0,sizeFile):
        value=random.randint(0,999999999)
        file.write(str(value))

if __name__ == '__main__':
    length=[32,256,2 * 1024,16 * 1024,128 * 1024,1 * 1024 * 1024,8 * 1024 * 1024,64 * 1024 * 1024]
    for i in length:
        generategzipFile(i)