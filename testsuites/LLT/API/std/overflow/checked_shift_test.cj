/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args
// ASSERT:regex-begin .*PASSED.*: 4,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

import std.overflow.*
import std.math.*

@Test
public class CheckedShiftTest {
    @TestCase
    func intCheckedShlTest(): Unit {
        @Expect(Int8(1).checkedShl(0), 1)
        @Expect(Int8(1).checkedShl(1), 2)
        @Expect(Int8(1).checkedShl(7), Int8.Min)
        @Expect(Int8(1).checkedShl(8), Option<Int8>.None)

        @Expect(Int16(1).checkedShl(0), 1)
        @Expect(Int16(1).checkedShl(1), 2)
        @Expect(Int16(1).checkedShl(15), Int16.Min)
        @Expect(Int16(1).checkedShl(16), Option<Int16>.None)

        @Expect(Int32(1).checkedShl(0), 1)
        @Expect(Int32(1).checkedShl(1), 2)
        @Expect(Int32(1).checkedShl(31), Int32.Min)
        @Expect(Int32(1).checkedShl(32), Option<Int32>.None)

        @Expect(Int64(1).checkedShl(0), 1)
        @Expect(Int64(1).checkedShl(1), 2)
        @Expect(Int64(1).checkedShl(63), Int64.Min)
        @Expect(Int64(1).checkedShl(64), Option<Int64>.None)
    }

    @TestCase
    func intCheckedShrTest(): Unit {
        @Expect(Int8.Min.checkedShr(0), Int8.Min)
        @Expect(Int8.Min.checkedShr(1), Int8.Min >> 1)
        @Expect(Int8.Min.checkedShr(7), -1)
        @Expect(Int8.Min.checkedShr(8), Option<Int8>.None)

        @Expect(Int16.Min.checkedShr(0), Int16.Min)
        @Expect(Int16.Min.checkedShr(1), Int16.Min >> 1)
        @Expect(Int16.Min.checkedShr(15), -1)
        @Expect(Int16.Min.checkedShr(16), Option<Int16>.None)

        @Expect(Int32.Min.checkedShr(0), Int32.Min)
        @Expect(Int32.Min.checkedShr(1), Int32.Min >> 1)
        @Expect(Int32.Min.checkedShr(31), -1)
        @Expect(Int32.Min.checkedShr(32), Option<Int32>.None)

        @Expect(Int64.Min.checkedShr(0), Int64.Min)
        @Expect(Int64.Min.checkedShr(1), Int64.Min >> 1)
        @Expect(Int64.Min.checkedShr(63), -1)
        @Expect(Int64.Min.checkedShr(64), Option<Int64>.None)
    }

    @TestCase
    func uintCheckedShlTest(): Unit {
        @Expect(UInt8(1).checkedShl(0), 1)
        @Expect(UInt8(1).checkedShl(1), 2)
        @Expect(UInt8(1).checkedShl(7), 0x80)
        @Expect(UInt8(1).checkedShl(8), None)

        @Expect(UInt16(1).checkedShl(0), 1)
        @Expect(UInt16(1).checkedShl(1), 2)
        @Expect(UInt16(1).checkedShl(15), 0x8000)
        @Expect(UInt16(1).checkedShl(16), None)

        @Expect(UInt32(1).checkedShl(0), 1)
        @Expect(UInt32(1).checkedShl(1), 2)
        @Expect(UInt32(1).checkedShl(31), 0x8000_0000)
        @Expect(UInt32(1).checkedShl(32), None)

        @Expect(UInt64(1).checkedShl(0), 1)
        @Expect(UInt64(1).checkedShl(1), 2)
        @Expect(UInt64(1).checkedShl(63), 0x8000_0000_0000_0000)
        @Expect(UInt64(1).checkedShl(64), None)
    }

    @TestCase
    func uintCheckedShrTest(): Unit {
        let u8: UInt8 = 128 // 0x80
        @Expect(u8.checkedShr(0), u8)
        @Expect(u8.checkedShr(1), u8 >> 1)
        @Expect(u8.checkedShr(7), 1)
        @Expect(u8.checkedShr(8), None)

        let u16: UInt16 = 32768 // 0x8000
        @Expect(u16.checkedShr(UInt64(0)), u16)
        @Expect(u16.checkedShr(UInt64(1)), u16 >> 1)
        @Expect(u16.checkedShr(UInt64(15)), 1)
        @Expect(u16.checkedShr(UInt64(16)), Option<UInt16>.None)

        let u32: UInt32 = 2147483648 // 0x8000_0000
        @Expect(u32.checkedShr(UInt64(0)), u32)
        @Expect(u32.checkedShr(UInt64(1)), u32 >> 1)
        @Expect(u32.checkedShr(UInt64(31)), 1)
        @Expect(u32.checkedShr(UInt64(32)), Option<UInt32>.None)

        let u64: UInt64 = 9223372036854775808 // 0x8000_0000_0000_0000
        @Expect(u64.checkedShr(UInt64(0)), u64)
        @Expect(u64.checkedShr(UInt64(1)), u64 >> 1)
        @Expect(u64.checkedShr(UInt64(63)), 1)
        @Expect(u64.checkedShr(UInt64(64)), Option<UInt64>.None)
    }
}
