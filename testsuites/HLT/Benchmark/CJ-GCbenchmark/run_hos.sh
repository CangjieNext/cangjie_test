# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set -xe
#mkdir cj_result
#mkdir cj_result
touch ./java_result/run.sh
echo "" > ./java_result/run.sh
echo "huawei" | sudo -S rm -rf java_result/*
echo "huawei" | sudo -S rm -rf cj_result/*
echo "huawei" | sudo -S rm -rf java_result.tar
echo "huawei" | sudo -S rm -rf cj_result.tar

python3 run_oh_benchmark.py
echo "huawei" | sudo -S chmod -R 777 *
cd ${WORKSPACE}/code/Cangjie-test/testsuites/HLT/Benchmark/CJ-GCbenchmark/java_result
bash ./run.sh

#tar -cvf cj_result.tar cj_result
#tar -cvf java_result.tar java_result




