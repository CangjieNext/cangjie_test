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
class Test_seek_End {
    @TestCase
    func test_seek_End_01(): Unit {
        let bs = ByteBuffer()
        let sr = StringReader<ByteBuffer>(bs)
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        sr.seek(End(0))
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        sr.seek(End(Int64.Max))
        @Expect(sr.remainLength, -9223372036854775807)
        @Expect(sr.length, 0)
        @Expect(sr.position, 9223372036854775807)
    }

    @TestCase
    func test_seek_End_write_and_read(): Unit {
        // init
        let bs = ByteBuffer()
        let sr = StringReader<ByteBuffer>(bs)
        var str: String
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 0)
        @Expect(sr.position, 0)

        // write data
        bs.write("helloworld".toArray())
        str = sr.readToEnd()
        @Expect(str, "helloworld")
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 10)
        @Expect(sr.position, 10)

        // seek
        bs.seek(End(5))
        bs.write("world".toArray())
        str = sr.readToEnd()
        @Expect(str, "world")
        @Expect(sr.remainLength, 0)
        @Expect(sr.length, 20)
        @Expect(sr.position, 20)
    }

    @TestCase
    func test_seek_Exception1(): Unit {
        let bs = ByteBuffer()
        let sr = StringReader<ByteBuffer>(bs)
        try {
            sr.seek(End(-1))
            @Expect(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }
    }
}
