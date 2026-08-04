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

args=$@

JETOPTION="-Djet.cj.use.fibers -Djet.fiber.carrier.count=$parallelism -Djet.fiber.syscalls.control.disable=true" 

source $JET_DIR_BETA/envsetup.sh
$JET_DIR_BETA/bin/cjc --int-overflow wrapping SynchProdCons.cj -o SynchProdCons.cbc
JETVMPROP="-Djet.profiler $JETOPTION" cj ./SynchProdCons.cbc $args 2>&1 > /dev/null 2>&1
$JET_DIR_BETA/bin/cjc --jc-options="+pgo -jprofile=SynchProdCons.cbc.jprof" --int-overflow wrapping SynchProdCons.cj -o SynchProdCons.cbc > /dev/null 2>&1

rm -f run.log

JETVMPROP=$JETOPTION cj ./SynchProdCons.cbc $args 2>&1 | tee -a run.log
