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

@Test
class Test_comparison_operators {
    @TestCase
    func test_equal_01(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 == duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_equal_02(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 == duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_notequal_01(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 != duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_notequal_02(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 != duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_greaterequal_01(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 >= duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_greaterequal_02(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 >= duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_greaterequal_03(): Unit {
        let duration1 = Duration.nanosecond * 999
        let duration2 = Duration.microsecond
        let flag = duration1 >= duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_greater_01(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 > duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_greater_02(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 > duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_greater_03(): Unit {
        let duration1 = Duration.nanosecond * 999
        let duration2 = Duration.microsecond
        let flag = duration1 > duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_lessequal_01(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 <= duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_lessequal_02(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 <= duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_lessequal_03(): Unit {
        let duration1 = Duration.nanosecond * 999
        let duration2 = Duration.microsecond
        let flag = duration1 <= duration2
        @Assert(flag, true)
    }

    @TestCase
    func test_less_01(): Unit {
        let duration1 = Duration.nanosecond * 1001
        let duration2 = Duration.microsecond
        let flag = duration1 < duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_less_02(): Unit {
        let duration1 = Duration.nanosecond * 1000
        let duration2 = Duration.microsecond
        let flag = duration1 < duration2
        @Assert(flag, false)
    }

    @TestCase
    func test_less_03(): Unit {
        let duration1 = Duration.nanosecond * 999
        let duration2 = Duration.microsecond
        let flag = duration1 < duration2
        @Assert(flag, true)
    }
}
