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

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*
import std.collection.*

@Test
class TestString {
    @TestCase
    func test_init(): Unit {
        var a0 = String()
        @Assert(a0, "")

        var a1 = String([r'a', r'b', r'c'])
        @Assert(a1, "abc")

        var a4 = String([r'a', r'\u{77}', r'c'])[..2]
        @Assert(a4, "aw")

        var a5 = String([r'a', r'\u{77}', r'c'])[1..2]
        @Assert(a5, "w")

        var a6 = String(ArrayList<Rune>([r'a', r'\u{77}', r'c']))
        @Assert(a6, "awc")

        var a7 = String(HashSet<Rune>([r'a', r'\u{77}', r'c']))
        @Assert(a7, "awc")
    }

    @TestCase
    func test_toUtfArray(): Unit {
        var a0 = String([r'a'])
        var b = "a"
        @Assert(a0.toArray() == b.toArray(), true)

        var a1 = String([r'a', r'b', r'c'])
        @Assert(a1.toArray() == [97,98,99], true)
    }

    @TestCase
    func test_get(): Unit {
        var a0 = "abcd"
        @Assert(a0.get(0) == Some(UInt8(UInt32(r'a'))), true)
        @Assert(a0.get(5) == Option<Byte>.None, true)
        @Assert(a0.get(-1) == Option<Byte>.None, true)

        var a1 = ""
        @Assert(a1.get(0) == Option<Byte>.None, true)

        var a2 = String([r'\t', r'\n', r' '])
        @Assert(a2.get(2) == Some(UInt8(UInt32(r' '))), true)
    }

    @TestCase
    func test_charAt(): Unit {
        var a0 = "abcd"
        @Assert(a0.get(0) == UInt8(UInt32(r'a')), true)
        @Assert(a0.get(5) == None, true)
        @Assert(a0.get(-1) == None, true)

        var a1 = ""
        @Assert(a1.get(0) == None, true)

        var a2 = String([r'\t', r'\n', r' '])
        @Assert(a2.get(2) == UInt8(UInt32(r' ')), true)
    }

    @TestCase
    func test_toRuneArray(): Unit {
        var a0 = "abcd"
        @Assert(a0.toRuneArray() == [r'a', r'b', r'c', r'd'], true)

        var a1 = ""
        @Assert(a1.toRuneArray() == [], true)

        var a2 = " "
        @Assert(a2.toRuneArray() == [r' '], true)

        var a3 = "'"
        @Assert(a3.toRuneArray() == [r'\''], true)

        var a4 = "\u{77}"
        @Assert(a4.toRuneArray() == [r'\u{77}'], true)
    }

    @TestCase
    func test_toString(): Unit {
        var a0 = "abcd"
        @Assert(a0.toString() == "abcd", true)

        var a1 = ""
        @Assert(a1.toString() == "", true)

        var a2 = " "
        @Assert(a2.toString() == " ", true)

        var a3 = "'"
        @Assert(a3.toString() == "'" , true)

        var a4 = "\u{77}"
        @Assert(a4.toString() == "w", true)
    }

    @TestCase
    func test_clone(): Unit {
        var a0 = "abcd"
        @Assert(a0.clone() == a0, true)

        var a1 = ""
        @Assert(a1.clone() == a1, true)

        var a2 = " "
        @Assert(a2.clone() == a2, true)

        var a3 = "'"
        @Assert(a3.clone() == a3 , true)

        var a4 = "\u{77}"
        @Assert(a4.clone() == a4, true)
    }

    @TestCase
    func test_size(): Unit {
        var a0 = "abcd"
        @Assert(a0.size == 4, true)

        var a1 = ""
        @Assert(a1.size == 0, true)

        var a2 = " "
        @Assert(a2.size == 1, true)

        var a3 = "'"
        @Assert(a3.size == 1 , true)

        var a4 = "\u{77}"
        @Assert(a4.size == 1, true)
    }

    @TestCase
    func test_isEmpty(): Unit {
        var a0 = "abcd"
        @Assert(a0.isEmpty(), false)

        var a1 = ""
        @Assert(a1.isEmpty(), true)

        var a2 = " "
        @Assert(a2.isEmpty(), false)

        var a3 = "'"
        @Assert(a3.isEmpty(), false)

        var a4 = "\u{77}"
        @Assert(a4.isEmpty(), false)

        var a5 = String()
        @Assert(a5.isEmpty(), true)
    }

