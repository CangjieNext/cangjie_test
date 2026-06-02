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
class Test_seek_current {
    @TestCase
    func test_seek_current_01(): Unit {
        let bs = ByteBuffer()
        @Expect(bs.remainLength, 0)
        @Expect(bs.length, 0)
        @Expect(bs.position, 0)

        bs.seek(Current(0))
        @Expect(bs.remainLength, 0)
        @Expect(bs.length, 0)
        @Expect(bs.position, 0)

        bs.seek(Current(Int64.Max))
        @Expect(bs.remainLength, -9223372036854775807)
        @Expect(bs.length, 0)
        @Expect(bs.position, 9223372036854775807)
    }

    @TestCase
    func test_seek_current_write_and_read(): Unit {
        // init
        let bs = ByteBuffer()
        bs.write("helloworld".toArray())
        var arr = Array<Byte>(1, repeat: 0)
        @Expect(bs.remainLength, 10)
        @Expect(bs.length, 10)
        @Expect(bs.position, 0)

        // read
        bs.read(arr)
        @Expect(String.fromUtf8(arr), "h")
        @Expect(bs.remainLength, 9)
        @Expect(bs.length, 10)
        @Expect(bs.position, 1)

        // seek
        bs.seek(Current(5))
        bs.read(arr)
        @Expect(String.fromUtf8(arr), "o")
        @Expect(bs.remainLength, 3)
        @Expect(bs.length, 10)
        @Expect(bs.position, 7)

        // write
        bs.write("helloworld".toArray())
        @Expect(String.fromUtf8(arr), "o")
        @Expect(bs.remainLength, 13)
        @Expect(bs.length, 20)
        @Expect(bs.position, 7)
    }

    @TestCase
    func test_seek_Exception1(): Unit {
        let bs = ByteBuffer()
        try {
            bs.seek(Current(-1))
            @Expect(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }
    }

    @TestCase
    func test_seek_Exception2(): Unit {
        let bs = ByteBuffer()
        var arr = Array<Byte>(1, repeat: 0)
        bs.seek(Current(5))
        try {
            bs.read(arr)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Negative copy length.")
        }
    }
}
