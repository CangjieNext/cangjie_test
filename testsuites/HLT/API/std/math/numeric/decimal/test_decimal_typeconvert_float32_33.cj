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
class Test_decimal_typeconvert_float32_33 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_decimal_typeconvert_float32_01(): Unit {
        let dec1 = Decimal(-100.2879439443f32)
        @Expect(dec1.toFloat16().format("-100.100"), Float16(-100.2879439443).format("-100.100"))
        @Expect(dec1.toFloat32(), Float32(-100.2879439443))
        @Expect(dec1.toFloat64().format("-100.100"), Float32(-100.2879439443).format("-100.100"))
        @Expect(dec1.toBigInt(), BigInt(-100))
        @Expect(dec1.toInt8(), -100)
        @Expect(dec1.toInt16(), -100)
        @Expect(dec1.toInt32(), -100)
        @Expect(dec1.toInt64(), -100)
        @Expect(dec1.toIntNative(), -100)
        try {
            dec1.toUInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 1)
        try {
            dec1.toUInt16()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
            sum += 1
        }
        @Expect(sum, 2)
        try {
            dec1.toUInt32()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
            sum += 1
        }
        @Expect(sum, 3)
        try {
            dec1.toUInt64()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 4)
        try {
            dec1.toUIntNative()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 5)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Throwing), -100)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Throwing), -100)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Throwing), -100)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Throwing), -100)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Throwing), -100)
        try {
            dec1.toUInt8(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 6)
        try {
            dec1.toUInt16(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt16.")
            sum += 1
        }
        @Expect(sum, 7)
        try {
            dec1.toUInt32(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt32.")
            sum += 1
        }
        @Expect(sum, 8)
        try {
            dec1.toUInt64(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 9)
        try {
            dec1.toUIntNative(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt64.")
            sum += 1
        }
        @Expect(sum, 10)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Wrapping), -100)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Wrapping), -100)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Wrapping), -100)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Wrapping), -100)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Wrapping), -100)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Wrapping), 156)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Wrapping), 65436)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Wrapping), 4294967196)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Wrapping), 18446744073709551516)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Wrapping), 18446744073709551516)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Saturating), -100)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Saturating), -100)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Saturating), -100)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Saturating), -100)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Saturating), -100)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Saturating), 0)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Saturating), 0)
    }

    @TestCase
    func test_decimal_typeconvert_float32_02(): Unit {
        let dec1 = Decimal(-100.2879439443f32)
        @Expect(dec1.toFloat16().format("-100.100"), Float16(-100.2879439443).format("-100.100"))
        @Expect(dec1.toFloat32(), Float32(-100.2879439443))
        @Expect(dec1.toFloat64().format("-100.100"), Float32(-100.2879439443).format("-100.100"))
        @Expect(dec1.toBigInt(), BigInt(-100))
        @Expect(dec1.toInt8(), -100)
        @Expect(dec1.toInt16(), -100)
        @Expect(dec1.toInt32(), -100)
        @Expect(dec1.toInt64(), -100)
        @Expect(dec1.toIntNative(), -100)
    }
}
