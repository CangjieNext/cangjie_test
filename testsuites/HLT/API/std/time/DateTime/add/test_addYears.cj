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
class Test_addYears {
    @TestCase
    func test_addYears_01(): Unit {
        let res = DateTime
            .of(year: 2020, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(1)
        @Assert(res.toString(), "2021-02-28T00:00:00Z")
    }

    @TestCase
    func test_addYears_02(): Unit {
        let res = DateTime
            .of(year: 2008, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(-1)
        @Assert(res.toString(), "2007-02-28T00:00:00Z")
    }

    @TestCase
    func test_addYears_03(): Unit {
        let res = DateTime
            .of(year: 2020, month: 3, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(1)
        @Assert(res.toString(), "2021-03-31T00:00:00Z")
    }

    @TestCase
    func test_addYears_04(): Unit {
        let res = DateTime
            .of(year: 2022, month: 3, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(-1)
        @Assert(res.toString(), "2021-03-31T00:00:00Z")
    }

    @TestCase
    func test_addYears_05(): Unit {
        let res = DateTime
            .of(year: 2020, month: 4, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(1)
        @Assert(res.toString(), "2021-04-30T00:00:00Z")
    }

    @TestCase
    func test_addYears_06(): Unit {
        let res = DateTime
            .of(year: 2020, month: 4, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .addYears(-1)
        @Assert(res.toString(), "2019-04-30T00:00:00Z")
    }

    @TestCase
    func test_addYears_07(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addYears(1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_addYears_08(): Unit {
        var flag = false
        try {
            let res = DateTime
                .of(year: -999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                    timeZone: TimeZone.UTC)
                .addYears(-1)
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        @Assert(flag, true)
    }
}
