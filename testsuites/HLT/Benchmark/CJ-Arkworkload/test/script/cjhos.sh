#!/bin/sh

# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# Set ndk_path
NDK_ROOT=/home/xuyihang/ndk_version/android-ndk-r25c
export PATH=${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH
export CANGJIE_HOME=/home/xuyihang/cangjie_version/ohos/hos1206before/output/

hw_arch=$(arch)
export PATH=${CANGJIE_HOME}/bin:${CANGJIE_HOME}/tools/bin:$PATH
export LD_LIBRARY_PATH=${CANGJIE_HOME}/runtime/lib/linux_${hw_arch}_llvm:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${CANGJIE_HOME}/third_party/llvm/lldb/lib:${LD_LIBRARY_PATH}
unset hw_arch

if [ "$1" == "PGOFIRST" ]
then    
    cjc \
    --target=aarch64-linux-android31 \
    --sysroot ${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/ \
    -O2 --pgo-instr-gen -o $3 \
    $2
elif [ "$1" == "PGOSECOND" ]
then
    cjc \
    --target=aarch64-linux-android31 \
    --sysroot ${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/ \
    -O2 --pgo-instr-use=$2 -o $4 \
    $3
elif [ "$1" == "CLOSED" ]
then
    cjc \
    --target=aarch64-linux-android31 \
    --sysroot ${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/ \
    -O2 -o $3 \
    $2
elif [ "$1" == "TransProfdata" ]
then
    ${CANGJIE_HOME}/third_party/llvm/bin/llvm-profdata \
    merge -o $3 \
    $2
fi
