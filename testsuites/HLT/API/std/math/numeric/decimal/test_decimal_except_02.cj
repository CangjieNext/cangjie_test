/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*
import std.math.*
import std.collection.*

var sum = 0

@Test
class Test_decimal_except_02 {
    func printRoundingMode(roundingMode: RoundingMode): String {
        match (roundingMode) {
            case RoundingMode.Up => "Up"
            case RoundingMode.Down => "Down"
            case RoundingMode.Ceiling => "Ceiling"
            case RoundingMode.Floor => "Floor"
            case RoundingMode.HalfEven => "HalfEven"
            case RoundingMode.HalfUp => "HalfUp"
        }
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_decimal_string_01(): Unit {
        try {
            let dec = Decimal.parse("+10c+2")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow contains other character"))
            sum += 1
        }
        @Expect(sum, 1)

        try {
            let dec = Decimal.parse("10e")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow without digits after e"))
            sum += 1
        }
        @Expect(sum, 2)

        try {
            let dec = Decimal.parse("abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow contains other character beyond"))
            sum += 1
        }
        @Expect(sum, 3)

        try {
            let dec = Decimal.parse("#$%")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow contains other character beyond"))
            sum += 1
        }
        @Expect(sum, 4)

        try {
            let dec = Decimal.parse("\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow contains other character beyond"))
            sum += 1
        }
        @Expect(sum, 5)

        try {
            let dec = Decimal.parse("*10e+2")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("String value not allow contains other character beyond"))
            sum += 1
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_decimal_float16_02(): Unit {
        try {
            let dec = Decimal(Float16.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            let dec = Decimal(-Float16.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            let dec = Decimal(Float16.NaN)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_decimal_float32_03(): Unit {
        try {
            let dec = Decimal(Float32.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            let dec = Decimal(-Float32.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            let dec = Decimal(Float32.NaN)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_decimal_float64_04(): Unit {
        try {
            let dec = Decimal(Float64.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 1)

        try {
            let dec = Decimal(-Float64.Inf)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 2)

        try {
            let dec = Decimal(Float64.NaN)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Float value cannot be Inf or NaN.")
            sum += 1
        }
        @Expect(sum, 3)
    }
}
