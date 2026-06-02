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
import std.convert.*

var sum = 0

@Test
class Test_decimal_typeconvert_float64_34 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_decimal_typeconvert_float64_01(): Unit {
        let dec1 = Decimal(-1000.8392847398283530f64)
        @Expect(dec1.toFloat16().format("-100.100"), Float16(-1000.8392847398283530).format("-100.100"))
        @Expect(dec1.toFloat32().format("-100.100"), Float32(-1000.8392847398283530).format("-100.100"))
        @Expect(dec1.toFloat64(), Float64(-1000.8392847398283530))
        @Expect(dec1.toBigInt(), BigInt(-1000))
        try {
            dec1.toInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 1)
        @Expect(dec1.toInt16(), -1000)
        @Expect(dec1.toInt32(), -1000)
        @Expect(dec1.toInt64(), -1000)
        @Expect(dec1.toIntNative(), -1000)
        try {
            dec1.toUInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 2)
        try {
            dec1.toUInt16()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
            sum += 1
        }
        @Expect(sum, 3)
        try {
            dec1.toUInt32()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
            sum += 1
        }
        @Expect(sum, 4)
        try {
            dec1.toUInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 5)
        try {
            dec1.toUIntNative()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 6)

        try {
            dec1.toInt8(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 7)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Throwing), -1000)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Throwing), -1000)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Throwing), -1000)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Throwing), -1000)
        try {
            dec1.toUInt8(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 8)
        try {
            dec1.toUInt16(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
            sum += 1
        }
        @Expect(sum, 9)
        try {
            dec1.toUInt32(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
            sum += 1
        }
        @Expect(sum, 10)
        try {
            dec1.toUInt64(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 11)
        try {
            dec1.toUIntNative(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 12)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Wrapping), 24)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Wrapping), -1000)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Wrapping), -1000)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Wrapping), -1000)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Wrapping), -1000)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Wrapping), 24)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Wrapping), 64536)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Wrapping), 4294966296)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Wrapping), 18446744073709550616)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Wrapping), 18446744073709550616)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Saturating), -128)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Saturating), -1000)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Saturating), -1000)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Saturating), -1000)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Saturating), -1000)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Saturating), 0)
    }
}
