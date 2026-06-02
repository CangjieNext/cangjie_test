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
class Test_addWeeks {
    @TestCase
    func test_addWeeks_01(): Unit {
        let res = DateTime
            .of(year: 2008, month: 2, dayOfMonth: 22, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2008-02-29T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_02(): Unit {
        let res = DateTime
            .of(year: 2008, month: 2, dayOfMonth: 23, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2008-03-01T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_03(): Unit {
        let res = DateTime
            .of(year: 2008, month: 3, dayOfMonth: 7, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2008-02-29T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_04(): Unit {
        let res = DateTime
            .of(year: 2008, month: 3, dayOfMonth: 6, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2008-02-28T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_05(): Unit {
        let res = DateTime
            .of(year: 2007, month: 2, dayOfMonth: 22, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-03-01T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_06(): Unit {
        let res = DateTime
            .of(year: 2007, month: 2, dayOfMonth: 21, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-02-28T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_07(): Unit {
        let res = DateTime
            .of(year: 2007, month: 3, dayOfMonth: 8, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-03-01T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_08(): Unit {
        let res = DateTime
            .of(year: 2007, month: 3, dayOfMonth: 7, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-02-28T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_09(): Unit {
        let res = DateTime
            .of(year: 2007, month: 4, dayOfMonth: 23, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-04-30T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_10(): Unit {
        let res = DateTime
            .of(year: 2007, month: 4, dayOfMonth: 24, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-05-01T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_11(): Unit {
        let res = DateTime
            .of(year: 2007, month: 4, dayOfMonth: 7, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-03-31T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_12(): Unit {
        let res = DateTime
            .of(year: 2007, month: 4, dayOfMonth: 6, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-03-30T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_13(): Unit {
        let res = DateTime
            .of(year: 2007, month: 3, dayOfMonth: 24, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-03-31T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_14(): Unit {
        let res = DateTime
            .of(year: 2007, month: 3, dayOfMonth: 25, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(1)
        @Assert(res.toString(), "2007-04-01T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_15(): Unit {
        let res = DateTime
            .of(year: 2007, month: 5, dayOfMonth: 7, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-04-30T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_16(): Unit {
        let res = DateTime
            .of(year: 2007, month: 5, dayOfMonth: 6, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addWeeks(-1)
        @Assert(res.toString(), "2007-04-29T00:00:00Z")
    }

    @TestCase
    func test_addWeeks_17(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: 999999999, month: 12, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addWeeks(1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_addWeeks_18(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: -999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addWeeks(-1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }
}
