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

var sum = 0

@Test
class Test_decimal_typeconvert_uint16_29 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    @TestCase
    func test_decimal_typeconvert_uint16_01(): Unit {
        let dec1 = Decimal(65535u16)
        @Expect(dec1.toFloat16(), Float16(65535))
        @Expect(dec1.toFloat32(), Float32(65535))
        @Expect(dec1.toFloat64(), Float64(65535))
        @Expect(dec1.toBigInt(), BigInt(65535))
        try {
            dec1.toInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 1)
        try {
            dec1.toInt16()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
            sum += 1
        }
        @Expect(sum, 2)
        @Expect(dec1.toInt32(), 65535)
        @Expect(dec1.toInt64(), 65535)
        @Expect(dec1.toIntNative(), 65535)
        try {
            dec1.toUInt8()
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 3)
        @Expect(dec1.toUInt16(), 65535)
        @Expect(dec1.toUInt32(), 65535)
        @Expect(dec1.toUInt64(), 65535)
        @Expect(dec1.toUIntNative(), 65535)

        try {
            dec1.toInt8(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int8.")
            sum += 1
        }
        @Expect(sum, 4)
        try {
            dec1.toInt16(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the Int16.")
            sum += 1
        }
        @Expect(sum, 5)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Throwing), 65535)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Throwing), 65535)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Throwing), 65535)
        try {
            dec1.toUInt8(overflowHandling: OverflowStrategy.Throwing)
        } catch (e: OverflowException) {
            @Expect(e.message, "Out of range of the UInt8.")
            sum += 1
        }
        @Expect(sum, 6)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Throwing), 65535)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Throwing), 65535)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Throwing), 65535)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Throwing), 65535)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Wrapping), -1)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Wrapping), -1)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Wrapping), 255)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Wrapping), 65535)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Wrapping), 65535)

        @Expect(dec1.toInt8(overflowHandling:OverflowStrategy.Saturating), 127)
        @Expect(dec1.toInt16(overflowHandling:OverflowStrategy.Saturating), 32767)
        @Expect(dec1.toInt32(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toInt64(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toIntNative(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toUInt8(overflowHandling:OverflowStrategy.Saturating), 255)
        @Expect(dec1.toUInt16(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toUInt32(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toUInt64(overflowHandling:OverflowStrategy.Saturating), 65535)
        @Expect(dec1.toUIntNative(overflowHandling:OverflowStrategy.Saturating), 65535)
    }
}
