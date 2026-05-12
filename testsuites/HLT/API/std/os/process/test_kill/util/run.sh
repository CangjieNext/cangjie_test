#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

run="$1"

pkill -9 -f "test.out" 2>/dev/null || true
sleep 0.1

clang test.c -o test.out
nohup ./test.out > /dev/null 2>&1 &
echo $! > test.txt

sleep 0.2

pid=`eval $run`

if [ -n "$pid" ]; then
  echo "pass1"
  str=`ps -p "$pid" -o comm= 2>/dev/null`
  if [ -n "$str" ] && echo "$str" | grep -q "test.out"; then
    echo "pass3"
  else
    echo "pass2"
  fi
fi

pkill -9 -f "test.out" 2>/dev/null || true
