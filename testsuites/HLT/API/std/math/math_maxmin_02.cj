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
var int16_1: Int16 = Int16.Min
var int16_2: Int16 = Int16.Max
var int8_3: Int8 = 0
var fla_1: Float16 = Float16.Min
var fla_2: Float16 = Float16.Max
var int64_1: Int64 = Int64.Min
var int64_2: Int64 = Int64.Max
var int64_3: Int64 = 5
var int64_4: Int64 = 5

@Test
class Test_math {
    @TestCase
    func test_int8_MaxMinValue_01(): Unit {
        @Expect(int8_1 +int8_2, -1)
        @Expect(20-10, 10)
        @Expect(50 *2, 100)
        @Expect(int8_2/int8_1,0)
        @Expect(-int8_2,-127)
        try {
            int8_1 * 2
        } catch (e: OverflowException) {
            @Expect(e.toString(), "OverflowException: mul")
        }
        try {
            int8_1 - int8_2
        } catch (e: OverflowException) {
            @Expect(e.toString(), "OverflowException: sub")
        }
    }

    @TestCase
    func test_int16_Integer_01(): Unit {
        @Expect(int16_1 %int16_2, -1)
        @Expect(20 &10, 0)
        @Expect(50 *2, 100)
        @Expect(int16_2|int16_1,-1)
        @Expect(-int16_2^2,-32765)
        @Expect(!50,-51)
        @Expect(int16_2 >> int64_3,1023)
        @Expect(int16_1 << int64_3,0)
        @Expect(Int64.isSigned(),true)
        try {
            int16_2 >> int64_2
        } catch (e: ArithmeticException) {
            @Expect(e.toString(), "ArithmeticException: Overshift: Value of right operand is greater than or equal to the width of left operand!")
        }
        try {
            int16_2 << int64_1
        } catch (e: ArithmeticException) {
            @Expect(e.toString(), "ArithmeticException: Overshift: Negative shift count!")
        }
    }
}
