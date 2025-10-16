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
public class writeByteTest {
    @TestCase
    func writeByteTest(): Unit {
        let bs = ByteBuffer()
        let bos = BufferedOutputStream<ByteBuffer>(bs)
        bos.writeByte(b'a')
        bos.writeByte(b'b')

        bos.flush()
        var arr = readToEnd(bs)
        @Expect(String.fromUtf8(arr), "ab")
    }

    @TestCase
    func writeByteLenTest(): Unit {
        let bs = ByteBuffer()
        let bs2 = Array<Byte>(1, repeat: 0)
        println(bs2.size)
        let bos = BufferedOutputStream<ByteBuffer>(bs, bs2)
        bos.writeByte(b'a')
        bos.writeByte(b'b')
        bos.flush()
        var arr = readToEnd(bs)
        @Expect(String.fromUtf8(arr), "ab")
    }
}
