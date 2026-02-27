/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.overflow.*
import std.math.*

var int8_1: Int8 = Int8.Min
var int8_2: Int8 = Int8.Max
var int8_3: Int8 = 0
var int8_4: Int8 = 5
var fla_1: Float16 = Float16.Min
var fla_2: Float16 = Float16.Max

@Test
class Test_math {
    @TestCase
    func test_int8_MaxMinValue_01(): Unit {
        @Expect(Int8.getMax(), int8_2)
        @Expect(Int8.getMin(), int8_1)
    }

    @TestCase
    func test_fla16_FloatingPoint_01(): Unit {
        @Expect(Float16.getPI(), 3.14062)
        @Expect(Float16.getE(), 2.71875)
        @Expect(Float32.getPI(), 3.14159274)
        @Expect(Float32.getE(), 2.71828175)
        @Expect(Float64.getPI(), 3.141592653589793116)
        @Expect(Float64.getE(), 2.7182818284590450908)
        @Expect(Float16.getNaN().toString(), Float16.NaN.toString())
        @Expect(Float16.getInf(), Float16.Inf)
        @Expect(Float16.getMinDenormal(), 5.96046e-08)
        @Expect(Float16.getMinNormal(), 6.10352e-05)
        @Expect(fla_1.isInf(), false)
        @Expect(fla_1.isNaN(), false)
        @Expect(fla_1.isNormal(), true)
    }

    @TestCase
    func test_int16_FloatingPoint_01(): Unit {
        @Expect(int8_1 +int8_2, -1)
        @Expect(int8_2 -int8_4, 122)
        @Expect(int8_4 *2, 10)
        @Expect(int8_2/int8_1,0)
        @Expect(-int8_2, -127)
    }
}
