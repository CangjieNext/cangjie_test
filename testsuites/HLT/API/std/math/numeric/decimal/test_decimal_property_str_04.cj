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
class Test_decimal_property_str_04 {
    @TestCase
    func test_decimal_str_01(): Unit {
        let dec = Decimal.parse("+10000")
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("10000"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 5)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_02(): Unit {
        let dec = Decimal.parse("0")
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, 0)
        @Expect(dec.value, BigInt("0"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 1)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_03(): Unit {
        let dec = Decimal.parse("-1000")
        let dec1 = Decimal.parse("1")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-1000"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 4)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_04(): Unit {
        let dec = Decimal.parse("10.12345")
        let dec1 = Decimal.parse("1e-5")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1012345"))
        @Expect(dec.scale, 5)
        @Expect(dec.precision, 7)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_05(): Unit {
        let dec = Decimal.parse("-.123456")
        let dec1 = Decimal.parse("1e-6")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456"))
        @Expect(dec.scale, 6)
        @Expect(dec.precision, 6)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_06(): Unit {
        let dec = Decimal.parse("-.123456e+0")
        let dec1 = Decimal.parse("1e-6")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456"))
        @Expect(dec.scale, 6)
        @Expect(dec.precision, 6)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_07(): Unit {
        let dec = Decimal.parse("-.123456E-10")
        let dec1 = Decimal.parse("1e-16")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456"))
        @Expect(dec.scale, 16)
        @Expect(dec.precision, 6)
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_08(): Unit {
        let dec = Decimal.parse(".123456e10")
        let dec1 = Decimal.parse("1e4")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("123456"))
        @Expect(dec.scale, -4)
        @Expect(dec.precision, 6)
        @Expect(dec.toString(),"1234560000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_09(): Unit {
        let dec = Decimal.parse("1234560000")
        let dec1 = Decimal.parse("1e0")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1234560000"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 10)
        @Expect(dec.toString(),"1234560000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_10(): Unit {
        let dec = Decimal.parse("-123456e-10")
        let dec1 = Decimal.parse("1e-10")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456"))
        @Expect(dec.scale, 10)
        @Expect(dec.precision, 6)
        @Expect(dec.toString(),"-0.0000123456")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_11(): Unit {
        let dec = Decimal.parse("-123456e-10")
        let dec1 = Decimal.parse("1e-10")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456"))
        @Expect(dec.scale, 10)
        @Expect(dec.precision, 6)
        @Expect(dec.toString(),"-0.0000123456")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_12(): Unit {
        let dec = Decimal.parse("-123456e-10").roundWithPrecision(1, roundingMode: Up)
        let dec1 = Decimal.parse("1e-5")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-2"))
        @Expect(dec.scale, 5)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(),"-0.00002")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_13(): Unit {
        let dec = Decimal.parse("0").roundWithPrecision(5, roundingMode: Down)
        let dec1 = Decimal.parse("1").roundWithPrecision(5, roundingMode: Down)
        @Expect(dec.sign, 0)
        @Expect(dec.value, BigInt("0"))
        @Expect(dec.scale, 0)
        @Expect(dec.precision, 1)
        @Expect(dec.toString(),"0")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_14(): Unit {
        let dec = Decimal.parse("-123456e-2").roundWithPrecision(5, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e-1").roundWithPrecision(5, roundingMode: Ceiling)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-12345"))
        @Expect(dec.scale, 1)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"-1234.5")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_15(): Unit {
        let dec = Decimal.parse("123456e+2").roundWithPrecision(5, roundingMode: Floor)
        let dec1 = Decimal.parse("1e3").roundWithPrecision(5, roundingMode: Floor)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345"))
        @Expect(dec.scale, -3)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"12345000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_16(): Unit {
        let dec = Decimal.parse("123455e+2").roundWithPrecision(5, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e3").roundWithPrecision(5, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12346"))
        @Expect(dec.scale, -3)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"12346000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_17(): Unit {
        let dec = Decimal.parse("123454e+2").roundWithPrecision(5, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e3").roundWithPrecision(5, roundingMode: HalfUp)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345"))
        @Expect(dec.scale, -3)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"12345000")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), true)
    }

    @TestCase
    func test_decimal_str_18(): Unit {
        let dec = Decimal.parse("-123455e-2").roundWithPrecision(5, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e-1").roundWithPrecision(5, roundingMode: HalfEven)
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-12346"))
        @Expect(dec.scale, 1)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"-1234.6")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_str_19(): Unit {
        let dec = Decimal.parse("123454e-2").roundWithPrecision(5, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e-1").roundWithPrecision(5, roundingMode: HalfEven)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345"))
        @Expect(dec.scale, 1)
        @Expect(dec.precision, 5)
        @Expect(dec.toString(),"1234.5")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }
}
