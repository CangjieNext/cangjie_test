/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.collection.*
import std.math.*

@Test
class StringTest {
    @TestCase
    func stringInterator(): Unit {
        let array = [r'c', r'a', r'n', r'g', r'j', r'i', r'e', r'仓', r'颉']
        let string = String(array)
        let expect: Array<UInt8> = [99, 97, 110, 103, 106, 105, 101, 228, 187, 147, 233, 162, 137]

        let uint8Iter = string.iterator()
        for (i in 0..expect.size) {
            @Expect(uint8Iter.next() == expect[i])
        }

        let runeIter = string.runes()
        for (i in 0..array.size) {
            @Expect(runeIter.next() == array[i])
        }
    }

    @TestCase
    func StringToCollection(): Unit {
        let string = "cangjie仓颉"

        let expectArray: Array<UInt8> = [99, 97, 110, 103, 106, 105, 101, 228, 187, 147, 233, 162, 137]
        var count = 0
        for (i in string.toArray()) {
            @Expect(i == expectArray[count])
            count++
        }
        let expectRuneArray = [r'c', r'a', r'n', r'g', r'j', r'i', r'e', r'仓', r'颉']
        count = 0
        for (i in string.toRuneArray()) {
            @Expect(i == expectRuneArray[count])
            count++
        }
    }

    @TestCase
    func getBytes(): Unit {
        let string = "cangjie仓颉"
        @Expect(string.size == 13)
        @Expect(string.get(-1), None)
        @Expect(string.get(0) == 99)
        @Expect(string.get(6) == 101)
        @Expect(string.get(8) == 187)
        @Expect(string.get(13), None)

        let cloneString = string.clone()
        try {
            cloneString[-1]
            @Expect(false)
        } catch (e: IndexOutOfBoundsException) {
        }

        @Expect(cloneString[0], 99)
        @Expect(cloneString[6], 101)
        @Expect(cloneString[8], 187)

        try {
            cloneString[13]
            @Expect(false)
        } catch (e: IndexOutOfBoundsException) {
        }
    }

    @TestCase
    func formatJudgment(): Unit {
        var string = "cangjie仓颉"
        @Expect(string.isAscii(), false)
        @Expect(string.isAsciiBlank(), false)

        string = "abcde_=-="
        @Expect(string.isAscii(), true)
        @Expect(string.isAsciiBlank(), false)

        let array: Array<UInt8> = [9, 10, 11, 12, 13, 32]
        string = String.fromUtf8(array)
        @Expect(string.isAscii(), true)
        @Expect(string.isAsciiBlank(), true)
    }

    @TestCase
    func indexOfByte(): Unit {
        var string = ""
        @Expect(string.indexOf(b'a'), None)

        // 仓：E4BB93
        // 颉：E9A289
        string = "cangjie仓颉cangjie仓颉"
        @Expect(string.indexOf(b'g'), 3)
        @Expect(string.indexOf(b'g',  -1), 3)
        @Expect(string.indexOf(b'g',  10), 16)

        @Expect(string.indexOf(0xBB), 8)
        @Expect(string.indexOf(0xBB, string.size), None)
        @Expect(string.indexOf(0xBB, string.size - 6), 21)

        @Expect(string.indexOf(b'Z'), None)
        @Expect(string.indexOf(b'Z', 10), None)

        // test long string which size is greater than 32
        var str2 = "o" * 10 + "X" + "o" * 20 + "A" + "B" + "o" * 31
        @Expect(str2.size, 64)
        @Expect(str2.indexOf(b'o'), 0)
        @Expect(str2.indexOf(b'X'), 10)
        @Expect(str2.indexOf(b'A'), 31)
        @Expect(str2.indexOf(b'B'), 32)

        // test long string literal which size is greater than 32
        var str3 = "ooooooooooXooooooooooooooooooooABooooooooooooooooooooooooooooooo"
        @Expect(str3.size, 64)
        @Expect(str3.indexOf(b'o'), 0)
        @Expect(str3.indexOf(b'X'), 10)
        @Expect(str3.indexOf(b'A'), 31)
        @Expect(str3.indexOf(b'B'), 32)
    }

