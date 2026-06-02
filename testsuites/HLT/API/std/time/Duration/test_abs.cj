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
import std.time.*
import std.random.*
import std.math.*

@Test
class Test_abs {
    @TestCase
    func test_abs_01(): Unit {
        let duration = Duration.Zero
        let res = duration.abs()
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_abs_02(): Unit {
        let duration = Duration.Max
        let res = duration.abs()
        @Assert(res, Duration.Max)
    }

    @TestCase
    func test_abs_03(): Unit {
        var flag = false
        try {
            let duration = Duration.Min.abs()
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_abs_04(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let aim = Duration.nanosecond * abs(random)
        let duration = Duration.nanosecond * random
        let res = duration.abs()
        @Assert(res, aim)
    }
}
