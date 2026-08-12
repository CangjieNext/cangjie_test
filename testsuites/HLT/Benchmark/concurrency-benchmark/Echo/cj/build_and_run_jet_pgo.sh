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
    export parallelism=32
fi

source $JET_DIR_BETA/envsetup.sh
args=$@

JETOPTION="-Djet.cj.use.fibers -Djet.fiber.carrier.count=$parallelism -Djet.fiber.syscalls.control.disable=true"

$JET_DIR_BETA/bin/cjc --int-overflow wrapping echo.cj -o echo.cbc
JETVMPROP="-Djet.profiler $JETOPTION" cj ./echo.cbc $args 2>&1 > /dev/null 2>&1
$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=echo.cbc.jprof" --int-overflow wrapping echo.cj -o echo.cbc > /dev/null 2>&1

rm -f run.log

JETVMPROP=$JETOPTION cj ./echo.cbc $args 2>&1 | tee -a run.log
