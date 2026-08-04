#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



SCRIPT_DIR=$(dirname $(readlink -f "$0"))
export BENCHROOT=${SCRIPT_DIR}/..

if [ ! -d ${BENCHROOT} ]; then
  echo "[ERROR]: no BENCHROOT!!!" && exit 1
fi

CJ_VM=$(which cj)
if [ $? != 0 ]; then
  echo "[ERROR]: no cj in PATH!!!" && exit 1
fi

# run benchmarks-game - jet_vm
cd ${BENCHROOT}
cp benchmarks-game/makefiles/my.linux.ini_jet_vm benchmarks-game/makefiles/my.linux.ini
cp benchmarks-game/makefiles/my.linux.Makefile_jet_vm benchmarks-game/makefiles/my.linux.Makefile

# only test cj/go
sed -i 's/cj go swift cj_compile/cj go/' benchmarks-game/makefiles/my.linux.ini

cd ${BENCHROOT}/benchmarks-game
cp ../scripts/prepare_input.sh .
rm -rf tmp; mkdir tmp
source prepare_input.sh
export JETVMPROP="-Xmx2G" && python2 bin/bencher.py
cp tmp/all_measurements.csv jet_vm.csv

