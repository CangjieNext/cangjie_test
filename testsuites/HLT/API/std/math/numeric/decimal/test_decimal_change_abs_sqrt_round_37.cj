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

import std.math.numeric.*
import std.math.*
import std.collection.*

var sum = 0

@Test
class Test_decimal_change_abs_sqrt_round_37 {
    @TestCase
    func test_decimal_change_abs_sqrt_round_01(): Unit {
        let dec1 = Decimal(-100i8)
        let dec2 = Decimal(3200i16)
        @Expect(round(dec1, roundingMode: Ceiling).toString(), "-100")
        @Expect(abs(dec1).toString(), "100")
        @Expect(sqrt(dec2).toString(), "56.56854249492380195206754896838792")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_02(): Unit {
        let dec1 = Decimal(-29000i16)
        let dec2 = Decimal(421232435u32)
        @Expect(round(dec1, roundingMode: Down).toString(), "-29000")
        @Expect(abs(dec1).toString(), "29000")
        @Expect(sqrt(dec2).toString(), "20523.94784148507818459244687852529")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_03(): Unit {
        let dec1 = Decimal(0i32)
        let dec2 = Decimal(0u64)
        @Expect(round(dec1, roundingMode: Floor).toString(), "0")
        @Expect(abs(dec1).toString(), "0")
        @Expect(sqrt(dec2).toString(), "0")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_04(): Unit {
        let dec1 = Decimal(-10372847387i64)
        let dec2 = Decimal(65500.0914739353f16)
        @Expect(round(dec2, roundingMode: HalfEven).toString(), "65504")
        @Expect(abs(dec1).toString(), "10372847387")
        @Expect(sqrt(dec2).toString(), "255.9374923687422549722202275038354")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_05(): Unit {
        let dec1 = Decimal(BigInt("-13824376"), 0)
        let dec2 = Decimal(-120.834783f32)
        @Expect(round(dec1, roundingMode: HalfUp).toString(), "-13824376")
        @Expect(abs(dec1).toString(), "13824376")
        let e = @AssertThrows[IllegalArgumentException](sqrt(dec2))
        @Expect(e.message, "Negative decimal cannot be squared.")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_06(): Unit {
        let dec1 = Decimal(0.1733332f16)
        let dec2 = Decimal(100.98329847387f32)
        @Expect(round(dec1, roundingMode: Up).toString(), "1")
        @Expect(abs(dec1).toString(), "0.17333984375")
        @Expect(sqrt(dec2).toString(), "10.04904469366969696681353519643664")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_07(): Unit {
        let dec1 = Decimal(2i8)
        let dec2 = Decimal(9i16)
        @Expect(round(dec1, roundingMode: Ceiling).toString(), "2")
        @Expect(abs(dec1).toString(), "2")
        @Expect(sqrt(dec2).toString(), "3")
    }

    @TestCase
    func test_decimal_change_abs_sqrt_round_08(): Unit {
        let dec1 = Decimal.parse("0.000")
        let dec2 = Decimal.parse("0")
        let dec3 = Decimal(0)
        let dec4 = Decimal.parse("0.0")
        let dec5 = Decimal.parse("0.00")
        @Expect(round(dec1, roundingMode: Down).toString(), "0")
        @Expect(round(dec2, roundingMode: Down).toString(), "0")
        @Expect(round(dec3, roundingMode: Down).toString(), "0")
        @Expect(abs(dec1).toString(), "0.000")
        @Expect(abs(dec2).toString(), "0")
        @Expect(abs(dec3).toString(), "0")
        @Expect(sqrt(dec1).toString(), "0.0")
        @Expect(sqrt(dec2).toString(), "0")
        @Expect(sqrt(dec3).toString(), "0")
        @Expect(sqrt(dec4).toString(), "0")
        @Expect(sqrt(dec5).toString(), "0.0")
    }
}
