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
        println("x*y<-9223372036854775808:throw exception")
        @ExpectThrows[IllegalArgumentException](lcm(Int64(-4611686018427387905), Int64(2)))
        println("x*y>9223372036854775807:throw exception")
        @ExpectThrows[IllegalArgumentException](lcm(Int64(4611686018427387907), Int64(2)))
    }
}
