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
class Test_decimal_property_uint8_09 {
    @TestCase
    func test_decimal_uint8_01(): Unit {
        let dec = Decimal(0u8)
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
    func test_decimal_uint8_02(): Unit {
        let dec = Decimal(UInt8.Max)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("255"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "255")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_03(): Unit {
        let dec = Decimal(UInt8.Min)
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
    func test_decimal_uint8_04(): Unit {
        let dec = Decimal(122u8).roundWithPrecision(3, roundingMode: Up)
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
    func test_decimal_uint8_05(): Unit {
        let dec = Decimal(100u8).roundWithPrecision(2, roundingMode: Up)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("10"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_06(): Unit {
        let dec = Decimal(100u8).roundWithPrecision(2, roundingMode: Down)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("10"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_07(): Unit {
        let dec = Decimal(111u8).roundWithPrecision(2, roundingMode: Down)
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
    func test_decimal_uint8_08(): Unit {
        let dec = Decimal(111u8).roundWithPrecision(2, roundingMode: Ceiling)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "120")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_09(): Unit {
        let dec = Decimal(110u8).roundWithPrecision(2, roundingMode: Ceiling)
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
    func test_decimal_uint8_10(): Unit {
        let dec = Decimal(111u8).roundWithPrecision(2, roundingMode: Floor)
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
    func test_decimal_uint8_11(): Unit {
        let dec = Decimal(100u8).roundWithPrecision(2, roundingMode: Floor)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("10"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_12(): Unit {
        let dec = Decimal(111u8).roundWithPrecision(2, roundingMode: HalfUp)
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
    func test_decimal_uint8_13(): Unit {
        let dec = Decimal(105u8).roundWithPrecision(2, roundingMode: HalfUp)
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
    func test_decimal_uint8_14(): Unit {
        let dec = Decimal(115u8).roundWithPrecision(2)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "120")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_uint8_15(): Unit {
        let dec = Decimal(100u8).roundWithPrecision(2)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("10"))
        @Expect(dec.scale, -1)
        @Expect(dec.precision, 2)
        @Expect(dec.toString(), "100")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec2)
        @Expect(dec.isInteger(), true)
    }
}
