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
class Test_decimal_divwithprecision_38 {
    @TestCase
    func test_decimal_withprecision1_01(): Unit {
        let dec1 = Decimal(-100i8)
        let dec2 = Decimal(3200i16)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:HalfEven).toString(), "-0.03125")
        @Expect(dec1.powWithPrecision(3, 10, roundingMode:HalfEven).toString(), "-1000000")
        let e = @AssertThrows[IllegalArgumentException](dec1.sqrtWithPrecision(10, roundingMode:HalfEven))
        @Expect(e.message, "Negative decimal cannot be squared.")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "3200")
    }

    @TestCase
    func test_decimal_withprecison1_02(): Unit {
        let dec1 = Decimal(-29000i16)
        let dec2 = Decimal(421232435u32)
        @Expect(dec1.divWithPrecision(dec2, 4, roundingMode:HalfUp).toString(), "-0.00006885")
        @Expect(dec1.powWithPrecision(-2, 10, roundingMode:HalfUp).toString(), "0.000000001189060642")
        @Expect(dec2.sqrtWithPrecision(4, roundingMode:HalfUp).toString(), "20520")
        @Expect(dec1.roundWithPrecision(6, roundingMode:HalfUp).toString(), "-29000")
    }

    @TestCase
    func test_decimal_withprecison1_03(): Unit {
        let dec1 = Decimal(0i32)
        let dec2 = Decimal(0u64)
        let e = @AssertThrows[ArithmeticException](dec1.divWithPrecision(dec2, 4, roundingMode:Up))
        @Expect(e.message, "Divided by zero!")
        @Expect(dec1.powWithPrecision(4, 5, roundingMode:Up).toString(), "0")
        @Expect(dec1.sqrtWithPrecision(15, roundingMode:Up).toString(), "0")
        @Expect(dec2.roundWithPrecision(57, roundingMode:Up).toString(), "0")
    }

    @TestCase
    func test_decimal_withprecison1_04(): Unit {
        let dec1 = Decimal(IntNative(-139823877842))
        let dec2 = Decimal(10.09438832929887328f32)
        @Expect(dec1.divWithPrecision(dec2, 16, roundingMode:Floor).toString(), "-13851644867.38145")
        @Expect(dec1.powWithPrecision(0, 10, roundingMode:Floor).toString(), "1")
        @Expect(dec2.sqrtWithPrecision(10, roundingMode:Floor).toString(), "3.177166663")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Floor).toString(), "10.094")
    }

    @TestCase
    func test_decimal_withprecison1_05(): Unit {
        let dec1 = Decimal(1u8)
        let dec2 = Decimal(-1.00832943294f64)
        @Expect(dec1.divWithPrecision(dec2, 100, roundingMode:Ceiling).toString(), "-0.9917393733953457451028573200656327641016689022866828733112273108271044431707677697385875615517034982")
        @Expect(dec1.powWithPrecision(100, 10, roundingMode:Ceiling).toString(), "1")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Ceiling).toString(), "1")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Ceiling).toString(), "-1.0083")
    }

    @TestCase
    func test_decimal_withprecison1_06(): Unit {
        let dec1 = Decimal(UInt16.Max)
        let dec2 = Decimal(Int64.Max)
        @Expect(dec1.divWithPrecision(dec2, 50, roundingMode:HalfEven).toString(), "0.0000000000000071053189373837533090382021533125491242596915342605")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "4294836225")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:HalfEven).toString(), "255.9980469")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "9223400000000000000")
    }

    @TestCase
    func test_decimal_withprecison1_07(): Unit {
        let dec1 = Decimal(UInt32.Min)
        let dec2 = Decimal(0.193298f32)
        @Expect(dec1.divWithPrecision(dec2, 50, roundingMode:HalfEven).toString(), "0")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:HalfEven).toString(), "0")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:HalfEven).toString(), "0")
        @Expect(dec2.roundWithPrecision(5, roundingMode:HalfEven).toString(), "0.19330")
    }

    @TestCase
    func test_decimal_withprecison1_08(): Unit {
        let dec1 = Decimal(UInt64.Max)
        let dec2 = Decimal(UInt16.Min)
        let e = @AssertThrows[ArithmeticException](dec1.divWithPrecision(dec2, 5, roundingMode:Up))
        @Expect(e.message, "Divided by zero!")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Up).toString(), "340282367000000000000000000000000000000")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Up).toString(), "4294967296")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Up).toString(), "0")
    }

    @TestCase
    func test_decimal_withprecison1_09(): Unit {
        let dec1 = Decimal(UIntNative(0))
        let dec2 = Decimal(-111i8)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Down).toString(), "0")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Down).toString(), "0")
        @Expect(dec1.sqrtWithPrecision(10, roundingMode:Down).toString(), "0")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Down).toString(), "-111")
    }

    @TestCase
    func test_decimal_withprecison1_10(): Unit {
        let dec1 = Decimal(-10372847387i64)
        let dec2 = Decimal(65500.0914739353f16)
        @Expect(dec1.divWithPrecision(dec2, 5, roundingMode:Up).toString(), "-158360")
        @Expect(dec1.powWithPrecision(2, 10, roundingMode:Up).toString(), "107595963000000000000")
        @Expect(dec2.sqrtWithPrecision(10, roundingMode:Up).toString(), "255.9374924")
        @Expect(dec2.roundWithPrecision(5, roundingMode:Up).toString(), "65504")
    }
}
