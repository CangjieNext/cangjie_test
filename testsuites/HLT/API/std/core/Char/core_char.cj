/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

@Test
class TestChar {
    let a = r'\"'
    let b = r'\$'
    let c = "\'"
    @TestCase
    func test_char(): Unit {
        var a = r'\u{45}'
        @Assert(a.isAsciiLetter(), true)

        var a1 = r'a'
        @Assert(a1.isAsciiLetter(), true)

        var a2 = r'\n'
        @Assert(a2.isAsciiLetter(), false)

        var a3 = r'.'
        @Assert(a3.isAsciiLetter(), false)

        var b = r'\u{31}'
        @Assert(b.isAsciiNumber(), true)

        var c = r'\u{41}'
        @Assert(c.isAsciiLowerCase(), false)

        var d = r'\u{41}'
        @Assert(d.isAsciiUpperCase(), true)

        var e = r'\u{20}'
        @Assert(e.isAsciiWhiteSpace(), true)

        var f = r'\u{61}'.toAsciiUpperCase()
        @Assert(f.isAsciiUpperCase(), true)

        var g = r'\u{41}'.toAsciiLowerCase()
        @Assert(g.isAsciiLowerCase(), true)

        var g1 = r'.'.toAsciiLowerCase()
        @Assert(g1.isAsciiLowerCase(), false)

        var g2 = r'.'.toAsciiUpperCase()
        @Assert(g2.isAsciiUpperCase(), false)

        var g3 = r'测'
        @Assert(g3.isAsciiLetter(), false)

        var g4 = r'测'.toAsciiUpperCase()
        @Assert(g4.isAsciiUpperCase(), false)

        var g5 = r'测'.toAsciiLowerCase()
        @Assert(g5.isAsciiLowerCase(), false)
    }

    @TestCase
    func test_char_compare(): Unit {
        var a0 = r'a'
        var b0 = r'b'
        @Assert(a0.compare(b0), Ordering.LT)

        var a1 = r'a'
        var b1 = r'A'
        @Assert(a1.compare(b1), Ordering.GT)

        var a2 = r'a'
        var b2 = r'a'
        @Assert(a2.compare(b2), Ordering.EQ)

        var a3 = r'.'
        var b3 = r'b'
        @Assert(a3.compare(b3), Ordering.LT)

        var a4 = r'测'
        var b4 = r'试'
        @Assert(a4.compare(b4), Ordering.LT)
    }

    @TestCase
    func test_char_toString() {
        var a0 = r'a'
        @Assert(a0.toString(), "a")

        var a1 = r'\u{61}'
        @Assert(a1.toString(), "a")
    }
}
