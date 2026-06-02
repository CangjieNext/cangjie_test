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
class Test_decimal_property_float64_15 {
    @TestCase
    func test_decimal_float64_01(): Unit {
        let dec = Decimal(0.123456789f64)
        let dec1 = Decimal.parse("1e-56")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345678899999999733605449137030518613755702972412109375"))
        @Expect(dec.scale, 56)
        @Expect(dec.precision, 56)
        @Expect(dec.toString(), "0.12345678899999999733605449137030518613755702972412109375")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_02(): Unit {
        let dec = Decimal(0.000000000f64)
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
    func test_decimal_float64_03(): Unit {
        let dec = Decimal(-1.00011921983228387278f64)
        let dec1 = Decimal.parse("1e-52")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-10001192198322839121971128406585194170475006103515625"))
        @Expect(dec.scale, 52)
        @Expect(dec.precision, 53)
        @Expect(dec.toString(), "-1.0001192198322839121971128406585194170475006103515625")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_04(): Unit {
        let dec = Decimal(100.11910912763f64).roundWithPrecision(40, roundingMode: Up)
        let dec1 = Decimal.parse("1e-37")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("1001191091276299971468688454478979110718"))
        @Expect(dec.scale, 37)
        @Expect(dec.precision, 40)
        @Expect(dec.toString(), "100.1191091276299971468688454478979110718")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_05(): Unit {
        let dec = Decimal(-1.234567890918736249f64).roundWithPrecision(35, roundingMode: Up)
        let dec1 = Decimal.parse("1e-34")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-12345678909187363103683310328051448"))
        @Expect(dec.scale, 34)
        @Expect(dec.precision, 35)
        @Expect(dec.toString(), "-1.2345678909187363103683310328051448")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_06(): Unit {
        let dec = Decimal(1.56729019284427427f64).roundWithPrecision(30, roundingMode: Down)
        let dec1 = Decimal.parse("1e-29")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("156729019284427417701976992248"))
        @Expect(dec.scale, 29)
        @Expect(dec.precision, 30)
        @Expect(dec.toString(), "1.56729019284427417701976992248")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_07(): Unit {
        let dec = Decimal(-7.2983294636872432f64).roundWithPrecision(31, roundingMode: Down)
        let dec1 = Decimal.parse("1e-30")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-7298329463687243112701708014355"))
        @Expect(dec.scale, 30)
        @Expect(dec.precision, 31)
        @Expect(dec.toString(), "-7.298329463687243112701708014355")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_08(): Unit {
        let dec = Decimal(5.2984234839051f64).roundWithPrecision(32, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e-31")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("52984234839050996512810343119782"))
        @Expect(dec.scale, 31)
        @Expect(dec.precision, 32)
        @Expect(dec.toString(), "5.2984234839050996512810343119782")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_09(): Unit {
        let dec = Decimal(-9.29129847284f64).roundWithPrecision(33, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e-32")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-929129847283999943385879305424168"))
        @Expect(dec.scale, 32)
        @Expect(dec.precision, 33)
        @Expect(dec.toString(), "-9.29129847283999943385879305424168")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_10(): Unit {
        let dec = Decimal(3.438823428794f64).roundWithPrecision(34, roundingMode: Floor)
        let dec1 = Decimal.parse("1e-33")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("3438823428794000047759027438587509"))
        @Expect(dec.scale, 33)
        @Expect(dec.precision, 34)
        @Expect(dec.toString(), "3.438823428794000047759027438587509")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_11(): Unit {
        let dec = Decimal(-4.93294388210024f64).roundWithPrecision(35, roundingMode: Floor)
        let dec1 = Decimal.parse("1e-34")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-49329438821002398185555648524314166"))
        @Expect(dec.scale, 34)
        @Expect(dec.precision, 35)
        @Expect(dec.toString(), "-4.9329438821002398185555648524314166")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_12(): Unit {
        let dec = Decimal(5.2948209482f64).roundWithPrecision(36, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e-35")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("529482094819999993262626958312466741"))
        @Expect(dec.scale, 35)
        @Expect(dec.precision, 36)
        @Expect(dec.toString(), "5.29482094819999993262626958312466741")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_13(): Unit {
        let dec = Decimal(-0.29844394482f64).roundWithPrecision(37, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e-37")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-2984439448199999733724041561799822375"))
        @Expect(dec.scale, 37)
        @Expect(dec.precision, 37)
        @Expect(dec.toString(), "-0.2984439448199999733724041561799822375")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_14(): Unit {
        let dec = Decimal(8.249872473894f64).roundWithPrecision(38, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e-37")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("82498724738939994693964763428084552288"))
        @Expect(dec.scale, 37)
        @Expect(dec.precision, 38)
        @Expect(dec.toString(), "8.2498724738939994693964763428084552288")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float64_15(): Unit {
        let dec = Decimal(-1.000001273982488273f64).roundWithPrecision(39, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e-38")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-100000127398248817023329593212110921741"))
        @Expect(dec.scale, 38)
        @Expect(dec.precision, 39)
        @Expect(dec.toString(), "-1.00000127398248817023329593212110921741")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }
}
