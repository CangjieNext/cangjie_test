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
class Test_seek_Begin {
    @TestCase
    func test_seek_Begin_01(): Unit {
        let bs = ByteBuffer()
        let sr = StringWriter<ByteBuffer>(bs)
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        sr.seek(Begin(0))
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        sr.seek(Begin(Int64.Max))
        @Expect(sr.remainLength, -9223372036854775807)
        @Expect(sr.length, 0)
        @Expect(sr.position, 9223372036854775807)
    }

    @TestCase
    func test_seek_Begin_write_and_read(): Unit {
        // init
        let bs = ByteBuffer()
        let sr = StringWriter<ByteBuffer>(bs)
        var arr = Array<Byte>(10, repeat: 0)
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        // write data
        sr.write("helloworld")

        @Expect(sr.remainLength, 10)
        @Expect(sr.length, 10)
        @Expect(sr.position, 0)

        // seek
        bs.seek(Begin(5))
        sr.write("world".toArray())
        arr = readToEnd(bs)
        @Expect(String.fromUtf8(arr), "world")
        @Expect(sr.remainLength, 25)
        @Expect(sr.length, 35)
        @Expect(sr.position, 10)
    }

    @TestCase
    func test_seek_Exception1(): Unit {
        let bs = ByteBuffer()
        let sr = StringWriter<ByteBuffer>(bs)
        try {
            sr.seek(Begin(-1))
            @Expect(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }
    }
}
