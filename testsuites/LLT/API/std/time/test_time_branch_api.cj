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
public class TimeBranchApiTest {

    // === DateTime basic ===
    @TestCase
    func test_datetime_now(): Unit {
        let dt = DateTime.now()
        @Assert(dt.year > 2000)
    }

    @TestCase
    func test_datetime_of(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        @Expect(dt.year, 2025)
    }

    @TestCase
    func test_datetime_year_month_day(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.July, dayOfMonth: 10, hour: 12, minute: 30, second: 45)
        @Expect(dt.year, 2025)
        @Expect(dt.month, Month.July)
        @Expect(dt.dayOfMonth, 10)
        @Expect(dt.hour, 12)
        @Expect(dt.minute, 30)
        @Expect(dt.second, 45)
    }

    @TestCase
    func test_datetime_day_of_week(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        match (dt.dayOfWeek) {
            case DayOfWeek.Wednesday => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func test_datetime_toString(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        @Assert(dt.toString().startsWith("2025-01-01"))
    }

    @TestCase
    func test_datetime_in_utc(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let utc = dt.inUTC()
        @Assert(utc.year > 0)
    }

    @TestCase
    func test_datetime_in_local(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let local = dt.inLocal()
        @Assert(local.year > 0)
    }

    @TestCase
    func test_datetime_add_years(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addYears(10)
        @Expect(dt2.year, 2035)
    }

    @TestCase
    func test_datetime_subtract_years(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addYears(-5)
        @Expect(dt2.year, 2020)
    }

    @TestCase
    func test_datetime_add_months(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addMonths(13)
        @Expect(dt2.year, 2026)
        @Expect(dt2.month, Month.February)
    }

    @TestCase
    func test_datetime_add_days(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addDays(31)
        @Expect(dt2.month, Month.February)
    }

    @TestCase
    func test_datetime_add_hours(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addHours(25)
        @Expect(dt2.dayOfMonth, 2)
    }

    @TestCase
    func test_datetime_add_minutes(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addMinutes(61)
        @Expect(dt2.hour, 1)
    }

    @TestCase
    func test_datetime_add_seconds(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addSeconds(61)
        @Expect(dt2.minute, 1)
    }

    @TestCase
    func test_datetime_add_weeks(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addWeeks(1)
        @Expect(dt2.dayOfMonth, 8)
    }

    @TestCase
    func test_datetime_add_nanoseconds(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = dt.addNanoseconds(1000)
        @Assert(dt2.year > 0)
    }

    @TestCase
    func test_datetime_compare(): Unit {
        let dt1 = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let dt2 = DateTime.of(year: 2026, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        @Expect(dt1.compare(dt2), Ordering.LT)
        @Expect(dt2.compare(dt1), Ordering.GT)
        @Expect(dt1.compare(dt1), Ordering.EQ)
    }

    @TestCase
    func test_datetime_hashcode(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        @Assert(dt.hashCode() == dt.hashCode())
    }

    @TestCase
    func test_datetime_to_unix_timestamp(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let ts = dt.toUnixTimeStamp()
        @Assert(ts > Duration.Zero)
    }

    @TestCase
    func test_datetime_format(): Unit {
        let dt = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 15, hour: 12, minute: 30, second: 45)
        let formatted = dt.format("yyyy-MM-dd")
        @Assert(formatted.contains("2025"))
    }

    @TestCase
    func test_datetime_subtract(): Unit {
        let dt1 = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 2, hour: 0, minute: 0, second: 0)
        let dt2 = DateTime.of(year: 2025, month: Month.January, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        let diff = dt1 - dt2
        @Assert(diff > Duration.Zero)
    }

    // === DayOfWeek ===
    @TestCase
    func test_day_of_week_to_integer(): Unit {
        @Expect(DayOfWeek.Sunday.toInteger(), 0)
        @Expect(DayOfWeek.Monday.toInteger(), 1)
        @Expect(DayOfWeek.Tuesday.toInteger(), 2)
        @Expect(DayOfWeek.Wednesday.toInteger(), 3)
        @Expect(DayOfWeek.Thursday.toInteger(), 4)
        @Expect(DayOfWeek.Friday.toInteger(), 5)
        @Expect(DayOfWeek.Saturday.toInteger(), 6)
    }

    @TestCase
    func test_day_of_week_to_string(): Unit {
        @Assert(DayOfWeek.Sunday.toString().size > 0)
        @Assert(DayOfWeek.Monday.toString().size > 0)
    }

    // === Month ===
    @TestCase
    func test_month_to_integer(): Unit {
        @Expect(Month.January.toInteger(), 1)
        @Expect(Month.June.toInteger(), 6)
        @Expect(Month.December.toInteger(), 12)
    }

    @TestCase
    func test_month_to_string(): Unit {
        @Assert(Month.January.toString().size > 0)
        @Assert(Month.December.toString().size > 0)
    }

    // === MonoTime ===
    @TestCase
    func test_monotime_now(): Unit {
        let t1 = MonoTime.now()
        @Assert(true)
    }

    @TestCase
    func test_monotime_compare(): Unit {
        let t1 = MonoTime.now()
        let t2 = MonoTime.now()
        @Assert(t2 >= t1)
    }

    @TestCase
    func test_monotime_hashcode(): Unit {
        let t = MonoTime.now()
        @Assert(t.hashCode() == t.hashCode())
    }

    @TestCase
    func test_monotime_subtract(): Unit {
        let t1 = MonoTime.now()
        let t2 = MonoTime.now()
        let diff = t2 - t1
        @Assert(diff >= Duration.Zero)
    }

    // === TimeZone ===
    @TestCase
    func test_timezone_utc(): Unit {
        @Expect(TimeZone.UTC.toString(), "UTC")
    }

    @TestCase
    func test_timezone_local(): Unit {
        @Assert(TimeZone.Local.toString().size > 0)
    }

    @TestCase
    func test_timezone_equal(): Unit {
        @Assert(TimeZone.UTC == TimeZone.UTC)
    }

    // === TimeParseException ===
    @TestCase
    func test_time_parse_exception_no_arg(): Unit {
        let e = TimeParseException()
        @Assert(true)
    }

    @TestCase
    func test_time_parse_exception_with_msg(): Unit {
        let e = TimeParseException("parse error")
        @Assert(e.message.contains("parse error"))
    }

    // === DateTimeFormat ===
    @TestCase
    func test_datetime_format_constants(): Unit {
        @Assert(DateTimeFormat.RFC1123.size > 0)
        @Assert(DateTimeFormat.RFC3339.size > 0)
        @Assert(DateTimeFormat.RFC822.size > 0)
    }
}
