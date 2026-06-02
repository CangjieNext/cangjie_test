#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

echo $1
echo $2
let a=$1-$2
echo $a
if [ $a -gt 0 ];
  then
    exit 0
else
    exit 1
fi
