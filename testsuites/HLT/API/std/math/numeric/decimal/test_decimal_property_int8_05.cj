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

let dec1 = Decimal(1)
let dec2 = Decimal.parse("1e1")
let dec3 = Decimal.parse("1e2")

@Test
class Test_decimal_property_int8_05 {
    @TestCase
    func test_decimal_int8_01(): Unit {
        let dec = Decimal(Int8.Max)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("127"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "127")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_02(): Unit {
        let dec = Decimal(Int8.Min)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-128"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "-128")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_03(): Unit {
        let dec = Decimal(0)
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
    func test_decimal_int8_04(): Unit {
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
    func test_decimal_int8_05(): Unit {
        let dec = Decimal(121).roundWithPrecision(2, roundingMode: Up)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("13"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "130")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_06(): Unit {
        let dec = Decimal(-125).roundWithPrecision(2, roundingMode: Up)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-13"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "-130")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_07(): Unit {
        let dec = Decimal(0).roundWithPrecision(5, roundingMode: Down)
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
    func test_decimal_int8_08(): Unit {
        let dec = Decimal(-115).roundWithPrecision(2, roundingMode: Down)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-11"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "-110")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_09(): Unit {
        let dec = Decimal(116).roundWithPrecision(2, roundingMode: Down)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("11"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "110")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_10(): Unit {
        let dec = Decimal(-122).roundWithPrecision(2, roundingMode: Ceiling)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-12"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "-120")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_11(): Unit {
        let dec = Decimal(122).roundWithPrecision(2, roundingMode: Ceiling)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("13"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "130")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_12(): Unit {
        let dec = Decimal(95).roundWithPrecision(1, roundingMode: Floor)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("9"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "90")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_13(): Unit {
        let dec = Decimal(-111).roundWithPrecision(1, roundingMode: Floor)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-2"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "-200")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_14(): Unit {
        let dec = Decimal(95).roundWithPrecision(1, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_15(): Unit {
        let dec = Decimal(-95).roundWithPrecision(2, roundingMode: HalfUp)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-95"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "-95")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_16(): Unit {
        let dec = Decimal(-114).roundWithPrecision(2, roundingMode: HalfEven)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-11"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "-110")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_17(): Unit {
        let dec = Decimal(96).roundWithPrecision(1, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1"))
        @Expect(dec.scale, -2)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec3)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_18(): Unit {
        let dec = Decimal(85).roundWithPrecision(1, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("8"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(), "80")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_int8_19(): Unit {
        let dec = Decimal(155).roundWithPrecision(2, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("16"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "160")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }
}
