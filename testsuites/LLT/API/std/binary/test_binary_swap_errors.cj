/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.binary.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class BinarySwapErrorTest {
    @TestCase
    func test_int64_swap(): Unit {
        let val = Int64(0x0102030405060708)
        let swapped = val.swapBytes()
        @Expect(swapped == Int64(0x0807060504030201))
        @Expect(swapped.swapBytes() == val)
    }

    @TestCase
    func test_uint32_swap(): Unit {
        let val = UInt32(0x12345678)
        @Expect(val.swapBytes() == UInt32(0x78563412))
        @Expect(val.swapBytes().swapBytes() == val)
    }

    @TestCase
    func test_int32_swap(): Unit {
        let val = Int32(0x12345678)
        @Expect(val.swapBytes() == Int32(0x78563412))
        @Expect(val.swapBytes().swapBytes() == val)
    }

    @TestCase
    func test_uint16_swap(): Unit {
        let val = UInt16(0x1234)
        @Expect(val.swapBytes() == UInt16(0x3412))
        @Expect(val.swapBytes().swapBytes() == val)
    }

    @TestCase
    func test_int16_swap(): Unit {
        let val = Int16(0x1234)
        @Expect(val.swapBytes() == Int16(0x3412))
        @Expect(val.swapBytes().swapBytes() == val)
    }

    @TestCase
    func test_uint8_swap(): Unit {
        let val = UInt8(0x12)
        @Expect(val.swapBytes() == UInt8(0x12))
    }

    @TestCase
    func test_int8_swap(): Unit {
        let val = Int8(0x01)
        @Expect(val.swapBytes() == Int8(0x01))
    }

    @TestCase
    func test_uint64_write_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            UInt64(0x123456789ABCDEF0).writeLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint64_write_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            UInt64(0x123456789ABCDEF0).writeBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint64_read_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            UInt64.readLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint64_read_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            UInt64.readBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_int64_write_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            Int64(0x0102030405060708).writeLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_int64_read_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            Int64.readLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_int64_read_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            Int64.readBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint32_write_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0]
            UInt32(0x12345678).writeLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint32_read_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0]
            UInt32.readLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_int32_read_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0]
            Int32.readBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint16_write_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0]
            UInt16(0x1234).writeLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_uint16_read_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0]
            UInt16.readBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_int16_read_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0]
            Int16.readLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_float64_write_le_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0, 0, 0, 0, 0]
            Float64.fromBits(0x25262728292a2b2c).writeLittleEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_float32_read_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0, 0, 0]
            Float32.readBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }

    @TestCase
    func test_float16_write_be_small(): Unit {
        try {
            let buf: Array<Byte> = [0]
            Float16.fromBits(0x1f20).writeBigEndian(buf)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("too small"))
        }
    }
}
