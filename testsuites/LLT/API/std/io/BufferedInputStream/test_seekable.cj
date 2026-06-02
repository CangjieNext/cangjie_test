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
public class SeekAbleTest {
    @TestCase
    func seekTest(): Unit {
        let bs = ByteBuffer()
        let bis = BufferedInputStream<ByteBuffer>(bs)
        @Expect(bis.length, 0)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 0)

        bs.write("hello,world!".toArray())
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 12)
        @Expect(bis.position, 0)

        var arr = Array<Byte>(10, repeat: 0)
        var index = bis.read(arr)
        @Expect(index, 10)
        @Expect(String.fromUtf8(arr[0..index]), "hello,worl")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)

        index = bis.read(arr)
        @Expect(index, 2)
        @Expect(String.fromUtf8(arr[0..index]), "d!")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)

        bis.seek(Begin(6))
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 6)
        @Expect(bis.position, 6)

        index = bis.read(arr)
        @Expect(index, 6)
        @Expect(String.fromUtf8(arr[0..index]), "world!")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)
    }

    @TestCase
    func seekTest_reusebuffer(): Unit {
        let buffer = Array<Byte>(32, repeat: 0)
        let bs = ByteBuffer()
        let bis = BufferedInputStream<ByteBuffer>(bs, buffer)
        @Expect(bis.length, 0)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 0)

        bs.write("hello,world!".toArray())
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 12)
        @Expect(bis.position, 0)

        var arr = Array<Byte>(10, repeat: 0)
        var index = bis.read(arr)
        @Expect(index, 10)
        @Expect(String.fromUtf8(arr[0..index]), "hello,worl")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)

        index = bis.read(arr)
        @Expect(index, 2)
        @Expect(String.fromUtf8(arr[0..index]), "d!")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)

        bis.seek(Begin(6))
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 6)
        @Expect(bis.position, 6)

        index = bis.read(arr)
        @Expect(index, 6)
        @Expect(String.fromUtf8(arr[0..index]), "world!")
        @Expect(bis.length, 12)
        @Expect(bis.remainLength, 0)
        @Expect(bis.position, 12)
    }
}
