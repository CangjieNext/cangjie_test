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
class Test_decimal_typeconvert_bigint_35 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_decimal_typeconvert_bigint_01(): Unit {
        let dec1 = Decimal(BigInt("12345"), 3)
        @Expect(dec1.toFloat16(), Float16(12.345))
        @Expect(dec1.toFloat32(), Float32(12.345))
        @Expect(dec1.toFloat64(), Float64(12.345))
        @Expect(dec1.toBigInt(), BigInt(12))
        @Expect(dec1.toInt8(), 12)
        @Expect(dec1.toInt16(), 12)
        @Expect(dec1.toInt32(), 12)
        @Expect(dec1.toInt64(), 12)
        @Expect(dec1.toIntNative(), 12)
        @Expect(dec1.toUInt8(), 12)
        @Expect(dec1.toUInt16(), 12)
        @Expect(dec1.toUInt32(), 12)
        @Expect(dec1.toUInt64(), 12)
        @Expect(dec1.toUIntNative(), 12)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Throwing), 12)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Throwing), 12)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Wrapping), 12)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Wrapping), 12)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Saturating), 12)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Saturating), 12)
    }
}
