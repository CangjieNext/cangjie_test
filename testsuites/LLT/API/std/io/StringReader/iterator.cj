/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.io.*

let ascii = "hello world!".toArray()
let utf8 = "你好,仓颉".toArray()
let invalidUtf8: Array<Byte> = [0b11110000, 0b10000000, 0b10000000, 0b10000000]
let multiline = ###"你
好
仓
颉"###

@Test
class Test_StringReader_iterator {
    @TestCase
    func test_runes_iterator(): Unit {
        let stream = ByteBuffer()
        stream.write(ascii)
        let reader = StringReader(stream)
        let it = reader.runes()
        let sb = StringBuilder()
        for (r in it) {
            sb.append(r)
        }
        @Expect(sb.toString(), "hello world!")

        stream.write(utf8)

        for (r in it) {
            sb.append(r)
        }
        @Expect(sb.toString(), "hello world!你好,仓颉")

        stream.write(invalidUtf8)
        try {
            for (r in it) {
                print("${r}")
            }
        } catch (e: ContentFormatException) {
            return
        }
        @Expect(false)
    }

    @TestCase
    func test_strings_iterator(): Unit {
        let stream = ByteBuffer()
        stream.write(ascii)
        let reader = StringReader(stream)
        let it = reader.lines()
        @Expect(it.next(), Some("hello world!"))

        stream.write(utf8)
        @Expect(it.next(), Some("你好,仓颉"))

        stream.write(multiline.toArray())
        @Expect(it.next(), Some("你"))
        @Expect(it.next(), Some("好"))
        @Expect(it.next(), Some("仓"))
        @Expect(it.next(), Some("颉"))
        @Expect(it.next(), None)

        stream.write(invalidUtf8)
        try {
            it.next()
            @Expect(false)
        } catch (e: ContentFormatException) {
            @Expect(true)
        }
    }
}
