/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESC: 测试target为安卓时，不同安卓API Level时的cjc命令行为，其中Level为从36（目前安卓API Level最高支持到35）开始到10000，这个范围内预期找不到相应工具链而报错
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android36 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android9999 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android10000 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) ASSERT: scan ld.lld: error:
// (target_android) ASSERT: scan unable to find library

main() {}
