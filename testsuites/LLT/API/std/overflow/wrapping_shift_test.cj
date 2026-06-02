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
public class WrappingShiftTest {
    @TestCase
    func intWrappingShlTest(): Unit {
        @Expect(Int8(1).wrappingShl(UInt64(0)), 1)
        @Expect(Int8(1).wrappingShl(UInt64(1)), 2)
        @Expect(Int8(1).wrappingShl(UInt64(7)), Int8.Min)
        @Expect(Int8(1).wrappingShl(UInt64(8)), 1)

        @Expect(Int16(1).wrappingShl(UInt64(0)), 1)
        @Expect(Int16(1).wrappingShl(UInt64(1)), 2)
        @Expect(Int16(1).wrappingShl(UInt64(15)), Int16.Min)
        @Expect(Int16(1).wrappingShl(UInt64(16)), 1)

        @Expect(Int32(1).wrappingShl(UInt64(0)), 1)
        @Expect(Int32(1).wrappingShl(UInt64(1)), 2)
        @Expect(Int32(1).wrappingShl(UInt64(31)), Int32.Min)
        @Expect(Int32(1).wrappingShl(UInt64(32)), 1)

        @Expect(Int64(1).wrappingShl(UInt64(0)), 1)
        @Expect(Int64(1).wrappingShl(UInt64(1)), 2)
        @Expect(Int64(1).wrappingShl(UInt64(63)), Int64.Min)
        @Expect(Int64(1).wrappingShl(UInt64(64)), 1)
    }

    @TestCase
    func intWrappingShrTest(): Unit {
        @Expect(Int8.Min.wrappingShr(UInt64(0)), Int8.Min)
        @Expect(Int8.Min.wrappingShr(UInt64(1)), Int8.Min >> 1)
        @Expect(Int8.Min.wrappingShr(UInt64(7)), -1)
        @Expect(Int8.Min.wrappingShr(UInt64(8)), Int8.Min)

        @Expect(Int16.Min.wrappingShr(UInt64(0)), Int16.Min)
        @Expect(Int16.Min.wrappingShr(UInt64(1)), Int16.Min >> 1)
        @Expect(Int16.Min.wrappingShr(UInt64(15)), -1)
        @Expect(Int16.Min.wrappingShr(UInt64(16)), Int16.Min)

        @Expect(Int32.Min.wrappingShr(UInt64(0)), Int32.Min)
        @Expect(Int32.Min.wrappingShr(UInt64(1)), Int32.Min >> 1)
        @Expect(Int32.Min.wrappingShr(UInt64(31)), -1)
        @Expect(Int32.Min.wrappingShr(UInt64(32)), Int32.Min)

        @Expect(Int64.Min.wrappingShr(UInt64(0)), Int64.Min)
        @Expect(Int64.Min.wrappingShr(UInt64(1)), Int64.Min >> 1)
        @Expect(Int64.Min.wrappingShr(UInt64(63)), -1)
        @Expect(Int64.Min.wrappingShr(UInt64(64)), Int64.Min)
    }

    @TestCase
    func uintWrappingShlTest(): Unit {
        @Expect(UInt8(1).wrappingShl(UInt64(0)), 1)
        @Expect(UInt8(1).wrappingShl(UInt64(1)), 2)
        @Expect(UInt8(1).wrappingShl(UInt64(7)), 0x80)
        @Expect(UInt8(1).wrappingShl(UInt64(8)), 1)

        @Expect(UInt16(1).wrappingShl(UInt64(0)), 1)
        @Expect(UInt16(1).wrappingShl(UInt64(1)), 2)
        @Expect(UInt16(1).wrappingShl(UInt64(15)), 0x8000)
        @Expect(UInt16(1).wrappingShl(UInt64(16)), 1)

        @Expect(UInt32(1).wrappingShl(UInt64(0)), 1)
        @Expect(UInt32(1).wrappingShl(UInt64(1)), 2)
        @Expect(UInt32(1).wrappingShl(UInt64(31)), 0x8000_0000)
        @Expect(UInt32(1).wrappingShl(UInt64(32)), 1)

        @Expect(UInt64(1).wrappingShl(0), 1)
        @Expect(UInt64(1).wrappingShl(1), 2)
        @Expect(UInt64(1).wrappingShl(63), 0x8000_0000_0000_0000)
        @Expect(UInt64(1).wrappingShl(64), 1)
    }

    @TestCase
    func uintWrappingShrTest(): Unit {
        let u8: UInt8 = 128 // 0x80
        @Expect(u8.wrappingShr(UInt64(0)), u8)
        @Expect(u8.wrappingShr(UInt64(1)), u8 >> 1)
        @Expect(u8.wrappingShr(UInt64(7)), 1)
        @Expect(u8.wrappingShr(UInt64(8)), u8)

        let u16: UInt16 = 32768 // 0x8000
        @Expect(u16.wrappingShr(UInt64(0)), u16)
        @Expect(u16.wrappingShr(UInt64(1)), u16 >> 1)
        @Expect(u16.wrappingShr(UInt64(15)), 1)
        @Expect(u16.wrappingShr(UInt64(16)), u16)

        let u32: UInt32 = 2147483648 // 0x8000_0000
        @Expect(u32.wrappingShr(UInt64(0)), u32)
        @Expect(u32.wrappingShr(UInt64(1)), u32 >> 1)
        @Expect(u32.wrappingShr(UInt64(31)), 1)
        @Expect(u32.wrappingShr(UInt64(32)), u32)

        let u64: UInt64 = 9223372036854775808 // 0x8000_0000_0000_0000
        @Expect(u64.wrappingShr(0), u64)
        @Expect(u64.wrappingShr(1), u64 >> 1)
        @Expect(u64.wrappingShr(63), 1)
        @Expect(u64.wrappingShr(64), u64)
    }
}
