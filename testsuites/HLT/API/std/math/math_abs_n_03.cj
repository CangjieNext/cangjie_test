/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.*

@Test
class TestMath {
    @TestCase
    func testCase0(): Unit {
        @ExpectThrows[OverflowException](abs(Int8(-128)))
        @ExpectThrows[OverflowException](abs(Int16(-32768)))
        @ExpectThrows[OverflowException](abs(Int32(-2147483648)))
        @ExpectThrows[OverflowException](abs(Int64(-9223372036854775808)))
    }
}
