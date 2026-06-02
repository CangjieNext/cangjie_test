/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*
import std.math.*

@Test
class Test_bytebuffer_read_write_setlength_03 {
    @TestCase
    func test_bytebuffer_read_write_setlength_01(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        let e = @AssertThrows[IllegalArgumentException](bb.setLength(-1))
        @Expect(e.message, "The length must be greater than or equal to 0.")
    }

    @TestCase
    func test_bytebuffer_read_write_setlength_02(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.length, 7)
        bb.setLength(0)
        @Expect(bb.length, 0)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bytebuffer_read_write_setlength_03(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.length, 7)
        bb.setLength(1)
        @Expect(bb.length, 1)
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bytebuffer_read_write_setlength_04(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.length, 7)
        bb.setLength(2)
        @Expect(bb.length, 2)
        @Expect(bb.readByte(), Option<Byte>.Some(187))
        @Expect(bb.readByte(), Option<Byte>.None)
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bytebuffer_read_write_setlength_05(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.length, 7)
        bb.setLength(100)
        @Expect(bb.length, 100)
        @Expect(bb.readByte(), Option<Byte>.Some(187))
        @Expect(bb.readByte(), Option<Byte>.Some(147))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
        @Expect(bb.readByte(), Option<Byte>.Some(1))
        @Expect(bb.readByte(), Option<Byte>.Some(2))
        @Expect(bb.readByte(), Option<Byte>.Some(3))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
    }
}
