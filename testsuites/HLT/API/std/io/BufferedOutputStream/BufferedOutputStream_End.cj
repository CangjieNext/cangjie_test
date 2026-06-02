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
import std.math.*

@Test
class Test_seek_End {
    @TestCase
    func test_seek_End_01(): Unit {
        let bs = ByteBuffer()
        let bos = BufferedOutputStream(bs)
        @Expect(bos.remainLength, 0)
        @Expect(bos.length, 0)
        @Expect(bos.position, 0)

        bos.seek(End(0))
        @Expect(bos.remainLength, 0)
        @Expect(bos.length, 0)
        @Expect(bos.position, 0)

        bos.seek(End(Int64.Max))
        @Expect(bos.remainLength, -9223372036854775807)
        @Expect(bos.length, 0)
        @Expect(bos.position, 9223372036854775807)
    }

    @TestCase
    func test_seek_End_write_and_read(): Unit {
        let bs = ByteBuffer()
        let bos = BufferedOutputStream(bs, 20)
        var arr = Array<Byte>(20, repeat: 0)
        @Expect(bos.remainLength, 0)
        @Expect(bos.length, 0)
        @Expect(bos.position, 0)

        // write data
        bos.write("helloworld".toArray())
        arr = readToEnd(bs)
        @Expect(bos.remainLength, 0)
        @Expect(bos.length, 0)
        @Expect(bos.position, 0)
        @Expect(String.fromUtf8(arr), "")

        // seek and write
        bos.seek(End(-5))
        bos.write("hello".toArray())
        arr = readToEnd(bs)
        @Expect(bos.remainLength, 0)
        @Expect(bos.length, 10)
        @Expect(bos.position, 10)
        @Expect(String.fromUtf8(arr), "world")

        // flush
        bos.write("helloworld".toArray())
        bos.flush()
        @Expect(bos.remainLength, 15)
        @Expect(bos.length, 25)
        @Expect(bos.position, 10)
        @Expect(String.fromUtf8(arr), "world")
    }

    @TestCase
    func test_seek_Exception1(): Unit {
        let bs = ByteBuffer()
        let bos = BufferedOutputStream(bs)
        try {
            bos.seek(End(-1))
            @Expect(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }
    }
}
