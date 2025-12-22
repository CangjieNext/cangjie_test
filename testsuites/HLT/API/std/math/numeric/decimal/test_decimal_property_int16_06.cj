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

let dec1 = Decimal(1)
let dec2 = Decimal.parse("1e1")
let dec3 = Decimal.parse("1e2")

@Test
class Test_decimal_property_int16_06 {
    @TestCase
    func test_decimal_int16_01(): Unit {
        let dec = Decimal(0i16)
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
    func test_decimal_int16_02(): Unit {
        let dec = Decimal(Int16.Max)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("32767"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(), "32767")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_03(): Unit {
        let dec = Decimal(Int16.Min)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-32768"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(), "-32768")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_04(): Unit {
        let dec = Decimal(0).roundWithPrecision(5, roundingMode: Up)
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
    func test_decimal_int16_05(): Unit {
        let dec = Decimal(32711i16).roundWithPrecision(4, roundingMode: Up)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("3272"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "32720")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_06(): Unit {
        let dec = Decimal(-32711i16).roundWithPrecision(3, roundingMode: Up)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-328"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "-32800")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_07(): Unit {
        let dec = Decimal(15321i16).roundWithPrecision(4, roundingMode: Down)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1532"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "15320")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_08(): Unit {
        let dec = Decimal(-15321i16).roundWithPrecision(5, roundingMode: Down)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-15321"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(), "-15321")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_09(): Unit {
        let dec = Decimal(Int16.Max).roundWithPrecision(3, roundingMode: Ceiling)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("328"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "32800")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_10(): Unit {
        let dec = Decimal(Int16.Min).roundWithPrecision(4, roundingMode: Ceiling)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-3276"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "-32760")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_11(): Unit {
        let dec = Decimal(12345i16).roundWithPrecision(2, roundingMode: Floor)
        let dec1 = Decimal.parse("1e3")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12"))
        @Expect(dec.scale, -3)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "12000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_12(): Unit {
        let dec = Decimal(-32761i16).roundWithPrecision(1, roundingMode: Floor)
        let dec1 = Decimal.parse("1e4")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-4"))
        @Expect(dec.scale, -4)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "-40000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_13(): Unit {
        let dec = Decimal(12345i16).roundWithPrecision(4, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1235"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "12350")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_14(): Unit {
        let dec = Decimal(-12345i16).roundWithPrecision(4, roundingMode: HalfUp)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-1235"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "-12350")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_15(): Unit {
        let dec = Decimal(-12555i16).roundWithPrecision(3, roundingMode: HalfEven)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-126"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "-12600")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_16(): Unit {
        let dec = Decimal(12345i16).roundWithPrecision(4, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1234"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "12340")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int16_17(): Unit {
        let dec = Decimal(-12345i16).roundWithPrecision(4, roundingMode: HalfEven)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-1234"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 4)
        @Expect(dec.toString(), "-12340")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }
}
