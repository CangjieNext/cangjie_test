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

let dec1 = Decimal.parse("1")
let dec2 = Decimal.parse("1e1")

@Test
class Test_decimal_property_uint32_11 {
    @TestCase
    func test_decimal_uint32_01(): Unit {
        let dec = Decimal(-0u32)
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
    func test_decimal_uint32_02(): Unit {
        let dec = Decimal(UInt32.Max)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("4294967295"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 10)
        @Expect(dec.toString(), "4294967295")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_03(): Unit {
        let dec = Decimal(UInt32.Min)
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
    func test_decimal_uint32_04(): Unit {
        let dec = Decimal(UInt32.Max).roundWithPrecision(3, roundingMode: Up)
        let dec1 = Decimal.parse("1e7")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("430"))
        @Expect(dec.scale, -7)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "4300000000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_05(): Unit {
        let dec = Decimal(122u32).roundWithPrecision(100, roundingMode: Down)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("122"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "122")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_06(): Unit {
        let dec = Decimal(4560u32).roundWithPrecision(3, roundingMode: Ceiling)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("456"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "4560")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_07(): Unit {
        let dec = Decimal(5112u32).roundWithPrecision(3, roundingMode: Floor)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("511"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "5110")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_08(): Unit {
        let dec = Decimal(5112u32).roundWithPrecision(3, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("511"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "5110")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_09(): Unit {
        let dec = Decimal(6435u32).roundWithPrecision(3, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("644"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "6440")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint32_10(): Unit {
        let dec = Decimal(64355u32).roundWithPrecision(4, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("6436"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "64360")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }
}
