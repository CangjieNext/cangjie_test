/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESC: 测试target为安卓时，不同安卓API Level时的cjc命令行为，小于或等于25，大于或等于10001的API Level将导致报错不支持该API Level
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android0 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android1 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android25 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// API Level26无问题
// (target_android) EXEC: %compiler --target=aarch64-linux-android26 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android10001 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) ASSERT: scan The Android API level is not supported in the target. Please use a valid API level which is larger than 26.

main() {}
