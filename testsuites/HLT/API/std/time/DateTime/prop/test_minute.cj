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
class Test_minute {
    @TestCase
    func test_minute_01(): Unit {
        let res = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0).minute
        @Assert(res, 0)
    }

    @TestCase
    func test_minute_02(): Unit {
        let res = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 59).minute
        @Assert(res, 59)
    }

    @TestCase
    func test_minute_03(): Unit {
        let res = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 30).minute
        @Assert(res, 30)
    }

    @TestCase
    func test_minute_04(): Unit {
        let res = DateTime.of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0).minute
        @Assert(res, 0)
    }

    @TestCase
    func test_minute_05(): Unit {
        let res = DateTime.of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 59).minute
        @Assert(res, 59)
    }

    @TestCase
    func test_minute_06(): Unit {
        let res = DateTime.of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 30).minute
        @Assert(res, 30)
    }
}
