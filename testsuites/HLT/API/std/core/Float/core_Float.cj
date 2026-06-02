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

func test() {
    var a: Float64 = 1.0
    return a
}

@Test
class TestFloat {
    @TestCase
    func test_Float16() {
        var a: Float16 = 1.0
        @Assert(a.toString(), "1.000000")
    }

    @TestCase
    func test_Float32() {
        var a: Float32 = 1.0
        @Assert(a.toString(), "1.000000")
    }

    @TestCase
    func test_Float64() {
        var a: Float64 = 1.0
        @Assert(a.toString(), "1.000000")
    }

    @TestCase
    func test_Float_compare() {
        var a: Float64 = 1.0
        var b: Float64 = 1.0
        @Assert(a.compare(b), Ordering.EQ)

        var a1: Float64 = 1.0
        var b1: Float64 = 1.0
        @Assert((a1 + b1 + a1).compare(b1), Ordering.GT)

        var a2: Float64 = 1.0
        var b2: Float64 = 1.0
        @Assert((a2 + b2).compare(test()), Ordering.GT)

        var a3: Float16 = 1.0
        var b3: Float16 = 1.0
        @Assert(a3.compare(b3), Ordering.EQ)
    }
}
