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
class Test_option_flatten_29 {
    @TestCase
    func test_option_flatten_01(): Unit {
        let opt1 = Option<Int32>.None
        let opt2 = Some(Int32.Min)
        let opt3 = Some(Int32.Max)
        let opt4 = Some(opt1)
        let opt5 = Some(opt2)
        let opt6 = Some(opt3)
        @Expect(opt4.flatten(), opt1)
        @Expect(opt5.flatten(), opt2)
        @Expect(opt6.flatten(), opt3)
    }

    @TestCase
    func test_option_flatten_02(): Unit {
        let opt1 = Option<Int32>.None
        let opt2 = Some(Int32.Min)
        let opt3 = Some(Int32.Max)
        let opt4 = Some(opt1)
        let opt5 = Some(opt2)
        let opt6 = Some(opt3)
        let opt7 = Some(opt4)
        let opt8 = Some(opt5)
        let opt9 = Some(opt6)
        @Expect(opt7.flatten(), opt4)
        @Expect(opt8.flatten(), opt5)
        @Expect(opt9.flatten(), opt6)
    }

    @TestCase
    func test_option_flatten_03(): Unit {
        let opt0 = Option<Option<Option<Float64>>>.None
        let opt1 = Option<Float64>.None
        let opt2 = Some(3.12334f64)
        let opt3 = Some(-0.0012f64)
        let opt4 = Some(opt1)
        let opt5 = Some(opt2)
        let opt6 = Some(opt3)
        @Expect(opt0.flatten(), Option<Option<Float64>>.None)
        @Expect(opt4.flatten(), opt1)
        @Expect(opt5.flatten(), opt2)
        @Expect(opt6.flatten(), opt3)
    }
}
