#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


rm -f run.log

if [ -z "$ITERATIONS" ]; then
  ITERATIONS=30000
fi

if [ -z "$REPEATS" ]; then
  REPEATS=3
fi

echo "Running .NET in VM mode:"
dotnet publish --use-current-runtime -o publish-vm/ -c Release
./publish-vm/Complex $ITERATIONS $REPEATS 0 2>&1 | tee -a run.log
./publish-vm/Complex $ITERATIONS $REPEATS 1 2>&1 | tee -a run.log
echo "-----------------"
