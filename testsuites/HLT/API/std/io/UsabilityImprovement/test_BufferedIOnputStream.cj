/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*

@Test
class Test_BufferedInputStream {
    @TestCase
    func BufferedInputStream_case01(): Unit {
        var inputStream = ByteBuffer()
        var buffer = Array<Byte>(0, repeat: 0)
        try {
            var bufferedInputStream = BufferedInputStream(inputStream, buffer)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The buffer cannot be empty.")
        }
    }

    @TestCase
    func BufferedInputStream_case02(): Unit {
        var buffer = Array<Byte>(1, repeat: 0)
        var arr = Array<Byte>(10, {i => UInt8(i % 256)})
        var inputStream = ByteBuffer()
        inputStream.write(arr)
        var tempBuf = Array<Byte>(10, repeat: 0)
        var outputStream1 = ByteBuffer()
        var bufferedInputStream = BufferedInputStream(inputStream, buffer)
        while (true) {
            var readNums = bufferedInputStream.read(tempBuf)
            if (readNums == 0) {
                @Expect(true)
                break
            }
            outputStream1.write(tempBuf.slice(0, readNums).toArray())
        }

        if (arr != readToEnd(outputStream1)) {
            @Expect(false)
        }
    }

    @TestCase
    func BufferedInputStream_case03(): Unit {
        var buffer = Array<Byte>(20000, repeat: 0)
        var arr = Array<Byte>(10000, {i => UInt8(i % 256)})
        var inputStream = ByteBuffer()
        inputStream.write(arr)
        var tempBuf = Array<Byte>(1024, repeat: 0)
        var outputStream1 = ByteBuffer()
        var bufferedInputStream = BufferedInputStream(inputStream, buffer)
        while (true) {
            var readNums = bufferedInputStream.read(tempBuf)
            if (readNums == 0) {
                @Expect(true)
                break
            }
            outputStream1.write(tempBuf.slice(0, readNums).toArray())
        }

        if (arr != readToEnd(outputStream1)) {
            @Expect(false)
        }
    }

    @TestCase
    func BufferedOutputStream_case04(): Unit {
        var inputStream = ByteBuffer()
        var buffer = Array<Byte>(0, repeat: 0)
        try {
            var bufferedInputStream = BufferedOutputStream(inputStream, buffer)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The buffer cannot be empty.")
        }
    }

    @TestCase
    func BufferedOutputStream_case05(): Unit {
        var buffer = Array<Byte>(1, repeat: 0)
        var arr = Array<Byte>(8192, {i => UInt8(i % 256)})
        var outputStream = ByteBuffer()
        var bufferedOutputStream = BufferedOutputStream(outputStream, buffer)
        bufferedOutputStream.write(arr)
        bufferedOutputStream.flush()
        var dataArray = readToEnd(outputStream)
        if (dataArray != arr) {
            @Expect(false)
        }
        @Expect(true)
    }

    @TestCase
    func BufferedOutputStream_case06(): Unit {
        var buffer = Array<Byte>(10000, repeat: 0)
        var arr = Array<Byte>(5000, {i => UInt8(i % 256)})
        var outputStream = ByteBuffer()
        var bufferedOutputStream = BufferedOutputStream(outputStream, buffer)
        bufferedOutputStream.write(arr)
        bufferedOutputStream.flush()
        var dataArray = readToEnd(outputStream)
        if (dataArray != arr) {
            @Expect(false)
        }
        @Expect(true)
    }
}
