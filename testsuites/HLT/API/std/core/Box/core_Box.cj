/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

@Test
class TestBox {
    @TestCase
    func test_Box_init(): Unit {
        var a: Box<Int64> = Box<Int64>(1)
        @Assert(a.value, 1)

        var a1: Box<Range<Int64>> = Box<Range<Int64>>(1..3)
        @Assert(a1.value == (1..3), true)

        var a2: Box<String> = Box<String>("test")
        @Assert(a2.value, "test")
    }

    @TestCase
    func test_Box_Hashable(): Unit {
        var a: Box<Range<Int64>> = Box<Range<Int64>>(1..3)
        var temp: Int64 = 1
        @Assert(a.hashCode().compare(temp), Ordering.LT)
    }

    @TestCase
    func test_Box_Compare(): Unit {
        var a: Box<Int64> = Box<Int64>(1)
        var b: Box<Int64> = Box<Int64>(1)
        @Assert(a.compare(b), Ordering.EQ)
        @Assert(a == b, true)
        @Assert(a > b, false)
        @Assert(a < b, false)
        @Assert(a >= b, true)
        @Assert(a <= b, true)

        var a1: Box<String> = Box<String>("b")
        var b1: Box<String> = Box<String>("a")
        @Assert(a1 > b1, true)

        var a2: Box<Rune> = Box<Rune>(r'\u{32}')
        var b2: Box<Rune> = Box<Rune>(r'\u{34}')
        @Assert(a2 < b2, true)
    }

    @TestCase
    func test_Box_toString(): Unit {
        var a: Box<Int64> = Box<Int64>(1)
        @Assert(a.toString(), "1")

        var b: Box<Rune> = Box<Rune>(r'b')
        @Assert(b.toString(), "b")
    }
}
