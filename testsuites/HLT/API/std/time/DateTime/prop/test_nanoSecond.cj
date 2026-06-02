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
class Test_nanosecond {
    @TestCase
    func test_nanosecond_01(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .nanosecond
        @Assert(res, 0)
    }

    @TestCase
    func test_nanosecond_02(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 999999999)
            .nanosecond
        @Assert(res, 999999999)
    }

    @TestCase
    func test_nanosecond_03(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 500000000)
            .nanosecond
        @Assert(res, 500000000)
    }

    @TestCase
    func test_nanosecond_04(): Unit {
        let res = DateTime
            .of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .nanosecond
        @Assert(res, 0)
    }

    @TestCase
    func test_nanosecond_05(): Unit {
        let res = DateTime
            .of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 999999999)
            .nanosecond
        @Assert(res, 999999999)
    }

    @TestCase
    func test_nanosecond_06(): Unit {
        let res = DateTime
            .of(year: -99999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 500000000)
            .nanosecond
        @Assert(res, 500000000)
    }
}