    @TestCase
    func indexOfstr(): Unit {
        var string = ""
        @Expect(string.indexOf("abc"), None)
        @Expect(string.indexOf(""), Option<Int64>.Some(0))

        // 仓：E4BB93
        // 颉：E9A289
        string = "cangjie仓颉cangjie仓颉"
        @Expect(string.indexOf("", -2), Option<Int64>.Some(0))
        @Expect(string.indexOf("", string.size + 2), None)
        @Expect(string.indexOf("", string.size), Option<Int64>.Some(26))
        @Expect(string.indexOf("", string.size - 2), Option<Int64>.Some(24))

        @Expect(string.indexOf("jie"), Option<Int64>.Some(4))
        @Expect(string.indexOf("jie", -1), Option<Int64>.Some(4))

        @Expect(string.indexOf("颉"), Option<Int64>.Some(10))
        @Expect(string.indexOf("颉",  string.size), None)

        @Expect(string.indexOf("jie", 5), Option<Int64>.Some(17))
        @Expect(string.indexOf("颉",  11), 23)

        @Expect(string.indexOf("JIE"), None)
        @Expect(string.indexOf("JIE", 3), None)
    }

    @TestCase
    func lastIndexOfByte(): Unit {
        var string = ""
        @Expect(string.lastIndexOf(b'a'), None)

        // 仓：E4BB93
        // 颉：E9A289
        string = "cangjie仓颉cangjie仓颉"
        @Expect(string.lastIndexOf(b'g'), 16)
        @Expect(string.lastIndexOf(b'g',  17), None)
        @Expect(string.lastIndexOf(b'g',  -1), 16)

        @Expect(string.lastIndexOf(0xBB), 21)
        @Expect(string.lastIndexOf(0xBB, 19), 21)
        @Expect(string.lastIndexOf(0xBB, string.size), None)

        @Expect(string.lastIndexOf(b'Z'), None)
        @Expect(string.lastIndexOf(b'Z', string.size - 10), None)
    }

    @TestCase
    func lastIndexOfstr(): Unit {
        var string = ""
        @Expect(string.lastIndexOf("abc"), None)
        @Expect(string.lastIndexOf(""), Option<Int64>.Some(0))

        // 仓：E4BB93
        // 颉：E9A289
        string = "cangjie仓颉cangjie仓颉"
        @Expect(string.lastIndexOf(""), Option<Int64>.Some(string.size))
        @Expect(string.lastIndexOf("", string.size), Option<Int64>.Some(string.size))
        @Expect(string.lastIndexOf("", string.size + 1), None)

        @Expect(string.lastIndexOf("jie"), Option<Int64>.Some(17))
        @Expect(string.lastIndexOf("jie", -1), Option<Int64>.Some(17))
        @Expect(string.lastIndexOf("jie", 5), Option<Int64>.Some(17))

        @Expect(string.lastIndexOf("颉"), Option<Int64>.Some(23))
        @Expect(string.lastIndexOf("颉",  string.size), None)
        @Expect(string.lastIndexOf("颉",  11), 23)

        @Expect(string.lastIndexOf("JIE"), None)
        @Expect(string.lastIndexOf("JIE", string.size - 10), None)
    }

    @TestCase
    func stringCount(): Unit {
        // string.size < STRING_C_THRESHOLD
        var string = "cangjie仓颉cangjie仓颉"
        @Expect(string.count(""), 19)

        // string.size >= STRING_C_THRESHOLD
        string = "cangjie仓颉cangjie仓颉cangjie仓颉cangjie仓颉"
        @Expect(string.count(""), 37)
        @Expect(string.count("cangjie"), 4)
        @Expect(string.count("仓颉"), 4)
        @Expect(string.count("Cang"), 0)

        string = ""
        @Expect(string.count(""), 1)
        @Expect(string.count("cangjie"), 0)
    }

    @TestCase
    func stringSplit(): Unit {
        var string = "aaa aaa aaa"
        var array = string.split("aaa", removeEmpty: true)
        var expectArray: Array<String> = [" ", " "]
        @Expect(array, expectArray)

        array = string.split("aaa", removeEmpty: false)
        expectArray = ["", " ", " ", ""]
        @Expect(array, expectArray)

        array = string.split("bbb", removeEmpty: true)
        @Expect(array.size, 1)
        @Expect(array[0], string)

        string = ""
        array = string.split("", removeEmpty: true)
        @Expect(array.size, 0)

        string = ""
        array = string.split("a", removeEmpty: false)
        @Expect(array.size, 0)
    }

