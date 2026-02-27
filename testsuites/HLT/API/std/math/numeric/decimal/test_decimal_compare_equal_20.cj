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

@Test
class Test_decimal_compare_equal_20 {
    @TestCase
    func test_decimal_compare_equal_01(): Unit {
        let dec1 = Decimal(BigInt("0"), -1000)
        let dec2 = Decimal.parse("0")
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }
    @TestCase
    func test_decimal_compare_equal_02(): Unit {
        let dec1 = Decimal(BigInt("1110"), 1)
        let dec2 = Decimal(111i8)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_03(): Unit {
        let dec1 = Decimal(BigInt("-100"), 2)
        let dec2 = Decimal(-1i8)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_04(): Unit {
        let dec1 = Decimal(BigInt("3253300"), 2)
        let dec2 = Decimal(32533i16)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_05(): Unit {
        let dec1 = Decimal(BigInt("-325"), -2)
        let dec2 = Decimal(-32500i32)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_06(): Unit {
        let dec1 = Decimal(BigInt("219429432985"), -3)
        let dec2 = Decimal(219429432985000i64)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_07(): Unit {
        let dec1 = Decimal(BigInt("-1000"), 3)
        let dec2 = Decimal(IntNative(-1))
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_08(): Unit {
        let dec1 = Decimal(BigInt("202000"), 3)
        let dec2 = Decimal(UIntNative(202))
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_09(): Unit {
        let dec1 = Decimal(BigInt("-11110999584197998046875"), 22)
        let dec2 = Decimal(-1.1111f32)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_10(): Unit {
        let dec1 = Decimal.parse("0e-1")
        let dec2 = Decimal(-0.00000f32)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_11(): Unit {
        let dec1 = Decimal.parse("200e-2")
        let dec2 = Decimal(2)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_12(): Unit {
        let dec1 = Decimal.parse("100000000000000000e-2")
        let dec2 = Decimal(1000000000000000u64)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_13(): Unit {
        let dec1 = Decimal.parse("-.1234550000000000057054361235486794612370431423187255859375e-2")
        let dec2 = Decimal(-0.00123455f64)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_14(): Unit {
        let dec1 = Decimal.parse("-.12345500290393829345703125e-2")
        let dec2 = Decimal(-0.00123455f32)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_15(): Unit {
        let dec1 = Decimal(211i16)
        let dec2 = Decimal(211u8)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_16(): Unit {
        let dec1 = Decimal(11i64)
        let dec2 = Decimal(11.0f16)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_17(): Unit {
        let dec1 = Decimal(12300u16)
        let dec2 = Decimal(12300.000000f32)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_18(): Unit {
        let dec1 = Decimal(IntNative(10000000000000001))
        let dec2 = Decimal(UIntNative(10000000000000001))
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_19(): Unit {
        let dec1 = Decimal(IntNative(-0))
        let dec2 = Decimal(UIntNative(0))
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }

    @TestCase
    func test_decimal_compare_equal_20(): Unit {
        let dec1 = Decimal(100.000f64)
        let dec2 = Decimal(100.000f16)
        @Expect(dec1 == dec2, true)
        @Expect(dec1.compare(dec2), Ordering.EQ)
    }
}
