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
class Test_decimal_compare_greater_than_17 {
    @TestCase
    func test_decimal_compare_greater_01(): Unit {
        let dec1 = Decimal(BigInt("0"), -1000)
        let dec2 = Decimal.parse("-1")
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_02(): Unit {
        let dec1 = Decimal(BigInt("11111111"), 5)
        let dec2 = Decimal(111i8)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_03(): Unit {
        let dec1 = Decimal(BigInt("-1"), -2)
        let dec2 = Decimal(-123i8)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_04(): Unit {
        let dec1 = Decimal(BigInt("12345678924"), -5)
        let dec2 = Decimal(32533i16)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_05(): Unit {
        let dec1 = Decimal(BigInt("-325"), -2)
        let dec2 = Decimal(-32533i32)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_06(): Unit {
        let dec1 = Decimal(BigInt("219429432985"), -3)
        let dec2 = Decimal(219429432984000i64)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_07(): Unit {
        let dec1 = Decimal(BigInt("-1000"), 3)
        let dec2 = Decimal(IntNative(-2))
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_08(): Unit {
        let dec1 = Decimal(BigInt("202000"), 3)
        let dec2 = Decimal(UIntNative(201))
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_09(): Unit {
        let dec1 = Decimal(BigInt("-1000"), 3)
        let dec2 = Decimal(-1.1111f32)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_10(): Unit {
        let dec1 = Decimal.parse("0e-1")
        let dec2 = Decimal(-0.513830403984f32)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_11(): Unit {
        let dec1 = Decimal.parse("300e-2")
        let dec2 = Decimal(2)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_12(): Unit {
        let dec1 = Decimal.parse("100000000000000100e-2")
        let dec2 = Decimal(1000000000000000u64)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_13(): Unit {
        let dec1 = Decimal.parse("-0.000456e-2")
        let dec2 = Decimal(-0.00123455f64)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_14(): Unit {
        let dec1 = Decimal.parse("0.123456e-2")
        let dec2 = Decimal(-0.00123455f32)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_15(): Unit {
        let dec1 = Decimal(212i16)
        let dec2 = Decimal(211u8)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_16(): Unit {
        let dec1 = Decimal(110i64)
        let dec2 = Decimal(0.1234556575f16)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_17(): Unit {
        let dec1 = Decimal(12301u16)
        let dec2 = Decimal(12300.13947f32)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_18(): Unit {
        let dec1 = Decimal(IntNative(10000000000000002))
        let dec2 = Decimal(UIntNative(10000000000000001))
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_19(): Unit {
        let dec1 = Decimal(IntNative(10000000000000000))
        let dec2 = Decimal(UIntNative(100000000000000))
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }

    @TestCase
    func test_decimal_compare_greater_20(): Unit {
        let dec1 = Decimal(0.111111111111f64)
        let dec2 = Decimal(0.111111111111f16)
        @Expect(dec1 > dec2, true)
        @Expect(dec1.compare(dec2), Ordering.GT)
    }
}
