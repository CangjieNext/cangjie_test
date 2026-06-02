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
public class AddWeeksTest {
    @TestCase
    func addWeeks(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 22)
        var after = dateTime.addWeeks(1)
        var expect = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 22)
        after = dateTime.addWeeks(1)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)
    }

    @TestCase
    func subWeeks(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        var after = dateTime.addWeeks(-1)
        var expect = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 22)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addWeeks(-1)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 22)
        @Expect(after, expect)
    }

    @TestCase
    func addAndSubWeeks(): Unit {
        let dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        let after = dateTime.addWeeks(-1).addWeeks(1)
        @Expect(dateTime, after)
    }

    @TestCase
    func addSubWeeksSkipDST(): Unit {
        // 1933-04-30 02:00 -09:30 ~ 1933-05-21 11:59 -09:30
        // DST for Honolulu
        var dateTime = DateTime.of(year: 1933, month: 4, dayOfMonth: 23, hour: 2,
            timeZone: TimeZone.load("Pacific/Honolulu"))
        @Expect(dateTime.addWeeks(1).toString(), "1933-04-30T03:00:00-09:30")

        let london = TimeZone.load("Europe/London")
        dateTime = DateTime.of(year: 2022, month: 3, dayOfMonth: 20, hour: 2, minute: 15, timeZone: london)
        @Expect(dateTime.addWeeks(1).toString(), "2022-03-27T02:15:00+01:00")

        dateTime = DateTime.of(year: 2022, month: 10, dayOfMonth: 29, hour: 1, timeZone: london)
        @Expect(dateTime.addWeeks(1).toString(), "2022-11-05T01:00:00Z")
    }

    @TestCase
    func addSubWeeksOutOfRange_1(): Unit {
        var datetime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31)
        try {
            datetime.addWeeks(1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addWeeks(Int64.Max)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addSecondsOutOfRange_2(): Unit {
        var datetime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            datetime.addWeeks(-1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: -2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addWeeks(Int64.Min)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
