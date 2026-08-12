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

# run benchmarks-game - jet
cd ${BENCHROOT}
cp benchmarks-game/makefiles/my.linux.ini_jet benchmarks-game/makefiles/my.linux.ini
cp benchmarks-game/makefiles/my.linux.Makefile_jet benchmarks-game/makefiles/my.linux.Makefile

mkdir -p ${BENCHROOT}/jprofs

# only test cj
sed -i 's/cj go swift cj_compile/cj/' benchmarks-game/makefiles/my.linux.ini

cd ${BENCHROOT}/benchmarks-game
cp ../scripts/prepare_input.sh .

# first run: profile
echo "[INFO]: JET PGO: profile"
# it's just profiling, no need to run multi-times
sed -i 's/runs = 3/runs = 1/' makefiles/my.linux.ini
rm -rf tmp; mkdir tmp
source prepare_input.sh
export JETVMPROP="-Xmx2g -Djet.jprof.dir.path=${BENCHROOT}/jprofs -Djet.profiler" && python2 bin/bencher.py

# second run: run with jprof
echo "[INFO]: JET PGO: run with jprof"
cp makefiles/my.linux.Makefile_jet_pgo makefiles/my.linux.Makefile
sed -i 's/runs = 1/runs = 3/' makefiles/my.linux.ini
rm -rf tmp; mkdir tmp
source prepare_input.sh
export JETVMPROP="-Xmx2G" && python2 bin/bencher.py
cp tmp/all_measurements.csv pgo.csv
