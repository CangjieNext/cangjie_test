/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 

/*
 * Test description: Test Rune_extension
 * Test API in extend Rune <: RuneExtension
 */

import std.collection.*

@Test
class RuneExtensionTest {
    @TestCase
    func extensionFunctionTest(): Unit {
        let string = "abcd ABCD\tℏ123▽"
        let asciiRunes = ArrayList<Rune>()
        let asciiLetters = ArrayList<Rune>()
        let lowerLetters = ArrayList<Rune>()
        let upperLetters = ArrayList<Rune>()
        let numbers = ArrayList<Rune>()
        let whiteSpaces = ArrayList<Rune>()
        let stringRunes = string.toRuneArray()
        let toUpper = Array<Rune>(stringRunes.size, repeat: r'0')
        let toLower = Array<Rune>(stringRunes.size, repeat: r'0')
        for (b in stringRunes) {
            if (b.isAscii()) {
                asciiRunes.add(b)
            }
            if (b.isAsciiLetter()) {
                asciiLetters.add(b)
            }
            if (b.isAsciiLowerCase()) {
                lowerLetters.add(b)
            }
            if (b.isAsciiUpperCase()) {
                upperLetters.add(b)
            }
            if (b.isAsciiNumber()) {
                numbers.add(b)
            }
            if (b.isAsciiWhiteSpace()) {
                whiteSpaces.add(b)
            }
        }
        for (i in 0..stringRunes.size) {
            toUpper[i] = stringRunes[i].toAsciiUpperCase()
            toLower[i] = stringRunes[i].toAsciiLowerCase()
        }
        @Expect(String(asciiRunes), "abcd ABCD\t123")
        @Expect(String(asciiLetters), "abcdABCD")
        @Expect(String(lowerLetters), "abcd")
        @Expect(String(upperLetters), "ABCD")
        @Expect(String(numbers), "123")
        @Expect(String(whiteSpaces), " \t")
        @Expect(String(toUpper), "ABCD ABCD\tℏ123▽")
        @Expect(String(toLower), "abcd abcd\tℏ123▽")
    }

    @TestCase
    func extensionFunctionTest2(): Unit {
        let s = "09fg,\r\n"
        let asciiHex = ArrayList<Rune>()
        let asciiOct = ArrayList<Rune>()
        let asciiPunctuation = ArrayList<Rune>()
        let asciiGraphic = ArrayList<Rune>()
        let asciiControl = ArrayList<Rune>()
        let asciiNumberOrLetter = ArrayList<Rune>()
        for (b in s.toRuneArray()) {
            if (b.isAsciiHex()) {
                asciiHex.add(b)
            }
            if (b.isAsciiOct()) {
                asciiOct.add(b)
            }
            if (b.isAsciiPunctuation()) {
                asciiPunctuation.add(b)
            }
            if (b.isAsciiGraphic()) {
                asciiGraphic.add(b)
            }
            if (b.isAsciiControl()) {
                asciiControl.add(b)
            }
            if (b.isAsciiNumberOrLetter()) {
                asciiNumberOrLetter.add(b)
            }
        }
        @Expect(String(asciiHex), "09f")
        @Expect(String(asciiOct), "0")
        @Expect(String(asciiPunctuation), ",")
        @Expect(String(asciiGraphic), "09fg,")
        @Expect(String(asciiControl), "\r\n")
        @Expect(String(asciiNumberOrLetter), "09fg")
    }
}
