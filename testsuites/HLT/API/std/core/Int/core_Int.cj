/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

func test() {
    var a: Int64 = 1
    return a
}

var temp: Int8 = 1

func f1() {
    return temp + 63
}

@Test
class TestInt {
    @TestCase
    func test_int() {
        var a: Int8 = 1
        @Assert(a.toString(), "1")

        var a1: Int8 = -128
        @Assert(a1.toString(), "-128")

        var count = 0
        try {
            var a2: Int8 = f1()
            var b2: Int8 = f1()
            var c3 = a2 + b2
        } catch (e: OverflowException) {
            count += 1
        }

        @Assert(count, 1)
    }

    @TestCase
    func test_int16() {
        var a: Int16 = 1
        @Assert(a.toString(), "1")
    }

    @TestCase
    func test_int32() {
        var a: Int32 = 1
        @Assert(a.toString(), "1")
    }

    @TestCase
    func test_int64() {
        var a: Int64 = 1
        @Assert(a.toString(), "1")
    }

    @TestCase
    func test_int_compare() {
        var a: Int64 = 1
        var b: Int64 = 1
        @Assert(a.compare(b), Ordering.EQ)

        var a1: Int64 = 1
        var b1: Int64 = 1
        @Assert((a1 + b1 + a1).compare(b1), Ordering.GT)

        var a2: Int64 = 1
        var b2: Int64 = 1
        @Assert((a2 + b2).compare(test()), Ordering.GT)

        var a3: Int8 = 1
        var b3: Int16 = 0
        @Assert((a3).compare(Int8(b3)), Ordering.GT)
    }
}
