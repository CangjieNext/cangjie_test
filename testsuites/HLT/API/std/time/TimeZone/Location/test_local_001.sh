#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

location=`date +%Z`
b=`date -R`
str=${b: 0-5:5}
sym=${str: 0-5:1}
hour=${str: 0-4:2}
minute=${str: 0-2:2}
second=`expr $hour \* 3600 + $minute / 60 \* 3600`

if [ "$sym" = "-" ];
then
	offset="-$second"
else
	offset=$second
fi

echo $offset
