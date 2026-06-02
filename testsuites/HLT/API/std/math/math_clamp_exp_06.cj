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
        println("Float16:max is nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float16(5.83), Float16(8.98), Float16(nan16)))
        println("Float16:max is -nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float16(5.83), Float16(8.98), Float16(-nan16)))
        println("Float32:max is nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float32(5.83), Float32(8.98), Float32(nan32)))
        println("Float32:max is -nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float32(5.83), Float32(8.98), Float32(-nan32)))
        println("Float64:max is nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float64(5.83), Float64(8.98), Float64(nan64)))
        println("Float64:max is -nan:throw exception")
        @ExpectThrows[IllegalArgumentException](clamp(Float64(5.83), Float64(8.98), Float64(-nan64)))
    }
}
