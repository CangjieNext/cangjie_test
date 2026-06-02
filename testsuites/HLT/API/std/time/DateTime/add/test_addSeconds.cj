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
class Test_addSeconds {
    @TestCase
    func test_addSeconds_01(): Unit {
        let res = DateTime
            .of(year: 2007, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: 59, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(1)
        @Assert(res.toString(), "2007-03-01T00:00:00Z")
    }

    @TestCase
    func test_addSeconds_02(): Unit {
        let res = DateTime
            .of(year: 2007, month: 3, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(-1)
        @Assert(res.toString(), "2007-02-28T23:59:59Z")
    }

    @TestCase
    func test_addSeconds_03(): Unit {
        let res = DateTime
            .of(year: 2008, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: 59, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(1)
        @Assert(res.toString(), "2008-02-29T00:00:00Z")
    }

    @TestCase
    func test_addSeconds_04(): Unit {
        let res = DateTime
            .of(year: 2008, month: 3, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(-1)
        @Assert(res.toString(), "2008-02-29T23:59:59Z")
    }

    @TestCase
    func test_addSeconds_05(): Unit {
        let res = DateTime
            .of(year: 2007, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(1)
        @Assert(res.toString(), "2008-01-01T00:00:00Z")
    }

    @TestCase
    func test_addSeconds_06(): Unit {
        let res = DateTime
            .of(year: 2007, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addSeconds(-1)
        @Assert(res.toString(), "2006-12-31T23:59:59Z")
    }

    @TestCase
    func test_addSeconds_07(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: 999999999, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addSeconds(1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_addSeconds_08(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: -999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addSeconds(-1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }
}
