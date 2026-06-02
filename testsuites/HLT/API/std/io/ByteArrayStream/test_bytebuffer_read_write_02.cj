/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*

@Test
class Test_bytebuffer_read_write_02 {
    @TestCase
    func test_bytebuffer_read_write_02_01(): Unit {
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.readByte(), Option<Byte>.Some(187))
        @Expect(bb.readByte(), Option<Byte>.Some(147))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
        @Expect(bb.readByte(), Option<Byte>.Some(1))
        @Expect(bb.readByte(), Option<Byte>.Some(2))
        @Expect(bb.readByte(), Option<Byte>.Some(3))
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bytebuffer_read_write_02_02(): Unit {
        var bb: ByteBuffer = ByteBuffer("倉".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(229))
        let arr: Array<Byte> = [0, 1, 2]
        bb.write(arr)
        bb.writeByte(3)
        @Expect(bb.readByte(), Option<Byte>.Some(128))
        @Expect(bb.readByte(), Option<Byte>.Some(137))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
        @Expect(bb.readByte(), Option<Byte>.Some(1))
        @Expect(bb.readByte(), Option<Byte>.Some(2))
        @Expect(bb.readByte(), Option<Byte>.Some(3))
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bytebuffer_read_write_02_03(): Unit {
        var bb: ByteBuffer = ByteBuffer("♫♬♪♩✲✳".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(226))
        let arr: Array<Byte> = [0, 1, 2]
        bb.write(arr)
        bb.writeByte(3)
        @Expect(bb.readByte(), Option<Byte>.Some(153))
        @Expect(bb.readByte(), Option<Byte>.Some(171))
        @Expect(bb.readByte(), Option<Byte>.Some(226))
        @Expect(bb.readByte(), Option<Byte>.Some(153))
        @Expect(bb.readByte(), Option<Byte>.Some(172))
    }
}
