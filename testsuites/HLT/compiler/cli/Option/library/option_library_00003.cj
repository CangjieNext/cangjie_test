/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.c
// EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// ERRCHECK: %compiler %cmp_opt %f --library-path . --output %output
// (target_linux) ASSERT: scan undefined reference to `printHello'
// (target_mac & !target_ohos & !target_android) ASSERT: scan undefined symbol: _printHello
// (target_win | target_ohos | target_android) ASSERT: scan undefined symbol: printHello

foreign func printHello(): Unit

main() {
    unsafe {
        printHello()
    }
    return 0
}
// ASSERT: regex-not no position error occurred
