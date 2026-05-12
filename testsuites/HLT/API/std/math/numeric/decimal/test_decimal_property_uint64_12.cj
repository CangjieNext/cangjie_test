/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*
import std.math.*
import std.collection.*

@Test
class Test_decimal_property_uint64_12 {
    @TestCase
    func test_decimal_uint64_01(): Unit {
        let dec = Decimal(0u64)
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, 0)
        @Expect(dec.value, BigInt("0"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "0")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_02(): Unit {
        let dec = Decimal(UInt64.Min)
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, 0)
        @Expect(dec.value, BigInt("0"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "0")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_03(): Unit {
        let dec = Decimal(UInt64.Max)
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("18446744073709551615"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 20)
        @Expect(dec.toString(), "18446744073709551615")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_04(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(18, roundingMode: Up)
        let dec1 = Decimal.parse("1e2")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("184467440737095517"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 18)
        @Expect(dec.toString(), "18446744073709551700")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_05(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(18, roundingMode: Down)
        let dec1 = Decimal.parse("1e2")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("184467440737095516"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 18)
        @Expect(dec.toString(), "18446744073709551600")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_06(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(10, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e10")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1844674408"))
        @Expect(dec.scale, -10)
        @Expect(dec.precision, 10)
        @Expect(dec.toString(), "18446744080000000000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_07(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(11, roundingMode: Floor)
        let dec1 = Decimal.parse("1e9")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("18446744073"))
        @Expect(dec.scale, -9)
        @Expect(dec.precision, 11)
        @Expect(dec.toString(), "18446744073000000000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_08(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(12, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e8")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("184467440737"))
        @Expect(dec.scale, -8)
        @Expect(dec.precision, 12)
        @Expect(dec.toString(), "18446744073700000000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint64_09(): Unit {
        let dec = Decimal(UInt64.Max).roundWithPrecision(13, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e7")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1844674407371"))
        @Expect(dec.scale, -7)
        @Expect(dec.precision, 13)
        @Expect(dec.toString(), "18446744073710000000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }
}
