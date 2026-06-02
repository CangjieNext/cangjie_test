/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_datetime_pub.cj
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f test_datetime_pub.cj %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo\ %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.math.*

@Test
public class AddMinutesTest {
    @TestCase
    func add1DayMinutes(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        var after = dateTime.addMinutes(MINUTES_PER_DAY)
        var expect = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        after = dateTime.addMinutes(MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addMinutes(MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        after = dateTime.addMinutes(MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func sub1DayMinutes(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        var after = dateTime.addMinutes(-MINUTES_PER_DAY)
        var expect = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addMinutes(-MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        after = dateTime.addMinutes(-MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        after = dateTime.addMinutes(-MINUTES_PER_DAY)
        expect = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        @Expect(after, expect)
    }

    @TestCase
    func addMinutesOutOfRange_1(): Unit {
        var datetime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31)
        try {
            datetime.addMinutes(MINUTES_PER_DAY)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addMinutes(Int64.Max)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addHoursOutOfRange_2(): Unit {
        var datetime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            datetime.addMinutes(-MINUTES_PER_DAY)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: -2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addMinutes(Int64.Min)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addSubMinutesSkipDST(): Unit {
        // 2022-03-27 02:00  ~ 2022-10-30 01:59
        // DST for London
        let london = TimeZone.load("Europe/London")
        // 1933-04-30 03:00 -09:30 ~ 1933-05-21 11:59 -09:30
        // DST for Honolulu
        let honolulu = TimeZone.load("Pacific/Honolulu")

        // "2022-10-30T01:59:00+01:00"
        var dateTime = DateTime.of(year: 2022, month: 10, dayOfMonth: 30, hour: 1, minute: 59, timeZone: london)
        @Expect(dateTime.addMinutes(1).toString(), "2022-10-30T01:00:00Z")
        @Expect(dateTime.addMinutes(1).addMinutes(-1), dateTime)
        @Expect(dateTime.addMinutes(2).addMinutes(-2), dateTime)

        // "1933-05-21T11:59:00-09:30"
        dateTime = DateTime.of(year: 1933, month: 5, dayOfMonth: 21, hour: 11, minute: 59, timeZone: honolulu)
        @Expect(dateTime.addMinutes(1).toString(), "1933-05-21T11:00:00-10:30")
        @Expect(dateTime.addMinutes(1).addMinutes(-1), dateTime)
        @Expect(dateTime.addMinutes(2).addMinutes(-2), dateTime)
    }
}
