/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt
import std.io.*

@Test
public class readByteTest {
    @TestCase
    func setLengthTest(): Unit {
        let bs = ByteBuffer(3)
        @Expect(bs.length, 0)
        @Expect(bs.readByte(), None)
        var data = Array<Byte>(3, repeat: 65)
        bs.write(data)
        @Expect(bs.length, 3)
        bs.setLength(1)
        @Expect(bs.length, 1)
        bs.setLength(6)
        @Expect(bs.length, 6)
        bs.setLength(114514)
        @Expect(bs.length, 114514)
    }

    @TestCase
    func setLengthReadTest(): Unit {
        let bs = ByteBuffer(3)
        bs.write("hello,world!".toArray())
        @Expect(bs.length, 12)
        bs.setLength(3)
        @Expect(String.fromUtf8(readToEnd(bs)), "hel")
        bs.setLength(15)
        var data = readToEnd(bs)
        @Expect(data.size, 12)
        @Expect(data[9..12], [0u8, 0u8, 0u8])
    }

    @TestCase
    func lengthSeekTest(): Unit {
        let bs = ByteBuffer(3)
        var data = Array<Byte>(3, repeat: 65)
        bs.write(data)
        bs.writeByte(66)
        bs.writeByte(65)
        @Expect(bs.length, 5)
        bs.setLength(10)
        bs.seek(Current(5))
        @Expect(bs.length, 10)
        bs.setLength(9)
        bs.seek(End(-2))
        @Expect(bs.length, 9)
        bs.setLength(3)
        bs.seek(End(-3))
        @Expect(bs.length, 3)
        bs.readByte()
        @Expect(bs.length, 3)
    }

    @TestCase
    func setLengthTestInvalid(): Unit {
        let bs = ByteBuffer(3)
        var count = 0
        try {
            bs.setLength(-1)
        } catch (e: IllegalArgumentException) {
            count++
        }
        @Expect(count, 1)
    }

    @TestCase
    func setLengthReadWriteTest1(): Unit {
        println("仓".toArray())
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        bb.writeByte(0)
        let arr: Array<Byte> = [1, 2, 3]
        bb.write(arr)
        @Expect(bb.length, 7)
        @Expect(bb.readByte(), Option<Byte>.Some(187))
        @Expect(bb.readByte(), Option<Byte>.Some(147))
        @Expect(bb.readByte(), Option<Byte>.Some(0))
        @Expect(bb.readByte(), Option<Byte>.Some(1))
        @Expect(bb.readByte(), Option<Byte>.Some(2))
        @Expect(bb.readByte(), Option<Byte>.Some(3))
        let aaa: Array<Byte> = Array<Byte>(3, repeat: 0)
        bb.read(aaa)
        @Expect(bb.readByte(), Option<Byte>.None)
    }

    @TestCase
    func setLengthReadWriteTest2(): Unit {
        println("仓".toArray())
        var bb: ByteBuffer = ByteBuffer("仓".toArray())
        @Expect(bb.readByte(), Option<Byte>.Some(228))
        @Expect(bb.length, 3)
        bb.setLength(0)
        @Expect(bb.length, 0)
        @Expect(bb.readByte(), Option<Byte>.None)
        let aaa: Array<Byte> = Array<Byte>(3, repeat: 0)
        bb.read(aaa)
        @Expect(aaa, [0u8, 0u8, 0u8])
        bb.writeByte(65)
        @Expect(bb.readByte(), 65)
        bb.setLength(15)
        @Expect(bb.length, 15)
        @Expect(bb.readByte(), 0)
        bb.writeByte(65)
        @Expect(bb.length, 16)
    }
}
