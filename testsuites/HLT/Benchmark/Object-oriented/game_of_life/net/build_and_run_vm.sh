#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$TOTAL_REPEATS" ]; then
  TOTAL_REPEATS=3
fi

rm -f run.log
cp ../data.txt .

echo "Running .NET in VM mode:"
dotnet publish --use-current-runtime -o publish-vm/ -c Release
# 768 MiB = 805306368 B = 0x30000000 B
DOTNET_GCHeapHardLimit="30000000" ./publish-vm/GameOfLife $TOTAL_REPEATS 2>&1 | tee -a run.log
echo "-----------------"
