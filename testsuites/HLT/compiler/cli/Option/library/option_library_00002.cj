/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.c
// (target_ios | target_ios_simulator) EXEC: %clang %clang_opt -o test.o test.c && ar rcs libtest.%test_suffix test.o
// (!(target_ios | target_ios_simulator)) EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// (!(target_ios | target_ios_simulator)) EXEC-PIPE-1: %compiler %cmp_opt %f --library test --output %output 2>&1 | compare %f
// (target_ios | target_ios_simulator) EXEC: %compiler %cmp_opt %f --library test --output %output
// (target_linux) ASSERT: scan cannot find -ltest
// (target_mac) ASSERT: scan library not found for -ltest
// (target_android | target_ohos) ASSERT: scan unable to find library -ltest

foreign func printHello(): Unit

main() {
    unsafe {
        printHello()
    }
    return 0
}
// ASSERT: regex-not no position error occurred
