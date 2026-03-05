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
        println("Float64:x<1:throw exception")
        @ExpectThrows[IllegalArgumentException](acosh(Float64(0.9)))
        println("Float64:x=-inf64:throw exception")
        @ExpectThrows[IllegalArgumentException](acosh(-inf64))
    }
}
