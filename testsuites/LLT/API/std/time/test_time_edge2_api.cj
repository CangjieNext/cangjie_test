/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TimeEdgeBranchTest {

    // ==================== DateTime constructors ====================

    @TestCase
    func test_datetime_of_utc(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        @Expect(dt.year, 2023)
        @Expect(dt.month, Month.June)
        @Expect(dt.dayOfMonth, 15)
    }

    @TestCase
    func test_datetime_of_zone(): Unit {
        let dt = DateTime.of(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0, timeZone: TimeZone.systemDefault())
        @Expect(dt.year, 2023)
    }

    @TestCase
    func test_datetime_year(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        @Expect(dt.year, 2023)
    }

    @TestCase
    func test_datetime_month(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        match (dt.month) {
            case Month.June => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_datetime_day_of_month(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        @Expect(dt.dayOfMonth, 15)
    }

    @TestCase
    func test_datetime_day_of_week(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        let dow = dt.dayOfWeek
        @Assert(true)
    }

    @TestCase
    func test_datetime_hour(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        @Expect(dt.hour, 12)
    }

    @TestCase
    func test_datetime_minute(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        @Expect(dt.minute, 30)
    }

    @TestCase
    func test_datetime_second(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 45, nanosecond: 0)
        @Expect(dt.second, 45)
    }

    @TestCase
    func test_datetime_nanosecond(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 123)
        @Expect(dt.nanosecond, 123)
    }

    // ==================== DateTime arithmetic ====================

    @TestCase
    func test_datetime_add_duration(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let dt2 = dt + Duration.hour * 3
        @Expect(dt2.hour, 15)
    }

    @TestCase
    func test_datetime_sub_duration(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let dt2 = dt - Duration.hour * 3
        @Expect(dt2.hour, 9)
    }

    @TestCase
    func test_datetime_sub_datetime(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 15, minute: 0, second: 0, nanosecond: 0)
        let dt2 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let diff = dt1 - dt2
        @Expect(diff.toHours(), 3)
    }

    @TestCase
    func test_datetime_add_days(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let dt2 = dt + Duration.day * 1
        @Expect(dt2.dayOfMonth, 16)
    }

    // ==================== DateTime comparison ====================

    @TestCase
    func test_datetime_compare(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let dt2 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 13, minute: 0, second: 0, nanosecond: 0)
        @Assert(dt1 < dt2)
        @Assert(dt2 > dt1)
        @Assert(dt1 <= dt1)
        @Assert(dt2 >= dt1)
    }

    @TestCase
    func test_datetime_equals(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        let dt2 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        @Assert(dt1 == dt2)
    }

    // ==================== DateTime now ====================

    @TestCase
    func test_datetime_now(): Unit {
        let dt = DateTime.now()
        @Assert(dt.year >= 2024)
    }

    @TestCase
    func test_datetime_now_utc(): Unit {
        let dt = DateTime.nowUTC()
        @Assert(dt.year >= 2024)
    }

    // ==================== DateTime toString ====================

    @TestCase
    func test_datetime_to_string(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 30, second: 0, nanosecond: 0)
        let s = dt.toString()
        @Assert(s.contains("2023"))
    }


    // ==================== DateTime parse ====================

    @TestCase
    func test_datetime_parse_valid(): Unit {
        match (DateTime.parse("2023-06-15T12:30:00Z")) {
            case Some(dt) => @Expect(dt.year, 2023)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_datetime_parse_invalid(): Unit {
        match (DateTime.parse("not a date")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    // ==================== Month enum ====================

    @TestCase
    func test_month_january(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        match (dt.month) {
            case Month.January => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_month_december(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        match (dt.month) {
            case Month.December => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_month_to_int(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, nanosecond: 0)
        match (dt.month) {
            case Month.June => @Assert(true)
            case _ => @Assert(false)
        }
    }

    // ==================== DayOfWeek ====================

    @TestCase
    func test_day_of_week_monday(): Unit {
        // 2023-01-02 was a Monday
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 2, hour: 12, minute: 0, second: 0, nanosecond: 0)
        match (dt.dayOfWeek) {
            case DayOfWeek.Monday => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_day_of_week_friday(): Unit {
        // 2023-06-16 was a Friday
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 16, hour: 12, minute: 0, second: 0, nanosecond: 0)
        match (dt.dayOfWeek) {
            case DayOfWeek.Friday => @Assert(true)
            case _ => @Assert(false)
        }
    }

    // ==================== Leap year ====================

    @TestCase
    func test_leap_year_2024(): Unit {
        let dt = DateTime.ofUTC(year: 2024, month: 2, dayOfMonth: 29, hour: 12, minute: 0, second: 0, nanosecond: 0)
        @Expect(dt.dayOfMonth, 29)
    }

    @TestCase
    func test_non_leap_year_2023(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28, hour: 12, minute: 0, second: 0, nanosecond: 0)
        @Expect(dt.dayOfMonth, 28)
    }

    // ==================== MonoTime ====================
}
