#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



if [ -z "$ITERATIONS" ]; then
  ITERATIONS=30000
fi

if [ -z "$REPEATS" ]; then
  REPEATS=3
fi

rm -f run.log

go build complex.go

./complex $ITERATIONS $REPEATS 0 | tee -a run.log
./complex $ITERATIONS $REPEATS 1 | tee -a run.log
