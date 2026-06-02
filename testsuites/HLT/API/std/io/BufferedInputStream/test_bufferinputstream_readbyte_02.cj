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
class Test_bufferinputstream_readbyte_02 {
    @TestCase
    func test_bufferinputstream_readbyte_02_01(): Unit {
        var bb: ByteBuffer = ByteBuffer()
        var bs = BufferedInputStream(bb)
        var arr = Array<Byte>(100, {i => UInt8(i + 1)})
        bb.write(arr)
        bb.writeByte(0)
        for (j in 1u8..101u8) {
            @Expect(bs.readByte(), Option<Byte>.Some(j))
        }
        @Expect(bs.readByte(), Option<Byte>.Some(0))
        @Expect(bs.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bufferinputstream_readbyte_02_02(): Unit {
        var bb: ByteBuffer = ByteBuffer()
        var bs = BufferedInputStream(bb)
        var arr = Array<Byte>(100, {i => UInt8(i + 1)})
        bb.writeByte(0)
        @Expect(bs.readByte(), Option<Byte>.Some(0))
        @Expect(bs.readByte(), Option<Byte>.None)
        bs.read(arr)
        @Expect(bs.readByte(), Option<Byte>.None)
    }

    @TestCase
    func test_bufferinputstream_readbyte_02_03(): Unit {
        var bb: ByteBuffer = ByteBuffer("倉".toArray())
        var bs = BufferedInputStream(bb)
        @Expect(bs.readByte(), Option<Byte>.Some(229))
        @Expect(bs.readByte(), Option<Byte>.Some(128))
        @Expect(bs.readByte(), Option<Byte>.Some(137))
    }
}
