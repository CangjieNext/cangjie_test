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
public class SaturatingShiftTest {
    @TestCase
    func intSaturatingShlTest(): Unit {
        @Expect(Int8(1).saturatingShl(0), 1)
        @Expect(Int8(1).saturatingShl(1), 2)
        @Expect(Int8(1).saturatingShl(7), Int8.Min)
        @Expect(Int8(1).saturatingShl(8), Int8.Min)

        @Expect(Int16(1).saturatingShl(0), 1)
        @Expect(Int16(1).saturatingShl(1), 2)
        @Expect(Int16(1).saturatingShl(15), Int16.Min)
        @Expect(Int16(1).saturatingShl(16), Int16.Min)

        @Expect(Int32(1).saturatingShl(0), 1)
        @Expect(Int32(1).saturatingShl(1), 2)
        @Expect(Int32(1).saturatingShl(31), Int32.Min)
        @Expect(Int32(1).saturatingShl(32), Int32.Min)

        @Expect(Int64(1).saturatingShl(0), 1)
        @Expect(Int64(1).saturatingShl(1), 2)
        @Expect(Int64(1).saturatingShl(63), Int64.Min)
        @Expect(Int64(1).saturatingShl(64), Int64.Min)
    }

    @TestCase
    func intSaturatingShrTest(): Unit {
        @Expect(Int8.Min.saturatingShr(0), Int8.Min)
        @Expect(Int8.Min.saturatingShr(1), Int8.Min >> 1)
        @Expect(Int8.Min.saturatingShr(7), -1)
        @Expect(Int8.Min.saturatingShr(8), -1)

        @Expect(Int16.Min.saturatingShr(0), Int16.Min)
        @Expect(Int16.Min.saturatingShr(1), Int16.Min >> 1)
        @Expect(Int16.Min.saturatingShr(15), -1)
        @Expect(Int16.Min.saturatingShr(16), -1)

        @Expect(Int32.Min.saturatingShr(0), Int32.Min)
        @Expect(Int32.Min.saturatingShr(1), Int32.Min >> 1)
        @Expect(Int32.Min.saturatingShr(31), -1)
        @Expect(Int32.Min.saturatingShr(32), -1)

        @Expect(Int64.Min.saturatingShr(0), Int64.Min)
        @Expect(Int64.Min.saturatingShr(1), Int64.Min >> 1)
        @Expect(Int64.Min.saturatingShr(63), -1)
        @Expect(Int64.Min.saturatingShr(64), -1)
    }

    @TestCase
    func uintSaturatingShlTest(): Unit {
        @Expect(UInt8(1).saturatingShl(0), 1)
        @Expect(UInt8(1).saturatingShl(1), 2)
        @Expect(UInt8(1).saturatingShl(7), 0x80)
        @Expect(UInt8(1).saturatingShl(8), 0x80)

        @Expect(UInt16(1).saturatingShl(0), 1)
        @Expect(UInt16(1).saturatingShl(1), 2)
        @Expect(UInt16(1).saturatingShl(15), 0x8000)
        @Expect(UInt16(1).saturatingShl(16), 0x8000)

        @Expect(UInt32(1).saturatingShl(0), 1)
        @Expect(UInt32(1).saturatingShl(1), 2)
        @Expect(UInt32(1).saturatingShl(31), 0x8000_0000)
        @Expect(UInt32(1).saturatingShl(32), 0x8000_0000)

        @Expect(UInt64(1).saturatingShl(0), 1)
        @Expect(UInt64(1).saturatingShl(1), 2)
        @Expect(UInt64(1).saturatingShl(63), 0x8000_0000_0000_0000)
        @Expect(UInt64(1).saturatingShl(64), 0x8000_0000_0000_0000)
    }

    @TestCase
    func uintSaturatingShrTest(): Unit {
        let u8: UInt8 = 128 // 0x80
        @Expect(u8.saturatingShr(0), u8)
        @Expect(u8.saturatingShr(1), u8 >> 1)
        @Expect(u8.saturatingShr(7), 1)
        @Expect(u8.saturatingShr(8), 1)

        let u16: UInt16 = 32768 // 0x8000
        @Expect(u16.saturatingShr(0), u16)
        @Expect(u16.saturatingShr(1), u16 >> 1)
        @Expect(u16.saturatingShr(15), 1)
        @Expect(u16.saturatingShr(16), 1)

        let u32: UInt32 = 2147483648 // 0x8000_0000
        @Expect(u32.saturatingShr(0), u32)
        @Expect(u32.saturatingShr(1), u32 >> 1)
        @Expect(u32.saturatingShr(31), 1)
        @Expect(u32.saturatingShr(32), 1)

        let u64: UInt64 = 9223372036854775808 // 0x8000_0000_0000_0000
        @Expect(u64.saturatingShr(0), u64)
        @Expect(u64.saturatingShr(1), u64 >> 1)
        @Expect(u64.saturatingShr(63), 1)
        @Expect(u64.saturatingShr(64), 1)
    }
}