    @TestCase
    func stringSplitWithMaxSplits_1(): Unit {
        var string = "abc abc abc"
        var array = string.split("abc", 0, removeEmpty: true)
        @Expect(array.size, 0)

        array = string.split("abc", 0, removeEmpty: false)
        @Expect(array.size, 0)

        array = string.split("abc", 1, removeEmpty: true)
        @Expect(array.size, 1)
        @Expect(array[0], string)

        array = string.split("abc", 1, removeEmpty: false)
        @Expect(array.size, 1)
        @Expect(array[0], string)

        array = string.split("abc", -1, removeEmpty: true)
        var expectArray: Array<String> = [" ", " "]
        @Expect(array, expectArray)

        array = string.split("abc", -1, removeEmpty: false)
        expectArray = ["", " ", " ", ""]
        @Expect(array, expectArray)

        // maxSplit 大于完整分割出来的子字符串数量
        array = string.split("abc", 4, removeEmpty: true)
        expectArray = [" ", " "]
        @Expect(array, expectArray)

        array = string.split("abc", 4, removeEmpty: false)
        expectArray = ["", " ", " ", ""]
        @Expect(array, expectArray)
    }

    @TestCase
    func stringSplitWithMaxSplits_2(): Unit {
        var string = "abc abc abc"
        var array = string.split("aaa", 2, removeEmpty: true)
        @Expect(array.size, 1)
        @Expect(array[0], string)

        array = string.split("aaa", 2, removeEmpty: false)
        @Expect(array.size, 1)
        @Expect(array[0], string)

        var expectArray: Array<String> = ["a", "bc abc abc"]
        array = string.split("", 2, removeEmpty: true)
        @Expect(array, expectArray)

        array = string.split("", 2, removeEmpty: false)
        @Expect(array, expectArray)
    }

    @TestCase
    func stringSplitWithMaxSplits_3(): Unit {
        var string = "abc abc abc abc"

        var array = string.split("abc", 2, removeEmpty: true)
        var expectArray: Array<String> = [" ", " abc abc"]
        @Expect(array, expectArray)

        array = string.split("abc", 2, removeEmpty: false)
        expectArray = ["", " abc abc abc"]
        @Expect(array, expectArray)
    }

    @TestCase
    func stringLazySplit(): Unit {
        var string = "abcabcabc"
        var iter = string.lazySplit("abc", removeEmpty: true)
        @Expect(iter.next(), None)

        iter = string.lazySplit("abc", removeEmpty: false)
        var expectArray: Array<String> = ["", "", "", ""]
        var array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        iter = string.lazySplit("bc", removeEmpty: false)
        expectArray = ["a", "a", "a", ""]
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        string = ""
        iter = string.lazySplit("abc", removeEmpty: false)
        @Expect(iter.next(), None)
    }

