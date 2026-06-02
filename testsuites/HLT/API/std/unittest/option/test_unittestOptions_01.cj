/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC-0: %run %run_opt %output %run_utest_opt %run_args --option_tests="a" --option_tests=2

@UnittestOption[String, UInt64](option_tests)

@Test
class Test_UnittestOptions {
    @TestCase
    @Configure[option_tests: "123"]
    @Configure[option_tests: 0u64]
    func test_unittestOptions(): Unit {
    }
}
