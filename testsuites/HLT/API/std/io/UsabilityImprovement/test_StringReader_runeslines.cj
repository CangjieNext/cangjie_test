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
import std.collection.*

@Test
class Test_StringReader_runeslines {
    @TestCase
    func StringReaderrunes_case01(): Unit {
        let a = "你好，仓颉！".toArray()
        let stream = ByteBuffer()
        stream.write(a)
        let reader = StringReader(stream)
        let arrayList = ArrayList<Rune>([r'你', r'好', r'，', r'仓', r'颉', r'！'])
        let runeIter = reader.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func StringReaderrunes_case02(): Unit {
        let a = " ".toArray()
        let stream = ByteBuffer()
        stream.write(a)
        let reader = StringReader(stream)
        let arrayList = ArrayList<Rune>([r' '])
        let runeIter = reader.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func StringReaderrunes_case03(): Unit {
        let a = "hell\nowor\rld\r\n".toArray()
        let stream = ByteBuffer()
        stream.write(a)
        let reader = StringReader(stream)
        let arrayList = ArrayList<Rune>([r'h', r'e', r'l', r'l', r'\n', r'o', r'w', r'o', r'r', r'\r', r'l', r'd', r'\r',
            r'\n'])
        let runeIter = reader.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func StringReaderrunes_case04(): Unit {
        let illegal_utf8: Array<Byte> = [0xa2, 0xe2, 0x28]
        let stream = ByteBuffer()
        stream.write(illegal_utf8)
        let reader = StringReader(stream)
        try {
            for (rune in reader.runes()) {
                @Expect(false)
            }
        } catch (e: ContentFormatException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }
    }

    @TestCase
    func StringReaderlines_case05(): Unit {
        let a = "hell\nowor\rld\r\n!\n".toArray()
        let stream = ByteBuffer()
        stream.write(a)
        let reader = StringReader(stream)
        let linesIter = reader.lines()
        @Expect(linesIter.next(), Some("hell"))
        @Expect(linesIter.next(), Some("owor"))
        @Expect(linesIter.next(), Some("ld"))
        @Expect(linesIter.next(), Some("!"))
    }

    @TestCase
    func StringReaderlines_case06(): Unit {
        let a = "hell\towor\\ld".toArray()
        let stream = ByteBuffer()
        stream.write(a)
        let reader = StringReader(stream)
        let linesIter = reader.lines()
        @Expect(linesIter.next(), Some("hell\towor\\ld"))
    }

    @TestCase
    func Stringlines_case07(): Unit {
        let illegal_utf8: Array<Byte> = [0xa2, 0xe2, 0x28]
        let stream = ByteBuffer()
        stream.write(illegal_utf8)
        let reader = StringReader(stream)
        try {
            for (line in reader.lines()) {
                @Expect(false)
            }
        } catch (e: ContentFormatException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }
    }
}
