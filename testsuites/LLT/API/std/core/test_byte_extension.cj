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
 * Test description: Test byte_extension
 * Test API in extend Byte <: ByteExtension
 */

import std.collection.*

const DIGIT_DIFF: UInt8 = 0x30
const HEX_UPPER_DIFF: UInt8 = 0x41 - 0x0A
const HEX_LOWER_DIFF: UInt8 = 0x61 - 0x0A

@Test
class ByteExtensionTest {
    @TestCase
    func extensionFunctionTest(): Unit {
        let string = "abcd ABCD\tℏ123▽"
        let asciiBytes = ArrayList<Byte>()
        let asciiLetters = ArrayList<Byte>()
        let lowerLetters = ArrayList<Byte>()
        let upperLetters = ArrayList<Byte>()
        let numbers = ArrayList<Byte>()
        let whiteSpaces = ArrayList<Byte>()
        let toUpper = Array<Byte>(string.size, repeat: 0)
        let toLower = Array<Byte>(string.size, repeat: 0)
        for (b in string) {
            if (b.isAscii()) {
                asciiBytes.add(b)
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
        for (i in 0..string.size) {
            toUpper[i] = string[i].toAsciiUpperCase()
            toLower[i] = string[i].toAsciiLowerCase()
        }
        @Expect(String.fromUtf8(asciiBytes.toArray()), "abcd ABCD\t123")
        @Expect(String.fromUtf8(asciiLetters.toArray()), "abcdABCD")
        @Expect(String.fromUtf8(lowerLetters.toArray()), "abcd")
        @Expect(String.fromUtf8(upperLetters.toArray()), "ABCD")
        @Expect(String.fromUtf8(numbers.toArray()), "123")
        @Expect(String.fromUtf8(whiteSpaces.toArray()), " \t")
        @Expect(String.fromUtf8(toUpper.toArray()), "ABCD ABCD\tℏ123▽")
        @Expect(String.fromUtf8(toLower.toArray()), "abcd abcd\tℏ123▽")
    }

    @TestCase
    func extensionFunctionTest2(): Unit {
        let s = "09fg,\r\n"
        let asciiHex = ArrayList<Byte>()
        let asciiOct = ArrayList<Byte>()
        let asciiPunctuation = ArrayList<Byte>()
        let asciiGraphic = ArrayList<Byte>()
        let asciiControl = ArrayList<Byte>()
        let asciiNumberOrLetter = ArrayList<Byte>()
        for (b in s) {
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
        @Expect(String.fromUtf8(asciiHex.toArray()), "09f")
        @Expect(String.fromUtf8(asciiOct.toArray()), "0")
        @Expect(String.fromUtf8(asciiPunctuation.toArray()), ",")
        @Expect(String.fromUtf8(asciiGraphic.toArray()), "09fg,")
        @Expect(String.fromUtf8(asciiControl.toArray()), "\r\n")
        @Expect(String.fromUtf8(asciiNumberOrLetter.toArray()), "09fg")
    }

    @TestCase
    func extensionHexStringTest(): Unit {
        let number = fromHexString("fFF1")
        @Expect(number, 65521) // 65521
        let maxInt64 = fromHexString("7fFfFfffffFFFFff")
        @Expect(maxInt64, 9223372036854775807)
        try {
            fromHexString("8000000000000000")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The hex number is too big!") // The hex number is too big!
        }
        try {
            fromHexString("sfFF1")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid hex string!") // Invalid hex string!
        }
    }
}

func fromHexString(hexString: String): Int64 {
    // check the size of the string to prevent overflow
    if (hexString.size > 16 || (hexString.size == 16 && !hexString[0].isAsciiOct())) {
        throw IllegalArgumentException("The hex number is too big!")
    }
    var result = 0
    for (byte in hexString) {
        if (!byte.isAsciiHex()) {
            throw IllegalArgumentException("Invalid hex string!")
        }
        result = result << 4
        if (byte.isAsciiNumber()) {
            result = result | Int64(byte - DIGIT_DIFF)
        }
        if (byte.isAsciiLowerCase()) {
            result = result | Int64(byte - HEX_LOWER_DIFF)
        }
        if (byte.isAsciiUpperCase()) {
            result = result | Int64(byte - HEX_UPPER_DIFF)
        }
    }
    return result
}
