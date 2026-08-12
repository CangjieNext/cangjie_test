#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ "$parallelism" == "" ]; then
    export parallelism=32
fi

go build -o WaitNotify WaitNotifyBase.go WaitNotifyBench.go WaitNotifyChannel.go WaitNotifySingleLock.go

rm -f run.log

args=$@

GOMAXPROCS=$parallelism ./WaitNotify $args 2>&1 | tee -a run.log
