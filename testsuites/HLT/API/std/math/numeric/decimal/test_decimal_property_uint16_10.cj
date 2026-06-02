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
let dec2 = Decimal.parse("1e2")

@Test
class Test_decimal_property_uint16_10 {
    @TestCase
    func test_decimal_uint16_01(): Unit {
        let dec = Decimal(0u16)
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
    func test_decimal_uint16_02(): Unit {
        let dec = Decimal(UInt16.Min)
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
    func test_decimal_uint16_03(): Unit {
        let dec = Decimal(UInt16.Max)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("65535"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(), "65535")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_04(): Unit {
        let dec = Decimal(12220u16).roundWithPrecision(3, roundingMode: Up)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("123"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "12300")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_05(): Unit {
        let dec = Decimal(12220u16).roundWithPrecision(3, roundingMode: Down)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("122"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "12200")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_06(): Unit {
        let dec = Decimal(65500u16).roundWithPrecision(3, roundingMode: Ceiling)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("655"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "65500")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_07(): Unit {
        let dec = Decimal(65510u16).roundWithPrecision(3, roundingMode: Floor)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("655"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "65500")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_08(): Unit {
        let dec = Decimal(65510u16).roundWithPrecision(3, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("655"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "65500")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint16_09(): Unit {
        let dec = Decimal(65510u16).roundWithPrecision(2)
        let dec1 = Decimal.parse("1e3")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("66"))
        @Expect(dec.scale, -3)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "66000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }
}
