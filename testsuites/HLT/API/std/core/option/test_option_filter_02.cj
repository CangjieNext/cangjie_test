/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

@Test
class Test_option_filter_27 {
    @TestCase
    func test_option_filter_01(): Unit {
        let opt1 = Option<Int64>.None
        let opt2 = Some(Int64.Min)
        let opt3 = Some(Int64.Max)
        let predicate: (Int64) -> Bool = {x: Int64 => x % 2 == 0}
        @Expect(opt1.filter(predicate), Option<Int64>.None)
        @Expect(opt2.filter(predicate), Option<Int64>.Some(-9223372036854775808))
        @Expect(opt3.filter(predicate), Option<Int64>.None)
    }

    @TestCase
    func test_option_filter_02(): Unit {
        let opt1 = Option<Int32>.None
        let opt2 = Some(Int32.Min)
        let opt3 = Some(Int32.Max)
        let predicate: (Int32) -> Bool = {x: Int32 => x == -2147483648}
        @Expect(opt1.filter(predicate), Option<Int32>.None)
        @Expect(opt2.filter(predicate), Option<Int32>.Some(-2147483648))
        @Expect(opt3.filter(predicate), Option<Int32>.None)
    }

    @TestCase
    func test_option_filter_03(): Unit {
        let opt1 = Option<Float64>.None
        let opt2 = Some(3.12334f64)
        let opt3 = Some(-0.0012f64)
        let predicate: (Float64) -> Bool = {x: Float64 => x != 0.0}
        @Expect(opt1.filter(predicate), Option<Float64>.None)
        @Expect(opt2.filter(predicate), Option<Float64>.Some(3.12334f64))
        @Expect(opt3.filter(predicate), Option<Float64>.Some(-0.0012f64))
    }
}
