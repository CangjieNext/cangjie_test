#!/bin/sh
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

OHOS_ROOT=/d/work/ohos-1025/ohos-1025
export CANGJIE_HOME=/d/Tools/cangjie_version/win_ohos_daily/daily_test
export PATH=${CANGJIE_HOME}/bin:${CANGJIE_HOME}/tools/bin:$PATH
export LD_LIBRARY_PATH=${CANGJIE_HOME}/runtime/lib/linux_x86_64_llvm:${LD_LIBRARY_PATH}
if [ -d ${CANGJIE_HOME}/debugger ]; then
    export PATH=${CANGJIE_HOME}/debugger/bin:$PATH
    export LD_LIBRARY_PATH=${CANGJIE_HOME}/debugger/third_party/lldb/lib:${LD_LIBRARY_PATH}
fi

cjc \
--target=aarch64-linux-ohos \
-B${OHOS_ROOT}/out/rk3568/obj/third_party/musl/usr/lib/aarch64-linux-ohos \
-B${OHOS_ROOT}/prebuilts/clang/ohos/linux-x86_64/llvm/bin \
-L${OHOS_ROOT}/prebuilts/clang/ohos/linux-x86_64/llvm/lib/clang/12.0.1/lib/aarch64-linux-ohos \
-L${OHOS_ROOT}/prebuilts/clang/ohos/linux-x86_64/llvm/lib/aarch64-linux-ohos \
-L${OHOS_ROOT}/out/rk3568/obj/third_party/musl/usr/lib/aarch64-linux-ohos \
--sysroot ${OHOS_ROOT}/out/rk3568/obj/third_party/musl \
-O2 -o $2 \
$1 
