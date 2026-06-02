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
class Test_option_flatmap_28 {
    @TestCase
    func test_option_flatmap_01(): Unit {
        let opt1 = Option<Int32>.None
        let opt2 = Some(Int32.Min)
        let opt3 = Some(Int32.Max)
        let transform: (Int32) -> Option<Int64> = {x: Int32 => Some(Int64(x) + 1)}
        @Expect(opt1.flatMap<Int64>(transform), Option<Int64>.None)
        @Expect(opt2.flatMap<Int64>(transform), Option<Int64>.Some(-2147483647))
        @Expect(opt3.flatMap<Int64>(transform), Option<Int64>.Some(2147483648))
    }

    @TestCase
    func test_option_flatmap_02(): Unit {
        let opt1 = Option<Int32>.None
        let opt2 = Some(Int32.Min)
        let opt3 = Some(Int32.Max)
        let transform: (Int32) -> Option<String> = {x: Int32 => Some(x.toString())}
        @Expect(opt1.flatMap<String>(transform), Option<String>.None)
        @Expect(opt2.flatMap<String>(transform), Option<String>.Some("-2147483648"))
        @Expect(opt3.flatMap<String>(transform), Option<String>.Some("2147483647"))
    }

    @TestCase
    func test_option_flatmap_03(): Unit {
        let opt1 = Option<Float64>.None
        let opt2 = Some(3.12334f64)
        let opt3 = Some(-0.0012f64)
        let transform: (Float64) -> Option<String> = {x: Float64 => Some(x.toString())}
        @Expect(opt1.flatMap<String>(transform), Option<String>.None)
        @Expect(opt2.flatMap<String>(transform), Option<String>.Some("3.123340"))
        @Expect(opt3.flatMap<String>(transform), Option<String>.Some("-0.001200"))
    }
}
