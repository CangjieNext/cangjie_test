/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --option_tests=3 --option_tests=2

@UnittestOption[Int64, Int32, UInt8](option_tests)

@Test
class Test_UnittestOptions {
    @TestCase
    @Configure[option_tests: 123]
    @Configure[option_tests: 123i32]
    @Configure[option_tests: 0u8]
    func test_unittestOptions(): Unit {
    }
}
