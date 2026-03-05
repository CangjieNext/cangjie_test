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
        println("Float32:x<-1:throw exception")
        @ExpectThrows[IllegalArgumentException](asin(Float32(-1.1)))
        var m1 = println("Float32:x>1:throw exception")
        @ExpectThrows[IllegalArgumentException](asin(Float32(1.1)))
        println("Float32:x=-inf32:throw exception")
        @ExpectThrows[IllegalArgumentException](asin(Float32(-inf32)))
        println("Float32:x=inf32:throw exception")
        @ExpectThrows[IllegalArgumentException](asin(Float32(inf32)))
    }
}
