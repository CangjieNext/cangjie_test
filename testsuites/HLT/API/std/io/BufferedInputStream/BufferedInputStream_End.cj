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
        let bis = BufferedInputStream(bs)
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 0)
        @Expect(bis.position, 0)

        bis.seek(End(0))
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 0)
        @Expect(bis.position, 0)

        bis.seek(End(Int64.Max))
        @Expect(bis.remainLength, -9223372036854775807)
        @Expect(bis.length, 0)
        @Expect(bis.position, 9223372036854775807)
    }

    @TestCase
    func test_seek_End_write_and_read(): Unit {
        let bs = ByteBuffer()
        bs.write("helloworld".toArray())
        let bis = BufferedInputStream(bs)
        var arr = Array<Byte>(1, repeat: 0)
        @Expect(bis.remainLength, 10)
        @Expect(bis.length, 10)
        @Expect(bis.position, 0)

        bis.read(arr)
        @Expect(String.fromUtf8(arr), "h")
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 10)
        @Expect(bis.position, 10)

        bis.seek(End(-5))
        bis.read(arr)
        @Expect(String.fromUtf8(arr), "w")
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 10)
        @Expect(bis.position, 10)

        bs.write("helloworld".toArray())
        bis.seek(End(-5))
        bis.read(arr)
        @Expect(String.fromUtf8(arr), "w")
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 20)
        @Expect(bis.position, 20)

        var arr1 = "helloworld".toArray()
        bis.read(arr1)
        @Expect(String.fromUtf8(arr1), "orldoworld")
        @Expect(bis.remainLength, 0)
        @Expect(bis.length, 20)
        @Expect(bis.position, 20)

        var newStream = ByteBuffer()
        newStream.write("newStream".toArray())
        bis.reset(newStream)
        @Expect(String.fromUtf8(arr), "w")
        @Expect(bis.remainLength, 9)
        @Expect(bis.length, 9)
        @Expect(bis.position, 0)
    }

    @TestCase
    func test_seek_Exception1(): Unit {
        let bs = ByteBuffer()
        let bis = BufferedInputStream(bs)
        try {
            bis.seek(End(-1))
            @Expect(false)
        } catch (e: IOException) {
            @Expect(e.message, "Can't move the position before the beginning of the stream.")
        }
    }

    @TestCase
    func test_seek_Exception2(): Unit {
        let bs = ByteBuffer()
        let bis = BufferedInputStream(bs)
        var arr = Array<Byte>(1, repeat: 0)
        bis.seek(End(5))
        try {
            bis.read(arr)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Negative copy length.")
        }
    }
}
