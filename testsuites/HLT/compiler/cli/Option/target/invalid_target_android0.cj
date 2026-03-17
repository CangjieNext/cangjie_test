/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESC: 测试target为安卓时，后缀编号非法的场景
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android&#! -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) ASSERT: scan The OS "android" is not found or supported!

main() {}
