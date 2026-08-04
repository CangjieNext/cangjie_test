#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



# How to run:
#   export OUTPUT=<absolute path of result.csv>
#   export JET_DIR=
#   export LLVM_GC_DIR=
#   export LOOM_DIR=
#   ./test.sh [cj/jet | cj/jet/pgo | cj/llvmgc | cj/llvmgc/lto | go | java | loom]
set -x
source ./env.sh

#TEST_LANG=(cj/jet cj/jet/pgo cj/llvmgc go java)
TEST_LANG=($@)

TEST_DIR=tmp
TEST_CASE=(EnterExit PerThreadMemUsage ProducerConsumer StartEndCost Scheduler WaitNotifyExtended Echo)

rm -rf $TEST_DIR
mkdir $TEST_DIR

cd $TEST_DIR

echo "OUTPUT: ${OUTPUT}"
echo "JET: ${JET_DIR}"
echo "JET_BETA: ${JET_DIR_BETA}"
echo "LLVMGC: ${LLVM_GC_DIR}"

cp ../env.sh ./
for case in ${TEST_CASE[@]}
do
  cp -r ../${case} ./
  cd ${case}
  echo "${case}:"
  chmod +x ./test.sh
  bash ./test.sh "${TEST_LANG[*]}"
  cd ..
done
