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

@Test
class Test_dayOfMonth {
    @TestCase
    func test_dayOfMonth_01(): Unit {
        let res = DateTime.of(year: 2023, month: 1, dayOfMonth: 31).dayOfMonth
        @Assert(res, 31)
    }

    @TestCase
    func test_dayOfMonth_02(): Unit {
        let res = DateTime.of(year: 2023, month: 4, dayOfMonth: 30).dayOfMonth
        @Assert(res, 30)
    }

    @TestCase
    func test_dayOfMonth_03(): Unit {
        let res = DateTime.of(year: 2008, month: 2, dayOfMonth: 29).dayOfMonth
        @Assert(res, 29)
    }

    @TestCase
    func test_dayOfMonth_04(): Unit {
        let res = DateTime.of(year: 2000, month: 2, dayOfMonth: 29).dayOfMonth
        @Assert(res, 29)
    }

    @TestCase
    func test_dayOfMonth_05(): Unit {
        let res = DateTime.of(year: 1900, month: 2, dayOfMonth: 28).dayOfMonth
        @Assert(res, 28)
    }

    @TestCase
    func test_dayOfMonth_06(): Unit {
        let res = DateTime.of(year: 2023, month: 2, dayOfMonth: 28).dayOfMonth
        @Assert(res, 28)
    }

    @TestCase
    func test_dayOfMonth_07(): Unit {
        let res = DateTime.of(year: -2023, month: 1, dayOfMonth: 31).dayOfMonth
        @Assert(res, 31)
    }

    @TestCase
    func test_dayOfMonth_08(): Unit {
        let res = DateTime.of(year: -2023, month: 4, dayOfMonth: 30).dayOfMonth
        @Assert(res, 30)
    }

    @TestCase
    func test_dayOfMonth_09(): Unit {
        let res = DateTime.of(year: -2008, month: 2, dayOfMonth: 29).dayOfMonth
        @Assert(res, 29)
    }

    @TestCase
    func test_dayOfMonth_10(): Unit {
        let res = DateTime.of(year: -2000, month: 2, dayOfMonth: 29).dayOfMonth
        @Assert(res, 29)
    }

    @TestCase
    func test_dayOfMonth_11(): Unit {
        let res = DateTime.of(year: -1900, month: 2, dayOfMonth: 28).dayOfMonth
        @Assert(res, 28)
    }

    @TestCase
    func test_dayOfMonth_12(): Unit {
        let res = DateTime.of(year: -2023, month: 2, dayOfMonth: 28).dayOfMonth
        @Assert(res, 28)
    }
}
