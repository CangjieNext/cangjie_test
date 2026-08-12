#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


if [ -z "$JET_DIR" ]; then
  JET_DIR=
fi
if [ "$parallelism" == "" ]; then
    export parallelism=32
fi

source $JET_DIR/envsetup.sh
$JET_DIR/bin/cjc --int-overflow wrapping echo.cj -o echo.cbc

rm -f run.log

args=$@

JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=$parallelism -Djet.fiber.syscalls.control.disable=true" cj ./echo.cbc $args 2>&1 | tee -a run.log