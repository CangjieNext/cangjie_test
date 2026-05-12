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
class Test_decimal_property_float32_14 {
    @TestCase
    func test_decimal_float32_01(): Unit {
        let dec = Decimal(0.123456789f32)
        let dec1 = Decimal.parse("1e-26")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345679104328155517578125"))
        @Expect(dec.scale, 26)
        @Expect(dec.precision, 26)
        @Expect(dec.toString(), "0.12345679104328155517578125")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_02(): Unit {
        let dec = Decimal(-0.0000000000f32)
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
    func test_decimal_float32_03(): Unit {
        let dec = Decimal(-0.0000000001f32)
        let dec1 = Decimal.parse("1e-57")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-100000001335143196001808973960578441619873046875"))
        @Expect(dec.scale, 57)
        @Expect(dec.precision, 48)
        @Expect(dec.toString(), "-0.000000000100000001335143196001808973960578441619873046875")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_05(): Unit {
        let dec = Decimal(100.11910912763f32)
        let dec1 = Decimal.parse("1e-15")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("100119110107421875"))
        @Expect(dec.scale, 15)
        @Expect(dec.precision, 18)
        @Expect(dec.toString(), "100.119110107421875")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_06(): Unit {
        let dec = Decimal(100.11910912763f32).roundWithPrecision(15, roundingMode: Up)
        let dec1 = Decimal.parse("1e-12")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("100119110107422"))
        @Expect(dec.scale, 12)
        @Expect(dec.precision, 15)
        @Expect(dec.toString(), "100.119110107422")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_07(): Unit {
        let dec = Decimal(-1.234567890918736249f32).roundWithPrecision(15, roundingMode: Up)
        let dec1 = Decimal.parse("1e-14")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-123456788063050"))
        @Expect(dec.scale, 14)
        @Expect(dec.precision, 15)
        @Expect(dec.toString(), "-1.23456788063050")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_08(): Unit {
        let dec = Decimal(1.56729019284427427f32).roundWithPrecision(15, roundingMode: Down)
        let dec1 = Decimal.parse("1e-14")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("156729018688201"))
        @Expect(dec.scale, 14)
        @Expect(dec.precision, 15)
        @Expect(dec.toString(), "1.56729018688201")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_09(): Unit {
        let dec = Decimal(-7.2983294636872432f32).roundWithPrecision(3, roundingMode: Down)
        let dec1 = Decimal.parse("1e-2")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-729"))
        @Expect(dec.scale, 2)
        @Expect(dec.precision, 3)
        @Expect(dec.toString(), "-7.29")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_10(): Unit {
        let dec = Decimal(5.2984234839051f32).roundWithPrecision(6, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e-5")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("529843"))
        @Expect(dec.scale, 5)
        @Expect(dec.precision, 6)
        @Expect(dec.toString(), "5.29843")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_11(): Unit {
        let dec = Decimal(-9.29129847284f32).roundWithPrecision(10, roundingMode: Ceiling)
        let dec1 = Decimal.parse("1e-9")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-9291298866"))
        @Expect(dec.scale, 9)
        @Expect(dec.precision, 10)
        @Expect(dec.toString(), "-9.291298866")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_12(): Unit {
        let dec = Decimal(3.438823428794f32).roundWithPrecision(6, roundingMode: Floor)
        let dec1 = Decimal.parse("1e-5")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("343882"))
        @Expect(dec.scale, 5)
        @Expect(dec.precision, 6)
        @Expect(dec.toString(), "3.43882")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_13(): Unit {
        let dec = Decimal(-4.93294388210024f32).roundWithPrecision(10, roundingMode: Floor)
        let dec1 = Decimal.parse("1e-9")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-4932943821"))
        @Expect(dec.scale, 9)
        @Expect(dec.precision, 10)
        @Expect(dec.toString(), "-4.932943821")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_14(): Unit {
        let dec = Decimal(5.2948209482f32).roundWithPrecision(18, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e-17")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("529482078552246094"))
        @Expect(dec.scale, 17)
        @Expect(dec.precision, 18)
        @Expect(dec.toString(), "5.29482078552246094")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_15(): Unit {
        let dec = Decimal(-0.29844394482f32).roundWithPrecision(21, roundingMode: HalfUp)
        let dec1 = Decimal.parse("1e-21")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-298443943262100219727"))
        @Expect(dec.scale, 21)
        @Expect(dec.precision, 21)
        @Expect(dec.toString(), "-0.298443943262100219727")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_16(): Unit {
        let dec = Decimal(8.249872473894f32).roundWithPrecision(11)
        let dec1 = Decimal.parse("1e-10")
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("82498722076"))
        @Expect(dec.scale, 10)
        @Expect(dec.precision, 11)
        @Expect(dec.toString(), "8.2498722076")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }

    @TestCase
    func test_decimal_float32_17(): Unit {
        let dec = Decimal(-1.000001273982488273f32).roundWithPrecision(15, roundingMode: HalfEven)
        let dec1 = Decimal.parse("1e-14")
        @Expect(dec.sign, -1)
        @Expect(dec.value, BigInt("-100000131130219"))
        @Expect(dec.scale, 14)
        @Expect(dec.precision, 15)
        @Expect(dec.toString(), "-1.00000131130219")
        @Expect(dec.removeTrailingZeros(), dec)
        @Expect(dec.scaleUnit(), dec1)
        @Expect(dec.isInteger(), false)
    }
}
