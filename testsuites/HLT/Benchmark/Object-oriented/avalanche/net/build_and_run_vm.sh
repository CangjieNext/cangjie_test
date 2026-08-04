#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


rm -f run.log

if [ -z "$ITERATION_PER_THREAD" ]; then
  ITERATION_PER_THREAD=100000000
fi

if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

if [ -z "$THREADS_ARRAY" ]; then
  THREADS_ARRAY="1 8 16 32"
fi

echo "Running .NET in VM mode:"
dotnet publish --use-current-runtime -o publish-vm/ -c Release

ts=("$THREADS_ARRAY")

for t in ${ts[*]}
do
  # 1 GiB = 1073741824 B = 0x40000000 B
  DOTNET_GCHeapHardLimit="40000000" ./publish-vm/Avalanche $ITERATION_PER_THREAD "$t" $TOTAL_REPEATS 2>&1 | tee -a run.log
done

echo "-----------------"
