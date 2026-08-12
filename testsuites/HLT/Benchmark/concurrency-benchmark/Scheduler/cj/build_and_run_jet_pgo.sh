#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR_BETA" ]; then
  JET_DIR_BETA=
fi
if [ "$parallelism" == "" ]; then
    if [ "$args" == "preempt" ]; then
      parallelism=4
    else
      parallelism=32
    fi
fi

source $JET_DIR_BETA/envsetup.sh
args=$@

$JET_DIR_BETA/bin/cjc --int-overflow wrapping Scheduler.cj -o Scheduler.cbc
JETOPTIONS="-Djet.cj.use.fibers -Djet.fiber.carrier.count=$parallelism -Djet.fiber.syscalls.control.disable=true" 
JETVMPROP="-Djet.profiler $JETOPTIONS" cj ./Scheduler.cbc $args 2>&1 > /dev/null 2>&1
$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=Scheduler.cbc.jprof" --int-overflow wrapping Scheduler.cj -o Scheduler.cbc > /dev/null 2>&1

rm -f run.log

JETVMPROP="$JETOPTIONS" cj ./Scheduler.cbc $args 2>&1 | tee -a run.log
