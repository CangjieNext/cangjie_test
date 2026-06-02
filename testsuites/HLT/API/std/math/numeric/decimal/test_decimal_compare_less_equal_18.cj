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
class Test_decimal_compare_less_less_18 {
    @TestCase
    func test_decimal_compare_less_01(): Unit {
        let dec1 = Decimal(BigInt("-1"), -1000)
        let dec2 = Decimal.parse("0")
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_02(): Unit {
        let dec1 = Decimal(BigInt("1010"), 3)
        let dec2 = Decimal(11i8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_03(): Unit {
        let dec1 = Decimal(BigInt("-1"), -3)
        let dec2 = Decimal(-123i8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_04(): Unit {
        let dec1 = Decimal(BigInt("300"), -2)
        let dec2 = Decimal(32533i16)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_05(): Unit {
        let dec1 = Decimal(BigInt("-400"), -2)
        let dec2 = Decimal(-32533i32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_06(): Unit {
        let dec1 = Decimal(BigInt("8291472984"), -3)
        let dec2 = Decimal(8291472984001i64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_07(): Unit {
        let dec1 = Decimal(BigInt("-2000"), 3)
        let dec2 = Decimal(IntNative(-1))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_08(): Unit {
        let dec1 = Decimal(BigInt("-2000"), 3)
        let dec2 = Decimal(UIntNative(1))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_09(): Unit {
        let dec1 = Decimal(BigInt("-2000"), 3)
        let dec2 = Decimal(-1.1111f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_10(): Unit {
        let dec1 = Decimal.parse("-100e-2")
        let dec2 = Decimal(-0.5f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_11(): Unit {
        let dec1 = Decimal.parse("100e-2")
        let dec2 = Decimal(2)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_12(): Unit {
        let dec1 = Decimal.parse("100000000000000000e-2")
        let dec2 = Decimal(1000000000000001u64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_13(): Unit {
        let dec1 = Decimal.parse("-0.123456e-2")
        let dec2 = Decimal(-0.00123455f64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_14(): Unit {
        let dec1 = Decimal.parse("-0.123456e-2")
        let dec2 = Decimal(-0.00123455f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_15(): Unit {
        let dec1 = Decimal(210i16)
        let dec2 = Decimal(211u8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_16(): Unit {
        let dec1 = Decimal(-110i64)
        let dec2 = Decimal(0.1234556575f16)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_17(): Unit {
        let dec1 = Decimal(12300u16)
        let dec2 = Decimal(12300.13947f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_18(): Unit {
        let dec1 = Decimal(IntNative(10000000000000000))
        let dec2 = Decimal(UIntNative(10000000000000001))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_19(): Unit {
        let dec1 = Decimal(IntNative(-10000000000000000))
        let dec2 = Decimal(UIntNative(0))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_20(): Unit {
        let dec1 = Decimal(0.111111111111f16)
        let dec2 = Decimal(0.111111111111f64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_21(): Unit {
        let dec1 = Decimal(0.11f16)
        let dec2 = Decimal(0.11f64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_22(): Unit {
        let dec1 = Decimal(BigInt("0"), -1000)
        let dec2 = Decimal.parse("0")
        @Expect(dec1 <= dec2, true)
    }
    @TestCase
    func test_decimal_compare_less_23(): Unit {
        let dec1 = Decimal(BigInt("1110"), 1)
        let dec2 = Decimal(111i8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_24(): Unit {
        let dec1 = Decimal(BigInt("-100"), 2)
        let dec2 = Decimal(-1i8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_25(): Unit {
        let dec1 = Decimal(BigInt("3253300"), 2)
        let dec2 = Decimal(32533i16)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_26(): Unit {
        let dec1 = Decimal(BigInt("-325"), -2)
        let dec2 = Decimal(-32500i32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_27(): Unit {
        let dec1 = Decimal(BigInt("219429432985"), -3)
        let dec2 = Decimal(219429432985000i64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_28(): Unit {
        let dec1 = Decimal(BigInt("-1000"), 3)
        let dec2 = Decimal(IntNative(-1))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_29(): Unit {
        let dec1 = Decimal(BigInt("202000"), 3)
        let dec2 = Decimal(UIntNative(202))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_30(): Unit {
        let dec1 = Decimal(BigInt("-11110999584197998046875"), 22)
        let dec2 = Decimal(-1.1111f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_31(): Unit {
        let dec1 = Decimal.parse("0e-1")
        let dec2 = Decimal(-0.00000f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_32(): Unit {
        let dec1 = Decimal.parse("200e-2")
        let dec2 = Decimal(2)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_33(): Unit {
        let dec1 = Decimal.parse("100000000000000000e-2")
        let dec2 = Decimal(1000000000000000u64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_34(): Unit {
        let dec1 = Decimal.parse("-.1234550000000000057054361235486794612370431423187255859375e-2")
        let dec2 = Decimal(-0.00123455f64)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_35(): Unit {
        let dec1 = Decimal.parse("-.12345500290393829345703125e-2")
        let dec2 = Decimal(-0.00123455f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_36(): Unit {
        let dec1 = Decimal(211i16)
        let dec2 = Decimal(211u8)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_37(): Unit {
        let dec1 = Decimal(11i64)
        let dec2 = Decimal(11.0f16)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_38(): Unit {
        let dec1 = Decimal(12300u16)
        let dec2 = Decimal(12300.000000f32)
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_39(): Unit {
        let dec1 = Decimal(IntNative(10000000000000001))
        let dec2 = Decimal(UIntNative(10000000000000001))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_40(): Unit {
        let dec1 = Decimal(IntNative(-0))
        let dec2 = Decimal(UIntNative(0))
        @Expect(dec1 <= dec2, true)
    }

    @TestCase
    func test_decimal_compare_less_41(): Unit {
        let dec1 = Decimal(100.000f64)
        let dec2 = Decimal(100.000f16)
        @Expect(dec1 <= dec2, true)
    }
}
