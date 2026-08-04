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

dotnet publish --use-current-runtime -o publish-aot/ -c Release -p:PublishAot=true

# Two warmup runs
./publish-aot/NCEIterator $TOTAL_REPEATS > /dev/null 2>&1
./publish-aot/NCEIterator $TOTAL_REPEATS > /dev/null 2>&1

echo "Running .NET in AOT mode:"
./publish-aot/NCEIterator $TOTAL_REPEATS 2>&1 | tee -a run.log
echo "-----------------"
