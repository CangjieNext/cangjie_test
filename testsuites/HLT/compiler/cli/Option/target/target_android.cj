/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// 测试target为安卓时，不同安卓API Level时的cjc命令行为
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android-1 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android0 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android1 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android25 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android26 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android10000 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) EXEC-PIPE-1: %compiler --target=aarch64-linux-android10001 -B=%prebuilt-toolchain/bin --sysroot=%prebuilt-toolchain/sysroot %f -o %output 2>&1 | compare %f
// (target_android) ASSERT: scan The Android API level is not supported in the target. Please use a valid API level which is larger than 26.

func test() {
    var a = "HEllO"
    var b: UInt8 = 0
    for (i in a where Int64(i) == 72) {
        b += i
        if (Int64(b) == 72) {
            break
        }
    }
    return b
}

main() {
    if (Int64(test()) == 72) {
        return 0
    } else {
        return 1
    }
    return 1
}
