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

var sum = 0

@Test
class Test_decimal_typeconvert_huge_37 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_decimal_typeconvert_huge_throwing_01(): Unit {
        // huge values whose integer part exceeds the target type's width
        // must throw OverflowException under the Throwing strategy
        try {
            Decimal.parse("1e8").toInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 1)
        try {
            Decimal.parse("1e16").toInt16()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
            sum += 1
        }
        @Expect(sum, 2)
        try {
            Decimal.parse("1e32").toInt32()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int32.")
            sum += 1
        }
        @Expect(sum, 3)
        try {
            Decimal.parse("1e64").toInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
            sum += 1
        }
        @Expect(sum, 4)
        try {
            Decimal.parse("-1e65").toInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
            sum += 1
        }
        @Expect(sum, 5)
        try {
            Decimal.parse("1e8").toUInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 6)
        try {
            Decimal.parse("1e65").toUInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 7)
        try {
            Decimal.parse("1e65").toIntNative()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the IntNative.")
            sum += 1
        }
        @Expect(sum, 8)
        try {
            Decimal.parse("1e65").toUIntNative()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UIntNative.")
            sum += 1
        }
        @Expect(sum, 9)
    }

    @TestCase
    func test_decimal_typeconvert_huge_saturating_02(): Unit {
        // huge values must saturate to the min/max of the target type
        @Expect(Decimal.parse("1e65").toInt64(overflowHandling: Saturating), Int64.Max)
        @Expect(Decimal.parse("-1e65").toInt64(overflowHandling: Saturating), Int64.Min)
        @Expect(Decimal.parse("1e65").toUInt64(overflowHandling: Saturating), UInt64.Max)
        @Expect(Decimal.parse("-1e65").toUInt64(overflowHandling: Saturating), UInt64.Min)
        @Expect(Decimal.parse("1e65").toInt8(overflowHandling: Saturating), Int8.Max)
        @Expect(Decimal.parse("-1e65").toInt8(overflowHandling: Saturating), Int8.Min)
        @Expect(Decimal.parse("1e65").toUInt8(overflowHandling: Saturating), UInt8.Max)
        @Expect(Decimal.parse("-1e65").toUInt8(overflowHandling: Saturating), UInt8.Min)
        @Expect(Decimal.parse("1e65").toInt32(overflowHandling: Saturating), Int32.Max)
        @Expect(Decimal.parse("-1e65").toInt32(overflowHandling: Saturating), Int32.Min)
        @Expect(Decimal.parse("1e65").toUInt32(overflowHandling: Saturating), UInt32.Max)
        @Expect(Decimal.parse("-1e65").toUInt32(overflowHandling: Saturating), UInt32.Min)
        @Expect(Decimal.parse("1e65").toInt16(overflowHandling: Saturating), Int16.Max)
        @Expect(Decimal.parse("-1e65").toInt16(overflowHandling: Saturating), Int16.Min)
        @Expect(Decimal.parse("1e65").toUInt16(overflowHandling: Saturating), UInt16.Max)
        @Expect(Decimal.parse("-1e65").toUInt16(overflowHandling: Saturating), UInt16.Min)
        @Expect(Decimal.parse("1e65").toIntNative(overflowHandling: Saturating), IntNative.Max)
        @Expect(Decimal.parse("-1e65").toIntNative(overflowHandling: Saturating), IntNative.Min)
        @Expect(Decimal.parse("1e65").toUIntNative(overflowHandling: Saturating), UIntNative.Max)
        @Expect(Decimal.parse("-1e65").toUIntNative(overflowHandling: Saturating), UIntNative.Min)
    }

    @TestCase
    func test_decimal_typeconvert_huge_wrapping_03(): Unit {
        // huge values contain a 2^N factor, so wrapping truncation is 0
        @Expect(Decimal.parse("1e65").toInt64(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("-1e65").toInt64(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("1e65").toUInt64(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("1e65").toInt8(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("1e65").toUInt8(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("1e65").toIntNative(overflowHandling: Wrapping), 0)
        @Expect(Decimal.parse("1e65").toUIntNative(overflowHandling: Wrapping), 0)
    }

    @TestCase
    func test_decimal_typeconvert_huge_boundary_04(): Unit {
        // values just below the huge threshold still go through the regular path
        try {
            Decimal.parse("1e7").toInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 1)
        try {
            Decimal.parse("1e15").toInt16()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
            sum += 1
        }
        @Expect(sum, 2)
        try {
            Decimal.parse("1e31").toInt32()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int32.")
            sum += 1
        }
        @Expect(sum, 3)
        try {
            Decimal.parse("1e19").toInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
            sum += 1
        }
        @Expect(sum, 4)
        try {
            Decimal.parse("1e63").toInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int64.")
            sum += 1
        }
        @Expect(sum, 5)
    }

    @TestCase
    func test_decimal_typeconvert_huge_normal_05(): Unit {
        // fractional-only decimals still convert to 0
        @Expect(Decimal.parse("10e-5").toInt8(), 0)
        @Expect(Decimal.parse("10e-5").toInt64(), 0)
        @Expect(Decimal.parse("10e-5").toUInt64(), 0)
        // regular in-range conversions are unaffected
        @Expect(Decimal.parse("127").toInt8(), 127)
        @Expect(Decimal.parse("-128").toInt8(), -128)
        @Expect(Decimal.parse("1e2").toInt8(), 100)
        @Expect(Decimal.parse("1e2").toInt64(), 100)
        @Expect(Decimal.parse("-1e3").toInt32(), -1000)
        @Expect(Decimal.parse("1.9").toInt64(), 1)
        @Expect(Decimal.parse("1e10").toInt64(), 10000000000)
    }
}
