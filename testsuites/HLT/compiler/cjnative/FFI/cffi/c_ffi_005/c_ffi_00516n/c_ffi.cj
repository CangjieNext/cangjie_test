/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// (!(target_ios | target_ios_simulator)) EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f
// (target_mac | target_ohos) ASSERT: scan error: undefined symbol: _testfunc1
// (target_win | target_android) ASSERT: scan error: undefined symbol: testfunc1
// (target_linux) ASSERT: scan undefined reference to `testfunc1'
// (target_ios | target_ios_simulator) EXEC: %compiler %cmp_opt %ffic_opt -o %output
// (target_ios | target_ios_simulator) RUN-EXEC-PIPE-255: %run %run_opt %output %run_args 2>&1 | compare %f
// (target_ios | target_ios_simulator) ASSERT: scan Undefined symbols for architecture
// (target_ios | target_ios_simulator) ASSERT: scan "_testfunc1", referenced from:

foreign func testfunc1(): Unit

main(): Int64 {
    unsafe { testfunc1() }
    return 0
}

// ASSERT: regex-not no position error occurred
