/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.overflow.*
import std.math.*

@Test
public class ThrowingShiftTest {
    @TestCase
    func intThrowingShlTest(): Unit {
        @Expect(Int8(1).throwingShl(0), 1)
        @Expect(Int8(1).throwingShl(1), 2)
        @Expect(Int8(1).throwingShl(7), Int8.Min)
        try {
            Int8(1).throwingShl(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int16(1).throwingShl(0), 1)
        @Expect(Int16(1).throwingShl(1), 2)
        @Expect(Int16(1).throwingShl(15), Int16.Min)
        try {
            Int16(1).throwingShl(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int32(1).throwingShl(0), 1)
        @Expect(Int32(1).throwingShl(1), 2)
        @Expect(Int32(1).throwingShl(31), Int32.Min)
        try {
            Int32(1).throwingShl(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int64(1).throwingShl(0), 1)
        @Expect(Int64(1).throwingShl(1), 2)
        @Expect(Int64(1).throwingShl(63), Int64.Min)
        try {
            Int64(1).throwingShl(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func intThrowingShrTest(): Unit {
        @Expect(Int8.Min.throwingShr(0), Int8.Min)
        @Expect(Int8.Min.throwingShr(1), Int8.Min >> 1)
        @Expect(Int8.Min.throwingShr(7), -1)
        try {
            Int8.Min.throwingShr(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int16.Min.throwingShr(0), Int16.Min)
        @Expect(Int16.Min.throwingShr(1), Int16.Min >> 1)
        @Expect(Int16.Min.throwingShr(15), -1)
        try {
            Int16.Min.throwingShr(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int32.Min.throwingShr(0), Int32.Min)
        @Expect(Int32.Min.throwingShr(1), Int32.Min >> 1)
        @Expect(Int32.Min.throwingShr(31), -1)
        try {
            Int32.Min.throwingShr(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(Int64.Min.throwingShr(0), Int64.Min)
        @Expect(Int64.Min.throwingShr(1), Int64.Min >> 1)
        @Expect(Int64.Min.throwingShr(63), -1)
        try {
            Int64.Min.throwingShr(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func uintThrowingShlTest(): Unit {
        @Expect(UInt8(1).throwingShl(0), 1)
        @Expect(UInt8(1).throwingShl(1), 2)
        @Expect(UInt8(1).throwingShl(7), 0x80)
        try {
            UInt8(1).throwingShl(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(UInt16(1).throwingShl(0), 1)
        @Expect(UInt16(1).throwingShl(1), 2)
        @Expect(UInt16(1).throwingShl(15), 0x8000)
        try {
            UInt16(1).throwingShl(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(UInt32(1).throwingShl(0), 1)
        @Expect(UInt32(1).throwingShl(1), 2)
        @Expect(UInt32(1).throwingShl(31), 0x8000_0000)
        try {
            UInt32(1).throwingShl(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        @Expect(UInt64(1).throwingShl(0), 1)
        @Expect(UInt64(1).throwingShl(1), 2)
        @Expect(UInt64(1).throwingShl(63), 0x8000_0000_0000_0000)
        try {
            UInt64(1).throwingShl(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func uintThrowingShrTest(): Unit {
        let u8: UInt8 = 128 // 0x80
        @Expect(u8.throwingShr(0), u8)
        @Expect(u8.throwingShr(1), u8 >> 1)
        @Expect(u8.throwingShr(7), 1)
        try {
            u8.throwingShr(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        let u16: UInt16 = 32768 // 0x8000
        @Expect(u16.throwingShr(0), u16)
        @Expect(u16.throwingShr(1), u16 >> 1)
        @Expect(u16.throwingShr(15), 1)
        try {
            u16.throwingShr(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        let u32: UInt32 = 2147483648 // 0x8000_0000
        @Expect(u32.throwingShr(0), u32)
        @Expect(u32.throwingShr(1), u32 >> 1)
        @Expect(u32.throwingShr(31), 1)
        try {
            u32.throwingShr(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        let u64: UInt64 = 9223372036854775808 // 0x8000_0000_0000_0000
        @Expect(u64.throwingShr(0), u64)
        @Expect(u64.throwingShr(1), u64 >> 1)
        @Expect(u64.throwingShr(63), 1)
        try {
            u64.throwingShr(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }
}
