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
        println("Float16:x<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float16(-1), Float16(9)))
        println("Float16:y<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float16(1), Float16(-1)))
        println("Float16:x=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float16(0), Float16(9)))
        println("Float16:y=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float16(1), Float16(0)))
        println("Float32:x<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float32(-1), Float32(9)))
        println("Float32:y<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float32(1), Float32(-1)))
        println("Float32:x=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float32(0), Float32(9)))
        println("Float32:y=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float32(1), Float32(0)))
        println("Float64:x<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float64(-1), Float64(9)))
        println("Float64:y<0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float64(1), Float64(-1)))
        println("Float64:x=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float64(0), Float64(9)))
        println("Float64:y=0:throw exception")
        @ExpectThrows[IllegalArgumentException](logBase(Float64(1), Float64(0)))
    }
}
