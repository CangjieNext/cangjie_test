#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

./$1
result=$?
unset cjHeapSize
unset JETVMPROP
if [ $result -eq 139 -o $result -eq 134 ];then
   exit 1
elif [ $result -eq -1 -o $result -eq 1 -o $result -eq 0 ];then
   exit 3
else
   exit 1
fi
