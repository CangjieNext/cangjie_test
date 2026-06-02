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
        println("Float16:min>max and min>v>max")
        @ExpectThrows[IllegalArgumentException](clamp(Float16(45.83), Float16(125.98), Float16(9.45)))
        println("Float16:min>max and v=nan")
        @ExpectThrows[IllegalArgumentException](clamp(Float16(nan16), Float16(125.98), Float16(9.45)))
        println("Float16:min>max and v=inf")
        @ExpectThrows[IllegalArgumentException](clamp(Float16(inf16), Float16(125.98), Float16(9.45)))
        println("Float32:min>max and min>v>max")
        @ExpectThrows[IllegalArgumentException](clamp(Float32(45.83), Float32(125.98), Float32(9.45)))
        println("Float32:min>max and v=nan")
        @ExpectThrows[IllegalArgumentException](clamp(Float32(nan32), Float32(125.98), Float32(9.45)))
        println("Float32:min>max and v=inf")
        @ExpectThrows[IllegalArgumentException](clamp(Float32(inf32), Float32(125.98), Float32(9.45)))
        println("Float64:min>max and min>v>max")
        @ExpectThrows[IllegalArgumentException](clamp(Float64(45.83), Float64(125.98), Float64(9.45)))
        println("Float64:min>max and v=nan")
        @ExpectThrows[IllegalArgumentException](clamp(Float64(nan64), Float64(125.98), Float64(9.45)))
        println("Float64:min>max and v=inf")
        @ExpectThrows[IllegalArgumentException](clamp(Float64(inf64), Float64(125.98), Float64(9.45)))
    }
}
