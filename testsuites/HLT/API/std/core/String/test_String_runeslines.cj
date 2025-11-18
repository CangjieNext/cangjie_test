/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*
import std.collection.*

@Test
class Test_String_runeslines {
    @TestCase
    func Stringrunes_case01(): Unit {
        let a = "你好，仓颉！"
        let arrayList = ArrayList<Rune>([r'你', r'好', r'，', r'仓', r'颉', r'！'])
        let runeIter = a.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func Stringrunes_case02(): Unit {
        let a = ""
        try {
            let runeIter = a.runes()
            @Expect(true)
        } catch (e: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    func Stringrunes_case03(): Unit {
        let a = " "
        let arrayList = ArrayList<Rune>([r' '])
        let runeIter = a.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func Stringrunes_case04(): Unit {
        let a = "hell\nowor\rld\r\n"
        let arrayList = ArrayList<Rune>([r'h', r'e', r'l', r'l', r'\n', r'o', r'w', r'o', r'r', r'\r', r'l', r'd', r'\r',
            r'\n'])
        let runeIter = a.runes()
        for (i in 0..arrayList.size) {
            @Expect(runeIter.next(), arrayList[i])
        }
    }

    @TestCase
    func Stringrunes_case05(): Unit {
        let string: String
        unsafe {
            string = String.fromUtf8Unchecked([0XB8u8, 0XADu8, 0XE5u8])
        }
        try {
            for (rune in string.runes()) {
                @Expect(false)
            }
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid utf8 byte sequence"))
        }
    }

    @TestCase
    func Stringlines_case06(): Unit {
        let a = "hell\nowor\rld\r\n!\n"
        let linesIter = a.lines()
        @Expect(linesIter.next(), Some("hell"))
        @Expect(linesIter.next(), Some("owor"))
        @Expect(linesIter.next(), Some("ld"))
        @Expect(linesIter.next(), Some("!"))
    }

    @TestCase
    func Stringlines_case07(): Unit {
        let a = "hell\towor\\ld"
        let linesIter = a.lines()
        @Expect(linesIter.next(), Some("hell\towor\\ld"))
    }

    @TestCase
    func Stringlines_case08(): Unit {
        let string: String
        unsafe {
            string = String.fromUtf8Unchecked([0XB8u8, 0XADu8, 0XE5u8])
        }
        try {
            for (line in string.lines()) {
                @Expect(true)
            }
        } catch (e: IllegalArgumentException) {
            @Expect(false)
        }
    }
}
