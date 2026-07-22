/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class IoEdgeBranchTest {

    @TestCase
    func test_bytebuffer_init_default(): Unit {
        let buf = ByteBuffer()
        @Assert(buf.capacity >= 0)
    }

    @TestCase
    func test_bytebuffer_init_capacity(): Unit {
        let buf = ByteBuffer(256)
        @Expect(buf.capacity, 256)
    }

    @TestCase
    func test_bytebuffer_init_from_array(): Unit {
        var data = Array<Byte>(5, repeat: 0u8)
        data[0] = 1u8; data[1] = 2u8; data[2] = 3u8; data[3] = 4u8; data[4] = 5u8
        let buf = ByteBuffer(data)
        @Assert(buf.capacity >= 5)
    }

    @TestCase
    func test_bytebuffer_clone(): Unit {
        var data = Array<Byte>(3, repeat: 0u8)
        data[0] = 1u8; data[1] = 2u8; data[2] = 3u8
        let buf = ByteBuffer(data)
        let cloned = buf.clone()
        @Assert(cloned.bytes().size == 3)
    }

    @TestCase
    func test_bytebuffer_clear(): Unit {
        var data = Array<Byte>(3, repeat: 0u8)
        data[0] = 1u8; data[1] = 2u8; data[2] = 3u8
        let buf = ByteBuffer(data)
        buf.clear()
        @Assert(buf.bytes().size == 0)
    }

    @TestCase
    func test_bytebuffer_read(): Unit {
        var data = Array<Byte>(5, repeat: 0u8)
        data[0] = 1u8; data[1] = 2u8; data[2] = 3u8; data[3] = 4u8; data[4] = 5u8
        let buf = ByteBuffer(data)
        var readBuf = Array<Byte>(3, repeat: 0u8)
        let n = buf.read(readBuf)
        @Expect(n, 3)
        @Expect(readBuf[0], 1u8)
    }

    @TestCase
    func test_bytebuffer_read_byte(): Unit {
        var data = Array<Byte>(3, repeat: 0u8)
        data[0] = 42u8; data[1] = 43u8; data[2] = 44u8
        let buf = ByteBuffer(data)
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 42u8)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_bytebuffer_read_byte_empty(): Unit {
        let buf = ByteBuffer()
        match (buf.readByte()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_bytebuffer_write(): Unit {
        let buf = ByteBuffer(256)
        var data = Array<Byte>(3, repeat: 0u8)
        data[0] = 10u8; data[1] = 20u8; data[2] = 30u8
        buf.write(data)
        var readBuf = Array<Byte>(3, repeat: 0u8)
        let _ = buf.read(readBuf)
        @Expect(readBuf[0], 10u8)
    }

    @TestCase
    func test_bytebuffer_write_byte(): Unit {
        let buf = ByteBuffer(256)
        buf.writeByte(42u8)
        match (buf.readByte()) {
            case Some(b) => @Expect(b, 42u8)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_bytebuffer_set_length(): Unit {
        let buf = ByteBuffer(256)
        buf.setLength(100)
        @Assert(buf.bytes().size == 100)
    }

    @TestCase
    func test_bytebuffer_reserve(): Unit {
        let buf = ByteBuffer(16)
        buf.reserve(100)
        @Assert(buf.capacity >= 116)
    }

    @TestCase
    func test_bytebuffer_bytes(): Unit {
        var data = Array<Byte>(3, repeat: 0u8)
        data[0] = 10u8; data[1] = 20u8; data[2] = 30u8
        let buf = ByteBuffer(data)
        let bytes = buf.bytes()
        @Expect(bytes.size, 3)
        @Expect(bytes[0], 10u8)
    }

    @TestCase
    func test_bytebuffer_write_then_read_multiple(): Unit {
        let buf = ByteBuffer(256)
        var d1 = Array<Byte>(3, repeat: 0u8)
        d1[0] = 1u8; d1[1] = 2u8; d1[2] = 3u8
        buf.write(d1)
        var d2 = Array<Byte>(2, repeat: 0u8)
        d2[0] = 4u8; d2[1] = 5u8
        buf.write(d2)
        var r = Array<Byte>(5, repeat: 0u8)
        let n = buf.read(r)
        @Expect(n, 5)
        @Expect(r[0], 1u8)
        @Expect(r[3], 4u8)
    }
}
