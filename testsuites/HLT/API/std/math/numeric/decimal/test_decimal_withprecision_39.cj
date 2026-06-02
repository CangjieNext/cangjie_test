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
class Test_decimal_divwithprecision_39 {
    @TestCase
    func test_decimal_withprecison2_01(): Unit {
        let dec1 = Decimal(BigInt("-11111"), 5)
        let dec2 = Decimal(0i8)
        @Expect(dec2.divWithPrecision(dec1, 5, roundingMode:HalfEven).toString(), "0")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "0.0123454321")
        @Expect(dec2.sqrtWithPrecision(10, roundingMode:HalfEven).toString(), "0")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "0")
    }

    @TestCase
    func test_decimal_withprecison2_02(): Unit {
        let dec1 = Decimal(BigInt("12832"), -1)
        let dec2 = Decimal(18343u16)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:HalfEven).toString(), "6.9956")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "16466022400")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:HalfEven).toString(), "358.2178108")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "18343")
    }

    @TestCase
    func test_decimal_withprecison2_03(): Unit {
        let dec1 = Decimal(BigInt("-13824376"), 0)
        let dec2 = Decimal(-120.834783f32)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:HalfEven).toString(), "114410")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "191113371800000")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "-120.83")
    }

    @TestCase
    func test_decimal_withprecison2_04(): Unit {
        let dec1 = Decimal.parse("0")
        let dec2 = Decimal(-1234i16)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:HalfUp).toString(), "0")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfUp).toString(), "0")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:HalfUp).toString(), "0")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfUp).toString(), "-1234")
    }

    @TestCase
    func test_decimal_withprecison2_05(): Unit {
        let dec1 = Decimal.parse("300e-2")
        let dec2 = Decimal(UInt32.Max)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Up).toString(), "0.00000000069850")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Up).toString(), "9.0000")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Up).toString(), "1.732050808")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Up).toString(), "4295000000")
    }

    @TestCase
    func test_decimal_withprecison2_06(): Unit {
        let dec1 = Decimal.parse("300e-2")
        let dec2 = Decimal(874.8747734f64)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Down).toString(), "0.0034290")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Down).toString(), "9.0000")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Down).toString(), "1.732050807")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Down).toString(), "874.87")
    }

    @TestCase
    func test_decimal_withprecison2_07(): Unit {
        let dec1 = Decimal(0.1733332f16)
        let dec2 = Decimal(100.98329847387f32)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Floor).toString(), "0.0017165")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Floor).toString(), "0.03004670143")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Floor).toString(), "0.4163410185")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Floor).toString(), "100.98")
    }

    @TestCase
    func test_decimal_withprecison2_08(): Unit {
        let dec1 = Decimal(0.1733332f16)
        let dec2 = Decimal(100.98329847387f64)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Ceiling).toString(), "0.0017166")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Ceiling).toString(), "0.03004670144")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Ceiling).toString(), "0.4163410186")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Ceiling).toString(), "100.99")
    }

    @TestCase
    func test_decimal_withprecison2_09(): Unit {
        let dec1 = Decimal(2i8)
        let dec2 = Decimal(8i16)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Ceiling).toString(), "0.25")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Ceiling).toString(), "4")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Ceiling).toString(), "1.414213563")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Ceiling).toString(), "8")
    }

    @TestCase
    func test_decimal_withprecison2_10(): Unit {
        let dec1 = Decimal.parse("0.000")
        let dec2 = Decimal.parse("0")
        let e = @AssertThrows[ArithmeticException](dec1.divWithPrecision(dec2, 5, roundingMode:HalfEven))
        @Expect(e.message, "Divided by zero!")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "0.000000")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:HalfEven).toString(), "0.0")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "0")
    }
}
