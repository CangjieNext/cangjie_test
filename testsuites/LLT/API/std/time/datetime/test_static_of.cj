/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo\ %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.math.*

@Test
public class StaticOfTest {
    @TestCase
    func createDatetimeByOf(): Unit {
        var time = DateTime.of(year: 999999999, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(time.year, 999999999)
        @Expect(time.monthValue, 12)
        @Expect(time.dayOfMonth, 31)
        @Expect(time.hour, 23)
        @Expect(time.minute, 59)
        @Expect(time.second, 59)
        @Expect(time.nanosecond, 999999999)
        @Expect(time.zoneId, "Asia/Shanghai")

        time = DateTime.of(year: -999999999, month: 1, dayOfMonth: 1, timeZone: TimeZone.UTC)
        @Expect(time.year, -999999999)
        @Expect(time.monthValue, 1)
        @Expect(time.dayOfMonth, 1)
        @Expect(time.hour, 0)
        @Expect(time.minute, 0)
        @Expect(time.second, 0)
        @Expect(time.nanosecond, 0)
        @Expect(time.zone, TimeZone.UTC)

        time = DateTime.of(year: 999999999, month: December, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(time.year, 999999999)
        @Expect(time.monthValue, 12)
        @Expect(time.dayOfMonth, 31)
        @Expect(time.hour, 23)
        @Expect(time.minute, 59)
        @Expect(time.second, 59)
        @Expect(time.nanosecond, 999999999)
        @Expect(time.zoneId, "Asia/Shanghai")

        time = DateTime.of(year: -999999999, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        @Expect(time.year, -999999999)
        @Expect(time.monthValue, 1)
        @Expect(time.dayOfMonth, 1)
        @Expect(time.hour, 0)
        @Expect(time.minute, 0)
        @Expect(time.second, 0)
        @Expect(time.nanosecond, 0)
        @Expect(time.zone, TimeZone.UTC)
    }

    @TestCase
    func createDatetimeByDST(): Unit {
        let datetime1 = DateTime.of(year: 2023, month: 11, dayOfMonth: 5, hour: 2,
            timeZone: TimeZone.load("America/New_York"))
        println(datetime1.zoneOffset.toHours())

        let datetime2 = DateTime.of(year: 2023, month: 11, dayOfMonth: 5, hour: 1, minute: 59, second: 59,
            timeZone: TimeZone.load("America/New_York"))
        @Expect(datetime2.zoneOffset.toHours() - datetime1.zoneOffset.toHours() == 1)
    }

    @TestCase
    func dateTimeJumpByDST(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 3, dayOfMonth: 12, hour: 2,
            timeZone: TimeZone.load("America/New_York"))
        @Expect(dateTime.toString(), "2023-03-12T03:00:00-04:00")

        dateTime = DateTime.of(year: 2023, month: 3, dayOfMonth: 12, hour: 2, minute: 59, second: 59,
            timeZone: TimeZone.load("America/New_York"))
        @Expect(dateTime.toString(), "2023-03-12T03:59:59-04:00")
    }

    @TestCase
    func checkInputForOfForYear(): Unit {
        try {
            DateTime.of(year: 1000000000, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Year value must be in [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.of(year: 1000000000, month: January, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Year value must be in [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.of(year: -1000000000, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Year value must be in [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.of(year: -1000000000, month: January, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Year value must be in [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func checkInputForOfForMonth(): Unit {
        try {
            DateTime.of(year: 999999999, month: 0, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Month value must be in the range [1, 12].")
        }

        try {
            DateTime.of(year: 999999999, month: 13, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Month value must be in the range [1, 12].")
        }
    }
    @TestCase
    func checkInputForOfForDay(): Unit {
        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 29, hour: 23, minute: 59, second: 59, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Day of February in 2001 must be in [1, 28].")
        }

        try {
            DateTime.of(year: 2004, month: 2, dayOfMonth: 29, hour: 23, minute: 59, second: 59, nanosecond: 999999999)
        } catch (e: IllegalArgumentException) {
            @Assert(false)
        }

        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 29, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Day of February in 2001 must be in [1, 28].")
        }

        try {
            DateTime.of(year: 2004, month: February, dayOfMonth: 29, hour: 23, minute: 59, second: 59,
                nanosecond: 999999999)
        } catch (e: IllegalArgumentException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForOfForhour(): Unit {
        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 24, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Hour must be in [0, 23].")
        }

        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: -1, minute: 59, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Hour must be in [0, 23].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 24, minute: 59, second: 59, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Hour must be in [0, 23].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: -1, minute: 59, second: 59, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Hour must be in [0, 23].")
        }
    }

    @TestCase
    func checkInputForOfForMinute(): Unit {
        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: 60, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Minute must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: -1, second: 59,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Minute must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: 60, second: 59, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Minute must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: -1, second: 59, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Minute must be in [0, 59].")
        }
    }

    @TestCase
    func checkInputForOfForSecond(): Unit {
        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: 59, second: 60,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Second must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: 59, second: -1,
                nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Second must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: 60, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Second must be in [0, 59].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: -1, nanosecond: 999999999)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Second must be in [0, 59].")
        }
    }

    @TestCase
    func checkInputForOfForNanosecond(): Unit {
        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: 59, second: 59,
                nanosecond: 1000000000)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Nanosecond must be in [0, 999,999,999].")
        }

        try {
            DateTime.of(year: 2001, month: February, dayOfMonth: 28, hour: 23, minute: 59, second: 59,
                nanosecond: 1000000000)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Nanosecond must be in [0, 999,999,999].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: 59, nanosecond: -1000000000)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Nanosecond must be in [0, 999,999,999].")
        }

        try {
            DateTime.of(year: 2001, month: 2, dayOfMonth: 28, hour: 23, minute: 59, second: 59, nanosecond: -1000000000)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Nanosecond must be in [0, 999,999,999].")
        }
    }

    @TestCase
    func createDateTimeInDST(): Unit {
        // 2022 03-27 01:00 UTC ~ 2022-10-30 00:59 UTC
        // 2022-03-27 02:00 +01:00 ~ 2022-10-30 01:59 +01:00
        // DST for London
        let london = TimeZone.load("Europe/London")
        // 1933 04-30 12:30 UTC ~ 1933-05-21 21:30 UTC
        // 1933-04-30 03:00 -09:30 ~ 1933-05-21 11:59 -09:30
        // DST for Honolulu
        let honolulu = TimeZone.load("Pacific/Honolulu")

        var dateTime = DateTime.of(year: 2022, month: 3, dayOfMonth: 27, hour: 1, minute: 0, timeZone: london)
        @Expect(dateTime.toString(), "2022-03-27T02:00:00+01:00")

        dateTime = DateTime.of(year: 2022, month: 10, dayOfMonth: 30, hour: 1, minute: 59, timeZone: london)
        @Expect(dateTime.toString(), "2022-10-30T01:59:00+01:00")

        dateTime = DateTime.of(year: 2022, month: 10, dayOfMonth: 30, hour: 2, timeZone: london)
        @Expect(dateTime.toString(), "2022-10-30T02:00:00Z")

        dateTime = DateTime.of(year: 1933, month: 4, dayOfMonth: 30, hour: 2, timeZone: honolulu)
        @Expect(dateTime.toString(), "1933-04-30T03:00:00-09:30")

        dateTime = DateTime.of(year: 1933, month: 5, dayOfMonth: 21, hour: 11, minute: 59, timeZone: honolulu)
        @Expect(dateTime.toString(), "1933-05-21T11:59:00-09:30")

        dateTime = DateTime.of(year: 1933, month: 5, dayOfMonth: 21, hour: 12, minute: 0, timeZone: honolulu)
        @Expect(dateTime.toString(), "1933-05-21T12:00:00-10:30")
    }
}
