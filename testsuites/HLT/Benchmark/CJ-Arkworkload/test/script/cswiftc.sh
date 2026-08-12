#!/bin/bash 
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

file=$1
out=$2
NDK_ROOT=/home/ndk_version/android-ndk-r25c
SWIFT_ROOT=/home/xuyihang/swift_version/swift-5.7.3-RELEASE-ubuntu20.04
SWIFT_ANDROID_SDK=/home/swift-release-android-aarch64-24-sdk
${SWIFT_ROOT}/usr/bin/swiftc \
    -tools-directory ${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/bin/ \
    -target aarch64-unknown-linux-android24 \
    -sdk ${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/   \
    -resource-dir ${SWIFT_ANDROID_SDK}/usr/lib/swift $file  -O -whole-module-optimization -o $out
