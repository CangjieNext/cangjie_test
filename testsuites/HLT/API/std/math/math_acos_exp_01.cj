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
        println("Float16:x<-1:throw exception")
        @ExpectThrows[IllegalArgumentException](acos(-1.1))
        println("Float16:x>1:throw exception")
        @ExpectThrows[IllegalArgumentException](acos(1.1))
        println("Float16:x=inf16:throw exception")
        @ExpectThrows[IllegalArgumentException](acos(inf16))
        println("Float16:x=-inf16:throw exception")
        @ExpectThrows[IllegalArgumentException](acos(-inf16))

    }
}