    @TestCase
    func test_isAsciiBlank(): Unit {
        var a0 = String()
        @Assert(a0.isAsciiBlank(), true)

        var a1 = ""
        @Assert(a1.isAsciiBlank(), true)

        var a2 = "\t"
        @Assert(a2.isAsciiBlank(), true)

        var a3 = String([r'\u{09}', r'\n', r'\r'])
        @Assert(a3.isAsciiBlank(), true)
    }

    @TestCase
    func test_hashCode(): Unit {
        var a0 = "test"
        var b0 = "test1"
        @Assert(a0.hashCode() != b0.hashCode(), true)

        var a1 = "\t"
        var b1 = "\n"
        @Assert(a1.hashCode() != b1.hashCode(), true)

        var a2 = "test"
        var b2 = "test"
        @Assert(a2.hashCode() == b2.hashCode(), true)

        var a3 = String()
        var b3 = ""
        @Assert(a3.hashCode() == b3.hashCode(), true)
    }

    @TestCase
    func test_indexOf(): Unit {
        var a0 = "abcadeeffvba"
        @Assert(a0.indexOf(UInt8(UInt32(r'A'))) == None, true)
        @Assert(a0.indexOf(UInt8(UInt32(r'b'))) == Some(1), true)
        @Assert(a0.indexOf(UInt8(UInt32(r'f'))) == Some(7), true)
        @Assert(a0.indexOf(UInt8(UInt32(r'a'))) == Some(0), true)
        @Assert(a0.indexOf(UInt8(UInt32(r'z'))) == None, true)
        @Assert(a0.indexOf(UInt8(UInt32(r'b')), 6) == Some(10), true)
        @Assert(a0.indexOf(UInt8(UInt32(r'z')), 6) == None, true)
        @Assert(a0.indexOf(UInt8(UInt32(r'b')), -1) == Some(1), true)
        @Assert(a0.indexOf(UInt8(UInt32(r'z')), -1) == None, true)

        @Assert(a0.indexOf("A") == None, true)
        @Assert(a0.indexOf("b") == Some(1), true)
        @Assert(a0.indexOf("f") == Some(7), true)
        @Assert(a0.indexOf("a") == Some(0), true)
        @Assert(a0.indexOf("z") == None, true)
        @Assert(a0.indexOf("b", 6) == Some(10), true)
        @Assert(a0.indexOf("z", 6) == None, true)
        @Assert(a0.indexOf("b", -1) == Some(1), true)
        @Assert(a0.indexOf("z", -1) == None, true)

        @Assert(a0.lastIndexOf(UInt8(UInt32(r'A'))) == None, true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'b'))) == Some(10), true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'f'))) == Some(8), true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'a'))) == Some(11), true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'z'))) == None, true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'a')), 6) == Some(11), true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'z')), 6) == None, true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'a')), -1) == Some(11), true)
        @Assert(a0.lastIndexOf(UInt8(UInt32(r'z')), -1) == None, true)

        @Assert(a0.lastIndexOf("A") == None, true)
        @Assert(a0.lastIndexOf("b") == Some(10), true)
        @Assert(a0.lastIndexOf("f") == Some(8), true)
        @Assert(a0.lastIndexOf("a") == Some(11), true)
        @Assert(a0.lastIndexOf("z") == None, true)
        @Assert(a0.lastIndexOf("a", 6) == Some(11), true)
        @Assert(a0.lastIndexOf("z", 6) == None, true)
        @Assert(a0.lastIndexOf("a", -1) == Some(11), true)
        @Assert(a0.lastIndexOf("z", -1) == None, true)

        @Assert(a0.lastIndexOf("ff", -1) == Some(7), true)

        var a1 = "abababababaabababab"
        @Assert(a1.lastIndexOf("ababa", -1) == Some(13), true)
        @Assert(a1.indexOf("ababa", -1) == Some(0), true)
    }

    @TestCase
    func test_concat(): Unit {
        var a0 = "test"
        var b0 = "0"
        var count = 0
        @Assert(a0 + b0, "test0")
        @Assert(a0 + "\n", "test\n")
        @Assert(a0 + b0 + b0 + b0, "test000")
        @Assert(a0 + b0, "test0")
        @Assert(a0*2, a0 + a0)
        @Assert(a0*0, "")
        try {
            @Assert(a0*-1, "testtesttest")
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Assert(a0*0, "")
        @Assert(a0.count("t"), 2)
        @Assert(a0.count("test"), 1)
        @Assert(a0.count(""), 5)
        @Assert("".count(""), 1)
        @Assert(a0.count("z"), 0)
        @Assert(a0 == "test", true)
        @Assert(a0 == "", false)
        @Assert("" == a0, false)
        @Assert("" == "", true)

        var a1 = "测试"
        @Assert(a1*2, "测试测试")
        @Assert((a1*2).count("测"), 2)
        @Assert(a1 + "测", "测试测")
        @Assert((a1 + "测").count("测"), 2)
        @Assert(count, 1)
    }

    @TestCase
    func test_split(): Unit {
    }

    @TestCase
    func test_replace(): Unit {
        @Assert("abc".replace("", "11"), "11a11b11c11")
        @Assert("".replace("", "b"), "b")
        @Assert(" ".replace("", "b"), "b b")
        @Assert("\n".replace("\n", "123"), "123")
    }

    @TestCase
    func test_Ascii(): Unit {
        @Assert("ABC".toAsciiLower(), "abc")
        @Assert("1213".toAsciiLower(), "1213")
        @Assert("12B12".toAsciiLower(), "12b12")
        @Assert("12 B DD A 12".toAsciiLower(), "12 b dd a 12")

        @Assert("abc".toAsciiUpper(), "ABC")
        @Assert("abc123ABC".toAsciiUpper(), "ABC123ABC")

        @Assert("ABC".toAsciiTitle(), "Abc")
        @Assert("this is a test".toAsciiTitle(), "This Is A Test")
        @Assert("this is a\u{31}test".toAsciiTitle(), "This Is A1Test")
        @Assert("this is a\ntest".toAsciiTitle(), "This Is A\nTest")

        @Assert("   ABC   ".trimAscii(), "ABC")
        @Assert("   ABC test  ".trimAscii(), "ABC test")
        @Assert("   ABC test  a\n".trimAscii(), "ABC test  a")
        @Assert("   ABC test  a\n\0".trimAscii(), "ABC test  a\n\0")
        @Assert("\tABC test  a\n".trimAscii(), "ABC test  a")
        @Assert("      ".trimAscii(), "")
        @Assert("   \n \t   ".trimAscii(), "")

        @Assert("  ABC  ".trimAsciiStart(), "ABC  ")
        @Assert("  ABC\t".trimAsciiStart(), "ABC\t")
        @Assert("  \tABC  ".trimAsciiStart(), "ABC  ")
        @Assert("\nABC  ".trimAsciiStart(), "ABC  ")
        @Assert("\0ABC".trimAsciiStart(), "\0ABC")
        @Assert("      ".trimAsciiStart(), "")
        @Assert("   \n \t   ".trimAsciiStart(), "")

        @Assert("   ABC   ".trimAsciiEnd(), "   ABC")
        @Assert("\tABC".trimAsciiEnd(), "\tABC")
        @Assert("\nABC  ".trimAsciiEnd(), "\nABC")
        @Assert("ABC  test".trimAsciiEnd(), "ABC  test")
        @Assert("  ABC \n  ".trimAsciiEnd(), "  ABC")
        @Assert("  \nABC".trimAsciiEnd(), "  \nABC")
        @Assert("\0  \nABC".trimAsciiEnd(), "\0  \nABC")
        @Assert("      ".trimAsciiEnd(), "")
        @Assert("   \n \t   ".trimAsciiEnd(), "")
    }

    @TestCase
    func test_trim(): Unit {
        @Assert("BCBCA".removePrefix("BC"), "BCA")
        @Assert("BCBCA".removePrefix("bc"), "BCBCA")
        @Assert("\tBCBCA".removePrefix("BC"), "\tBCBCA")
        @Assert("BBABB".removePrefix("B"),"BABB")
        @Assert("\nBBABB".removePrefix("\nB"),"BABB")
        @Assert("ABC".removePrefix(""), "ABC")
        @Assert("".removePrefix("a"), "")

        @Assert("ABCBC".removeSuffix("BC"), "ABC")
        @Assert("ABCBC".removeSuffix("CB"), "ABCBC")
        @Assert("BCBCA".removeSuffix("a"), "BCBCA")
        @Assert("BCBCA\t".removeSuffix("A"), "BCBCA\t")
        @Assert("BBABB\n".removeSuffix("B\n"),"BBAB")
        @Assert("BBABB".removeSuffix("B"),"BBAB")
        @Assert("ABC".removeSuffix(""), "ABC")
        @Assert("".removeSuffix("a"), "")
    }

    @TestCase
    func test_contains(): Unit {
        @Assert("123".contains(""), true)
        @Assert("".contains(""), true)
        @Assert("".contains("a"), false)
        @Assert("abc".contains("abcd"), false)
        @Assert("abc\n".contains("ab*\n"), false)
        @Assert("12ab12".contains("ab\u{31}"), true)

        @Assert("".contains(" "), false)
        @Assert("   ".contains("     "), false)
        @Assert("\t".contains(" "), false)
    }

    @TestCase
    func test_startsWith(): Unit {
        @Assert("\nabc".startsWith("\n"), true)
        @Assert("\nabc".startsWith("a"), false)
        @Assert("\tabc".startsWith(""), true)
        @Assert("\tabc".startsWith("t"), false)
        @Assert("".startsWith(""), true)
        @Assert("".startsWith("a"), false)
        @Assert("123".endsWith("\u{31}"), false)
    }

    @TestCase
    func test_endsWith(): Unit {
        @Assert("abc\n".endsWith("\n"), true)
        @Assert("abc\n".endsWith("a"), false)
        @Assert("abc\t".endsWith(""), true)
        @Assert("abc\t".endsWith("t"), false)
        @Assert("".endsWith(""), true)
        @Assert("".endsWith("a"), false)
        @Assert("321".endsWith("\u{31}"), true)
    }

    @TestCase
    func test_pad(): Unit {
        @Assert("".padStart(3, padding: "a"), "aaa")
        @Assert("bbb".padStart(3, padding: "a"), "bbb")
        @Assert("bb".padStart(3, padding: "a"), "abb")
        @Assert("bb".padStart(4, padding:"\n"), "\n\nbb")
        @Assert("bbb".padStart(1, padding:"\n"), "bbb")
        @Assert("bbb".padStart(0, padding:"\n"), "bbb")
        @Assert("bbb".padStart(5, padding:" "), "  bbb")

        @Assert("".padEnd(3, padding: "a"), "aaa")
        @Assert("bbb".padEnd(3, padding: "a"), "bbb")
        @Assert("bb".padEnd(3, padding: "a"), "bba")
        @Assert("bb".padEnd(4, padding:"\n"), "bb\n\n")
        @Assert("bbb".padEnd(1, padding:"\n"), "bbb")
        @Assert("bbb".padEnd(0, padding:"\n"), "bbb")
        @Assert("bbb".padEnd(5, padding:" "), "bbb  ")

        var count = 0
        try {
            println("bbb".padStart(-1, padding: "\n"))
        } catch (e: IllegalArgumentException) {
            count += 1
        }

        try {
            println("bbb".padEnd(-1, padding: "\n"))
        } catch (e: IllegalArgumentException) {
            count += 1
        }
        @Assert(count , 2)
    }

    @TestCase
    func test_compare(): Unit {
        @Assert("".compare("") == Ordering.EQ, true)
        @Assert("abc".compare("") == Ordering.GT, true)
        @Assert("abc".compare("bcd") == Ordering.LT, true)
        @Assert("\u{31}\u{34}".compare("\u{32}\u{33}") == Ordering.LT, true)
        @Assert("..".compare(".") == Ordering.GT, true)
    }

    @TestCase
    func test_ops(): Unit {
        var count = 0

        var a0 = "abcdea"
        var b0 = "abcdea"
        var c0 = "abc"
        @Assert(a0 == b0, true)
        @Assert(a0 == c0, false)
        @Assert(a0 != b0, false)
        @Assert(a0 != c0, true)
        @Assert(a0 > c0, true)
        @Assert(a0 < c0, false)
        @Assert(a0 >= b0, true)
        @Assert(a0 <= c0, false)

        var a1 = "a"
        @Assert(a1 + "a", "aa")
        @Assert(a1 + "aa", "aaa")
        @Assert(a1 + "\n", "a\n")
        @Assert(a1 * 3, "aaa")
        @Assert(a1 * 0, "")
        try {
            @Assert(a1 * -1, "aaa")
        } catch (e: IllegalArgumentException) {
            count += 1
        }

        var a2 = "a{adea"
        @Assert(a2[1..3], "{a")
        @Assert(a2[..3], "a{a")
        @Assert(a2[1..], "{adea")
        @Assert(a2[..], "a{adea")
        try {
            @Assert(a2[..10], "a{adea")
        } catch (e: IndexOutOfBoundsException) {
            count += 1
        }
        @Assert(count, 2)
    }
}
