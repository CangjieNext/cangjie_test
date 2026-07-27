#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

OHOS_ROOT=/c/home/jenkins/workspace/Workload_Daily_OHOS/ohos_stripped
export CANGJIE_HOME=/c/home/jenkins/workspace/Workload_Daily_OHOS/Cangjie/cangjie
export PATH=${CANGJIE_HOME}/bin:${CANGJIE_HOME}/tools/bin:$PATH
export LD_LIBRARY_PATH=${CANGJIE_HOME}/runtime/lib/linux_ohos_aarch64_llvm:${LD_LIBRARY_PATH}
if [ -d ${CANGJIE_HOME}/debugger ]; then
    export PATH=${CANGJIE_HOME}/debugger/bin:$PATH
    export LD_LIBRARY_PATH=${CANGJIE_HOME}/debugger/third_party/lldb/lib:${LD_LIBRARY_PATH}
fi

if_apc=

if [ "$1" == "APC" ]
then 
    if_apc=--apc
fi

cjc \
--target=aarch64-linux-ohos \
-B${OHOS_ROOT}/out/generic_generic_arm_64only/hisi_all_phone_standard/obj/third_party/musl/usr/lib/aarch64-linux-ohos \
-B${OHOS_ROOT}/prebuilts/clang/ohos/windows-x86_64/llvm/bin \
-L${OHOS_ROOT}/prebuilts/clang/ohos/windows-x86_64/llvm/lib/clang/15.0.4/lib/aarch64-linux-ohos \
-L${OHOS_ROOT}/prebuilts/clang/ohos/windows-x86_64/llvm/lib/aarch64-linux-ohos \
-L${OHOS_ROOT}/out/generic_generic_arm_64only/hisi_all_phone_standard/obj/third_party/musl/usr/lib/aarch64-linux-ohos \
--sysroot ${OHOS_ROOT}/out/generic_generic_arm_64only/hisi_all_phone_standard/obj/third_party/musl \
-O2 --no-sub-pkg --dy-std -s ${if_apc} -o $3 \
$2 