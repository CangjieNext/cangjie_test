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
class Test_add {
    @TestCase
    func test_add_01(): Unit {
        let duration = Duration.nanosecond
        let time = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 999999999)
        let res = time + duration
        @Assert(res.toString(), "999999999-01-01T00:00:01Z")
    }

    @TestCase
    func test_add_02(): Unit {
        let duration = Duration.second
        let time = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 59,
            nanosecond: 0)
        let res = time + duration
        @Assert(res.toString(), "999999999-01-01T00:01:00Z")
    }

    @TestCase
    func test_add_03(): Unit {
        let duration = Duration.minute
        let time = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 59, second: 0,
            nanosecond: 0)
        let res = time + duration
        @Assert(res.toString(), "999999999-01-01T01:00:00Z")
    }

    @TestCase
    func test_add_04(): Unit {
        let duration = Duration.hour
        let time = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 23, minute: 0, second: 0,
            nanosecond: 0)
        let res = time + duration
        @Assert(res.toString(), "999999999-01-02T00:00:00Z")
    }

    @TestCase
    func test_add_05(): Unit {
        let duration = Duration.day
        let time = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 31, hour: 0, minute: 0, second: 0,
            nanosecond: 0)
        let res = time + duration
        @Assert(res.toString(), "999999999-02-01T00:00:00Z")
    }

    @TestCase
    func test_add_06(): Unit {
        let duration = Duration.day
        let time = DateTime.of(year: 999999999, month: 12, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0)
        var flag = false
        try {
            let res = time + duration
        } catch (e: ArithmeticException) {
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_add_07(): Unit {
        let duration = Duration.day * -1
        let time = DateTime.of(year: -999999999, month: 1, dayOfMonth: 1, hour: 9, minute: 0, second: 0, nanosecond: 0)
        var flag = false
        try {
            let res = time + duration
        } catch (e: ArithmeticException) {
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }
}