    @TestCase
    func stringLazySplitWithMaxSplits_1(): Unit {
        var string = "abc abc abc"
        var iter = string.lazySplit("abc", 0, removeEmpty: true)
        @Expect(iter.next(), None)

        iter = string.lazySplit("abc", 0, removeEmpty: false)
        @Expect(iter.next(), None)

        iter = string.lazySplit("abc", 1, removeEmpty: true)
        @Expect(iter.next(), string)
        @Expect(iter.next(), None)

        iter = string.lazySplit("abc", 1, removeEmpty: false)
        @Expect(iter.next(), string)
        @Expect(iter.next(), None)

        iter = string.lazySplit("abc", -1, removeEmpty: true)
        var expectArray: Array<String> = [" ", " "]
        var array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        iter = string.lazySplit("abc", -1, removeEmpty: false)
        expectArray = ["", " ", " ", ""]
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        // maxSplit 大于完整分割出来的子字符串数量
        iter = string.lazySplit("abc", 4, removeEmpty: true)
        expectArray = [" ", " "]
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        iter = string.lazySplit("abc", 4, removeEmpty: false)
        expectArray = ["", " ", " ", ""]
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)
    }

    @TestCase
    func stringLazySplitWithMaxSplits_2(): Unit {
        var string = "abc abc abc"
        var iter = string.lazySplit("aaa", 2, removeEmpty: true)
        @Expect(iter.next(), string)
        @Expect(iter.next(), None)

        iter = string.lazySplit("aaa", 2, removeEmpty: false)
        @Expect(iter.next(), string)
        @Expect(iter.next(), None)

        var expectArray: Array<String> = ["a", "bc abc abc"]
        iter = string.lazySplit("", 2, removeEmpty: true)
        var array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        iter = string.lazySplit("", 2, removeEmpty: false)
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)
    }

    @TestCase
    func stringLazySplitWithMaxSplits_3(): Unit {
        var string = "abc abc abc abc"

        var iter = string.lazySplit("abc", 2, removeEmpty: true)
        var expectArray: Array<String> = [" ", " abc abc"]
        var array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)

        iter = string.lazySplit("abc", 2, removeEmpty: false)
        expectArray = ["", " abc abc abc"]
        array = interatorToArray(iter, expectArray.size)
        @Expect(array, expectArray)
    }

    @TestCase
    func formatSwitch(): Unit {
        var string = "cangJie仓颉CangJie仓颉"
        @Expect(string.toAsciiLower(), "cangjie仓颉cangjie仓颉")
        @Expect(string.toAsciiUpper(), "CANGJIE仓颉CANGJIE仓颉")
        @Expect(string.toAsciiTitle(), "Cangjie仓颉Cangjie仓颉")
    }

    @TestCase
    func stringTrimAscii(): Unit {
        var string = "   a  qwe  b   "
        @Expect(string.trimAscii(), "a  qwe  b")
        @Expect(string.trimAsciiStart(), "a  qwe  b   ")
        @Expect(string.trimAsciiEnd(), "   a  qwe  b")

        string = "#  qwe  仓颉"
        @Expect(string.trimAscii(), "#  qwe  仓颉")
        @Expect(string.trimAsciiStart(), "#  qwe  仓颉")
        @Expect(string.trimAsciiEnd(), "#  qwe  仓颉")

        string = ""
        @Expect(string.trimAscii(), "")
        @Expect(string.trimAsciiStart(), "")
        @Expect(string.trimAsciiEnd(), "")
    }

    @TestCase
    func stringTrim(): Unit {
        var string = "cangJie仓颉CangJie仓颉"
        @Expect(string.removePrefix(""), string)
        @Expect(string.removeSuffix(""), string)

        @Expect(string.removePrefix("cangJie仓颉CangJie仓颉cangjie"), string)
        @Expect(string.removeSuffix("cangJie仓颉CangJie仓颉cangjie"), string)

        @Expect(string.removePrefix("cangjie"), string)
        @Expect(string.removeSuffix("颉仓"), string)

        // refix.size < STRING_C_THRESHOLD
        @Expect(string.removePrefix("cangJie"), "仓颉CangJie仓颉")
        // suffix.size < STRING_C_THRESHOLD
        @Expect(string.removeSuffix("仓颉"), "cangJie仓颉CangJie")

        string = "CangJie仓颉cangjie仓颉cangJie仓颉cangjie仓颉"
        // refix.size > STRING_C_THRESHOLD
        @Expect(string.removePrefix("CangJie仓颉cangjie仓颉cangJie仓颉"), "cangjie仓颉")
        // suffix.size > STRING_C_THRESHOLD
        @Expect(string.removeSuffix("cangjie仓颉cangJie仓颉cangjie仓颉"), "CangJie仓颉")
    }

    @TestCase
    func stringContain(): Unit {
        let string = "cangJie仓颉"
        @Expect(string.contains(""), true)
        @Expect(string.contains("jie"), false)
        @Expect(string.contains("Jie仓"), true)
    }

    @TestCase
    func stringPad(): Unit {
        let string = "CangJie仓颉"
        try {
            string.padStart(-1, padding: "abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "negative totalWidth")
        }
        @Expect(string.padStart(string.size -1, padding:"abc"), string)
        @Expect(string.padStart(string.size + 1, padding:"abc"), "abcCangJie仓颉")
        @Expect(string.padStart(string.size + 2, padding:"abc"), "abcCangJie仓颉")
        @Expect(string.padStart(string.size + 5, padding:"abc"), "abcabcCangJie仓颉")
        @Expect(string.padEnd(string.size -1, padding:"abc"), string)
        try {
            string.padEnd(-1, padding: "abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "negative totalWidth")
        }
        @Expect(string.padEnd(string.size + 1, padding:"abc"), "CangJie仓颉abc")
        @Expect(string.padEnd(string.size + 2, padding:"abc"), "CangJie仓颉abc")
        @Expect(string.padEnd(string.size + 5, padding:"abc"), "CangJie仓颉abcabc")
    }

    @TestCase
    func stringCompare(): Unit {
        var array: Array<UInt8> = [0XE4, 0XB8, 0XAD, 0XE5]
        var string: String
        unsafe {
            string = String.fromUtf8Unchecked(array)
        }

        try {
            string.compare("abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence")
        }

        string = "abcdefg"
        @Expect(string.compare("abcdefg"), EQ)
        @Expect(string == "abcdefg")

        @Expect(string.compare("abcdefgh"), LT)
        @Expect(string < "abcdefgh")

        @Expect(string.compare("abcxyt"), LT)
        @Expect(string < "abcxyt")
        @Expect(string <= "abcxyt")
        @Expect(string != "abcxyt")

        @Expect(string.compare("abcdef"), GT)
        @Expect(string > "abcdef")

        @Expect(string.compare("abcabc"), GT)
        @Expect(string > "abcabc")
        @Expect(string >= "abcabc")
        @Expect(string != "abcabc")
    }

    @TestCase
    func stringCombine(): Unit {
        @Expect("cangjie" + "仓颉", "cangjie仓颉")
        @Expect("" + "", "")
        @Expect("" + "仓颉", "仓颉")
        @Expect("cangjie" + "", "cangjie")
    }

    @TestCase
    func stringRepeat(): Unit {
        let string = "CangJie仓颉"
        try {
            string * (-6)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Negative count.")
        }

        @Expect(string * 0, "")
        @Expect("" * 0, "")

        @Expect(string * 3, string + string + string)
    }

    @TestCase
    func checkRangeforstringSlice(): Unit {
        let string = "cangjie仓颉"

        try {
            string[0..9 : 3]
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "the value of the step should be '1'")
        }

        try {
            string[..8]
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }

        try {
            string[9..]
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }

        try {
            string[-1..4]
            @Expect(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "Invalid range start: -1 or end: 4")
        }

        try {
            string[2..14]
            @Expect(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "Invalid range start: 2 or end: 14")
        }

        try {
            string[6..1]
            @Expect(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "Invalid range start: 6 or end: 1")
        }

        try {
            string[Int64.Max..Int64.Max + 10]
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "add")
        }
    }

    @TestCase
    func stringSlice(): Unit {
        let string = "cangjie仓颉"
        @Expect(string[0..7], "cangjie")
        @Expect(string[..7], "cangjie")
        @Expect(string[0..10], "cangjie仓")
        @Expect(string[5..5], "")
        @Expect(string[7..], "仓颉")
    }

    @TestCase
    func stringJoin(): Unit {
        var strArray = Array<String>()
        @Expect(String.join(strArray, delimiter:"-"), "")

        strArray = [""]
        @Expect(String.join(strArray, delimiter:"-"), "")

        strArray = ["", ""]
        @Expect(String.join(strArray, delimiter:"-"), "-")

        strArray = ["cangjie", "仓颉", "cangjie"]
        @Expect(String.join(strArray, delimiter:""), "cangjie仓颉cangjie")

        strArray = ["cangjie", "仓颉", "cangjie"]
        @Expect(String.join(strArray, delimiter:"！@"), "cangjie！@仓颉！@cangjie")
    }

    @TestCase
    func stringReplace(): Unit {
        var string = ""
        @Expect(string.replace("", "cangjie"), "cangjie")
        @Expect(string.replace("a", "cangjie"), "")

        string = "cangjie仓颉cangjie仓颉"
        @Expect(string.replace("", ""), "cangjie仓颉cangjie仓颉")
        @Expect(string.replace("", "a"), "acaaanagajaiaea仓a颉acaaanagajaiaea仓a颉a")
        @Expect(string.replace("jie仓颉", "Jie"), "cangJiecangJie")
        @Expect(string.replace("Cangjie", "cangjie"), "cangjie仓颉cangjie仓颉")
    }

    @TestCase
    func stringRawData(): Unit {
        var string = "仓颉jiecang"
        var rawBytes = Array<Byte>()
        unsafe {
            rawBytes = string.rawData()
        }
        // 仓：E4BB93
        // 颉：E9A289
        @Expect(rawBytes, [0XE4u8,0XBBu8,0X93u8,0XE9u8,0XA2u8,0X89u8,0X6Au8,0X69u8,0X65u8,0X63u8,0X61u8,0X6Eu8,0X67u8])

        string = "iℏψ▽"
        unsafe {
            rawBytes = string.rawData()
        }
        // i: 69
        // ℏ: E2848F
        // ψ: CF88
        // ▽: E296BD
        @Expect(rawBytes, [0x69u8,0XE2u8,0X84u8,0X8Fu8,0XCFu8,0X88u8,0XE2u8,0X96u8,0XBDu8])
        @Expect(string, String.fromUtf8(rawBytes))
    }

    @TestCase
    func stringFromUtf8(): Unit {
        var array: Array<UInt8> = [0XE4, 0XBB, 0X93, 0XE9, 0XA2, 0X89, 0X6A, 0X69, 0X65, 0X63, 0X61, 0X6E, 0X67]
        var string = String.fromUtf8(array)
        @Expect(string, "仓颉jiecang")

        array = [0x69, 0XE2, 0X84, 0X8F, 0XCF, 0X88, 0XE2, 0X96, 0XBD]
        string = String.fromUtf8(array)
        @Expect(string, "iℏψ▽")

        try {
            String.fromUtf8([147u8, 147u8, 136u8])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }

        try {
            String.fromUtf8([0b11110100u8, 0b10111111u8, 0b10111111u8, 0b10111110u8])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid unicode scalar value.")
        }
    }

    @TestCase
    func stringfromUtf8Unchecked(): Unit {
        let string: String
        unsafe {
            string = String.fromUtf8Unchecked([0XE4u8, 0XB8u8, 0XADu8, 0XE5u8])
        }

        try {
            for (rune in string.runes()) {
                println(rune)
            }
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }
    }

    @TestCase
    func toString(): Unit {
        var cstring = unsafe { LibC.mallocCString("") }
        var string = cstring.toString()
        unsafe {
            LibC.free(cstring)
        }
        @Expect(string, "")

        cstring = unsafe { LibC.mallocCString("cang颉") }
        string = cstring.toString()
        unsafe {
            LibC.free(cstring)
        }
        @Expect(string, "cang颉")

        var a: Int64 = 1
        @Expect(a.toString(), "1")

        var b: Int32 = 2
        @Expect(b.toString(), "2")

        var c: Int16 = 3
        @Expect(c.toString(), "3")

        var d: Int8 = 4
        @Expect(d.toString(), "4")

        var e: UInt64 = 5
        @Expect(e.toString(), "5")

        var f: UInt32 = 6
        @Expect(f.toString(), "6")

        var g: UInt16 = 7
        @Expect(g.toString(), "7")

        var h: UInt8 = 8
        @Expect(h.toString(), "8")

        var i: Float64 = 9.0
        @Expect(i.toString(), "9.000000")

        var j: Float32 = 10.0
        @Expect(j.toString(), "10.000000")

        var k: Float16 = 11.0
        @Expect(k.toString(), "11.000000")

        var l: Rune = r'h'
        @Expect(l.toString(), "h")

        var m: Bool = true
        @Expect(m.toString(), "true")

        var n: Bool = false
        @Expect(n.toString(), "false")

        var o: String = "Mary"
        @Expect(o.toString(), "Mary")

        var p: Unit = ()
        @Expect(p.toString(), "()")
    }

    @TestCase
    func testlines() {
        var a = "hell\nowor\rld\r\n!\n"
        var linesIter = a.lines()
        @Expect(linesIter.next(), Some("hell"))
        @Expect(linesIter.next(), Some("owor"))
        @Expect(linesIter.next(), Some("ld"))
        @Expect(linesIter.next(), Some("!"))
        @Expect(linesIter.next(), None)

        a = "hell\towor\\ld"
        linesIter = a.lines()
        for (i in linesIter) {
            print(i)
        }
        @Expect(linesIter.next(), None)
    }

    @TestCase
    func test_trimStart_byString(): Unit {
        var str = "12121131"
        var res = str.trimStart("12")
        @Expect(res, "31")

        str = "你好好仓颉"
        res = str.trimStart("你好")
        @Expect(res, "仓颉")

        str = ""
        res = str.trimStart("12")
        @Expect(res, "")

        str = "12121131"
        res = str.trimStart("")
        @Expect(res, "12121131")
    }

    @TestCase
    func test_trimEnd_ByString(): Unit {
        var str = "3122323"
        var res = str.trimEnd("23")
        @Expect(res, "31")

        str = "好仓颉你你好"
        res = str.trimEnd("你好")
        @Expect(res, "好仓颉")

        str = ""
        res = str.trimEnd("12")
        @Expect(res, "")

        str = "12121131"
        res = str.trimEnd("")
        @Expect(res, "12121131")
    }

    @TestCase
    func test_trimStart_byArray(): Unit {
        var str = "12121131"
        var res = str.trimStart([r'1', r'2'])
        @Expect(res, "31")

        str = "你好好仓颉"
        res = str.trimStart([r'你', r'好'])
        @Expect(res, "仓颉")

        str = ""
        res = str.trimStart([r'1', r'2'])
        @Expect(res, "")

        str = "12121131"
        res = str.trimStart(Array<Rune>())
        @Expect(res, "12121131")
    }

    @TestCase
    func test_trimEnd_ByArray(): Unit {
        var str = "3122323"
        var res = str.trimEnd([r'2', r'3'])
        @Expect(res, "31")

        str = "好仓颉你你好"
        res = str.trimEnd([r'你', r'好'])
        @Expect(res, "好仓颉")

        str = ""
        res = str.trimEnd([r'1', r'2'])
        @Expect(res, "")

        str = "12121131"
        res = str.trimEnd(Array<Rune>())
        @Expect(res, "12121131")
    }

    @TestCase
    func test_trimStart_byPredicate(): Unit {
        func predicate(x: Rune): Bool {
            (UInt32(x) - UInt32(r'0')) % 2 == 0
        }
        var str = "022344"
        var res = str.trimStart(predicate)
        @Expect(res, "344")
    }

    @TestCase
    func test_trimEnd_byPredicate(): Unit {
        func predicate(x: Rune): Bool {
            (UInt32(x) - UInt32(r'0')) % 2 == 0
        }
        var str = "022344"
        var res = str.trimEnd(predicate)
        @Expect(res, "0223")
    }

    @TestCase
    func test_equalsIgnoreAsciiCase(): Unit {
        let str1 = "aBcdE"
        let str2 = "AbCde"
        let str3 = "AbCd"
        let str4 = "AbCdef"
        let str5 = "Babcdef"
        let str6 = ""
        let str7 = "abcdf"

        @Expect(str1.equalsIgnoreAsciiCase(str2), true)
        @Expect(str2.equalsIgnoreAsciiCase(str3), false)
        @Expect(str1.equalsIgnoreAsciiCase(str4), false)
        @Expect(str1.equalsIgnoreAsciiCase(str5), false)
        @Expect(str1.equalsIgnoreAsciiCase(str6), false)
        @Expect(str1.equalsIgnoreAsciiCase(str7), false)

        let str8 = "ab\t"
        let str9 = "ab\n"
        @Expect(str8.equalsIgnoreAsciiCase(str9), false)
    }

    @TestCase
    func test_trim_equalsIgnoreAsciiCase(): Unit {
        let str1 = "@@abc"
        let str2 = "abc$$"
        let trim1 = str1.trimStart(r'@')
        let trim2 = str2.trimEnd(r'$')
        @Expect(trim1.equalsIgnoreAsciiCase(trim2))
    }

    @TestCase
    func test_checkUtf8Encoding() {
        var array: Array<Byte> = [0XE4, 0XB8, 0XAD, 0XE5]
        @Expect(String.checkUtf8Encoding(array), false)
 
        array = "cangjie仓颉".toArray()
        @Expect(String.checkUtf8Encoding(array[..8]), false)
    }

    @TestCase
    func testUnsafeCreate() {
        var array = "0123456789abcde".toArray()
        @Expect(unsafe { String.withRawData(array) }, "0123456789abcde")
        array = [0XE4, 0XB8, 0XAD, 0XE5]
        let string = unsafe { String.fromUtf8Unchecked(array) }
 
        try {
            string.compare("abc")
        } catch(e:IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence")
        }
        ()
    }
}

func interatorToArray(iterator: Iterator<String>, size: Int64): Array<String> {
    var array = Array<String>(size, repeat: "")
    var i = 0
    for (str in iterator) {
        array[i] = str
        i++
    }
    return array
}
