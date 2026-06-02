/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

@Test
class TestCString {
    @TestCase
    func test_CString_init(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("test")
            @Assert(a0.toString(), "test")
            LibC.free(a0)

            var a1 = LibC.mallocCString("")
            @Assert(a1.toString(), "")
            LibC.free(a1)

            var a2 = LibC.mallocCString("\n")
            @Assert(a2.toString(), "\n")
            LibC.free(a2)
        }
    }

    @TestCase
    func test_getChars(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("test")
            var b0 = CString(a0.getChars())
            @Assert(a0.equals(b0), true)
            LibC.free(a0)

            var a1 = LibC.mallocCString(".")
            var b1 = CString(a1.getChars())
            @Assert(a1.compare(b1), 0)
            LibC.free(a1)

            var a2 = LibC.mallocCString("\n")
            var b2 = CString(a2.getChars())
            @Assert(a2.equals(b2), true)
            LibC.free(a2)
        }
    }

    @TestCase
    func test_isNull(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("test")
            @Assert(a0.isNull(), false)
            LibC.free(a0)

            var a1 = LibC.mallocCString("")
            @Assert(a1.isNull(), false)
            LibC.free(a1)

            var a2 = LibC.mallocCString(String([r'\0']))
            @Assert(a2.isNull(), false)
            LibC.free(a2)

            var a3 = CPointer<Int64>()
            @Assert(a3.isNull(), true)

            var a4 = CString(CPointer<UInt8>())
            @Assert(a4.isNull(), true)
            LibC.free(a4)
        }
    }

    @TestCase
    func test_size(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("test")
            @Assert(a0.size(), 4)
            LibC.free(a0)

            var a1 = LibC.mallocCString("")
            @Assert(a1.size(), 0)
            LibC.free(a1)

            var a2 = CString(CPointer<UInt8>())
            @Assert(a2.size(), 0)
            LibC.free(a2)

            var a3 = LibC.mallocCString("\t\0\n")
            @Assert(a3.size(), 1)
            LibC.free(a3)

            var a4 = LibC.mallocCString("\t\n\0")
            @Assert(a4.size(), 2)
            LibC.free(a4)

            var a5 = LibC.mallocCString("\u{31}")
            @Assert(a5.size(), 1)
            LibC.free(a5)

            var a6 = LibC.mallocCString("\u{4E25}")
            @Assert(a6.size(), 3)
            LibC.free(a6)

            var a7 = LibC.mallocCString("\0")
            @Assert(a7.size(), 0)
            LibC.free(a7)
        }
    }

    @TestCase
    func test_isEmpty(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("")
            @Assert(a0.isEmpty(), true)
            LibC.free(a0)

            var a1 = LibC.mallocCString("test")
            @Assert(a1.isEmpty(), false)
            LibC.free(a1)

            var a2 = LibC.mallocCString("\n")
            @Assert(a2.isEmpty(), false)
            LibC.free(a2)

            var a3 = LibC.mallocCString("\0")
            @Assert(a3.isEmpty(), true)
            LibC.free(a3)

            var a4 = LibC.mallocCString("\u{31}")
            @Assert(a4.isEmpty(), false)
            LibC.free(a4)
        }
    }

    @TestCase
    func test_isNotEmpty(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("")
            @Assert(a0.isNotEmpty(), false)
            LibC.free(a0)

            var a1 = LibC.mallocCString("test")
            @Assert(a1.isNotEmpty(), true)
            LibC.free(a1)

            var a2 = LibC.mallocCString("\n")
            @Assert(a2.isNotEmpty(), true)
            LibC.free(a2)

            var a3 = LibC.mallocCString("\0")
            @Assert(a3.isNotEmpty(), false)
            LibC.free(a3)

            var a4 = LibC.mallocCString("\u{31}")
            @Assert(a4.isNotEmpty(), true)
            LibC.free(a4)
        }
    }

    @TestCase
    func test_startsWith(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("abcd")
            var b0 = LibC.mallocCString("a")
            @Assert(a0.startsWith(b0), true)
            LibC.free(a0)
            LibC.free(b0)

            var a1 = LibC.mallocCString("abcd")
            var b1 = LibC.mallocCString("b")
            @Assert(a1.startsWith(b1), false)
            LibC.free(a1)
            LibC.free(b1)

            var a2 = LibC.mallocCString("abcd")
            var b2 = LibC.mallocCString("e")
            @Assert(a2.startsWith(b2), false)
            LibC.free(a2)
            LibC.free(b2)

            var a3 = LibC.mallocCString("abcd")
            var b3 = LibC.mallocCString("")
            @Assert(a3.startsWith(b3), true)
            LibC.free(a3)
            LibC.free(b3)

            var a4 = LibC.mallocCString("")
            var b4 = LibC.mallocCString("a")
            @Assert(a4.startsWith(b4), false)
            LibC.free(a4)
            LibC.free(b4)

            var a5 = LibC.mallocCString("")
            var b5 = LibC.mallocCString("")
            @Assert(a5.startsWith(b5), true)
            LibC.free(a5)
            LibC.free(b5)

            var a6 = LibC.mallocCString("\t\n")
            var b6 = LibC.mallocCString("\t")
            @Assert(a6.startsWith(b6), true)
            LibC.free(a6)
            LibC.free(b6)

            var a7 = LibC.mallocCString("\t\n")
            var b7 = LibC.mallocCString("\\")
            @Assert(a7.startsWith(b7), false)
            LibC.free(a7)
            LibC.free(b7)

            var a8 = LibC.mallocCString("\0\n")
            var b8 = LibC.mallocCString("\0")
            @Assert(a8.startsWith(b8), true)
            LibC.free(a8)
            LibC.free(b8)

            var a9 = LibC.mallocCString("\0\n")
            var b9 = LibC.mallocCString("")
            @Assert(a9.startsWith(b9), true)
            LibC.free(a9)
            LibC.free(b9)

            var a10 = LibC.mallocCString("\ta")
            var b10 = LibC.mallocCString("a")
            @Assert(a10.startsWith(b10), false)
            LibC.free(a10)
            LibC.free(b10)
        }
    }

    @TestCase
    func test_endsWith(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("abcd")
            var b0 = LibC.mallocCString("d")
            @Assert(a0.endsWith(b0), true)
            LibC.free(a0)
            LibC.free(b0)

            var a1 = LibC.mallocCString("abcd")
            var b1 = LibC.mallocCString("b")
            @Assert(a1.endsWith(b1), false)
            LibC.free(a1)
            LibC.free(b1)

            var a2 = LibC.mallocCString("abcd")
            var b2 = LibC.mallocCString("a")
            @Assert(a2.endsWith(b2), false)
            LibC.free(a2)
            LibC.free(b2)

            var a3 = LibC.mallocCString("abcd")
            var b3 = LibC.mallocCString("")
            @Assert(a3.endsWith(b3), true)
            LibC.free(a3)
            LibC.free(b3)

            var a4 = LibC.mallocCString("")
            var b4 = LibC.mallocCString("a")
            @Assert(a4.endsWith(b4), false)
            LibC.free(a4)
            LibC.free(b4)

            var a5 = LibC.mallocCString("")
            var b5 = LibC.mallocCString("")
            @Assert(a5.endsWith(b5), true)
            LibC.free(a5)
            LibC.free(b5)

            var a6 = LibC.mallocCString("\t\n")
            var b6 = LibC.mallocCString("\n")
            @Assert(a6.endsWith(b6), true)
            LibC.free(a6)
            LibC.free(b6)

            var a7 = LibC.mallocCString("\t\n")
            var b7 = LibC.mallocCString("\\")
            @Assert(a7.endsWith(b7), false)
            LibC.free(a7)
            LibC.free(b7)

            var a8 = LibC.mallocCString("\0\n")
            var b8 = LibC.mallocCString("\0")
            @Assert(a8.endsWith(b8), true)
            LibC.free(a8)
            LibC.free(b8)

            var a9 = LibC.mallocCString("\0\n")
            var b9 = LibC.mallocCString("")
            @Assert(a9.endsWith(b9), true)
            LibC.free(a9)
            LibC.free(b9)

            var a10 = LibC.mallocCString("\ta")
            var b10 = LibC.mallocCString("a")
            @Assert(a10.endsWith(b10), true)
            LibC.free(a10)
            LibC.free(b10)
        }
    }

    @TestCase
    func test_equals(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("abcd")
            var b0 = LibC.mallocCString("")
            @Assert(a0.equals(b0), false)
            LibC.free(a0)
            LibC.free(b0)

            var a1 = LibC.mallocCString("abcd")
            var b1 = LibC.mallocCString("dcba")
            @Assert(a1.equals(b1), false)
            LibC.free(a1)
            LibC.free(b1)

            var a2 = LibC.mallocCString("")
            var b2 = LibC.mallocCString(" ")
            @Assert(a2.equals(b2), false)
            LibC.free(a2)
            LibC.free(b2)

            var a3 = LibC.mallocCString("abcd")
            var b3 = LibC.mallocCString("abcd")
            @Assert(a3.equals(b3), true)
            LibC.free(a3)
            LibC.free(b3)

            var a4 = LibC.mallocCString("\u{31}")
            var b4 = LibC.mallocCString("1")
            @Assert(a4.equals(b4), true)
            LibC.free(a4)
            LibC.free(b4)

            var a5 = LibC.mallocCString("A")
            var b5 = LibC.mallocCString("a")
            @Assert(a5.equals(b5), false)
            LibC.free(a5)
            LibC.free(b5)

            var a6 = LibC.mallocCString("A")
            var b6 = LibC.mallocCString("A")
            @Assert(a6.equals(b6), true)
            LibC.free(a6)
            LibC.free(b6)
        }
    }

    @TestCase
    func test_equalsLower(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("abcd")
            var b0 = LibC.mallocCString("")
            @Assert(a0.equalsLower(b0), false)
            LibC.free(a0)
            LibC.free(b0)

            var a1 = LibC.mallocCString("abcd")
            var b1 = LibC.mallocCString("dcba")
            @Assert(a1.equalsLower(b1), false)
            LibC.free(a1)
            LibC.free(b1)

            var a2 = LibC.mallocCString("")
            var b2 = LibC.mallocCString(" ")
            @Assert(a2.equalsLower(b2), false)
            LibC.free(a2)
            LibC.free(b2)

            var a3 = LibC.mallocCString("abcd")
            var b3 = LibC.mallocCString("abcd")
            @Assert(a3.equalsLower(b3), true)
            LibC.free(a3)
            LibC.free(b3)

            var a4 = LibC.mallocCString("\u{31}")
            var b4 = LibC.mallocCString("1")
            @Assert(a4.equalsLower(b4), true)
            LibC.free(a4)
            LibC.free(b4)

            var a5 = LibC.mallocCString("A")
            var b5 = LibC.mallocCString("a")
            @Assert(a5.equalsLower(b5), true)
            LibC.free(a5)
            LibC.free(b5)

            var a6 = LibC.mallocCString("A")
            var b6 = LibC.mallocCString("A")
            @Assert(a6.equalsLower(b6), true)
            LibC.free(a6)
            LibC.free(b6)
        }
    }

    @TestCase
    func test_subCString(): Unit {
        unsafe {
            var a0 = LibC.mallocCString("A")
            var b0 = LibC.mallocCString("A")
            var c0 = a0.subCString(0)
            @Assert(c0.compare(b0), 0)
            LibC.free(a0)
            LibC.free(b0)
            LibC.free(c0)

            var a1 = LibC.mallocCString("A")
            var b1 = LibC.mallocCString("")
            var c1 = a1.subCString(0)
            @Assert(c1.compare(b1), 1)
            LibC.free(a1)
            LibC.free(b1)
            LibC.free(c1)

            var a2 = LibC.mallocCString("ABCD")
            var b2 = LibC.mallocCString("ABCD")
            var c2 = a2.subCString(0)
            @Assert(c2.compare(b2), 0)
            LibC.free(a2)
            LibC.free(b2)
            LibC.free(c2)

            var a3 = LibC.mallocCString("ABCD")
            var b3 = LibC.mallocCString("CD")
            var c3 = a3.subCString(2, 2)
            @Assert(c3.compare(b3), 0)
            LibC.free(a3)
            LibC.free(b3)
            LibC.free(c3)

            var a4 = LibC.mallocCString("ABCD")
            var b4 = LibC.mallocCString("BCD")
            var c4 = a4.subCString(1, 5)
            @Assert(c4.compare(b4), 0)
            LibC.free(a4)
            LibC.free(b4)
            LibC.free(c4)
        }
    }
}
