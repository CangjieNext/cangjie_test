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
public class StaticPropTest {
    let unixEpoch = DateTime.UnixEpoch
    @TestCase
    func checkUnixEpochProp(): Unit {
        @Expect(unixEpoch.year, 1970)
        @Expect(unixEpoch.monthValue, 1)
        @Expect(unixEpoch.dayOfMonth, 1)
        @Expect(unixEpoch.hour, 0)
        @Expect(unixEpoch.minute, 0)
        @Expect(unixEpoch.second, 0)
        @Expect(unixEpoch.nanosecond, 0)
        @Expect(unixEpoch.zone, TimeZone.UTC)
        @Expect(equalsDate(unixEpoch.date, (1970, January, 1)))
        @Expect(equalsTime(unixEpoch.time, (0, 0, 0)))
    }

    @TestCase
    func checkBaseTimeProp(): Unit {
        let utcTime = DateTime.ofUTC(year: 2024, month: 3, dayOfMonth: 1, hour: 12, minute: 59, second: 59,
            nanosecond: 100)
        @Expect(utcTime.year, 2024)
        @Expect(utcTime.month == March)
        @Expect(utcTime.monthValue, 3)
        @Expect(utcTime.dayOfMonth, 1)
        @Expect(utcTime.dayOfWeek == Friday)
        @Expect(utcTime.dayOfYear, 61)
        @Expect(utcTime.hour, 12)
        @Expect(utcTime.minute, 59)
        @Expect(utcTime.second, 59)
        @Expect(utcTime.nanosecond, 100)
        @Expect(equalsDate(utcTime.date, (2024, March, 1)))
        @Expect(equalsTime(utcTime.time, (12, 59, 59)))

        var time = DateTime.of(year: 2023, month: 1, dayOfMonth: 1, hour: 3, minute: 20, second: 59,
            nanosecond: 123456789, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(time.year, 2023)
        @Expect(time.month == January)
        @Expect(time.monthValue, 1)
        @Expect(time.dayOfMonth, 1)
        @Expect(time.dayOfWeek == Sunday)
        @Expect(time.dayOfYear, 1)
        @Expect(time.hour, 3)
        @Expect(time.minute, 20)
        @Expect(time.second, 59)
        @Expect(time.nanosecond, 123456789)
        @Expect(equalsDate(time.date, (2023, January, 1)))
        @Expect(equalsTime(time.time, (3, 20, 59)))

        time = DateTime.of(year: 2023, month: 4, dayOfMonth: 23, hour: 12, minute: 10, second: 59, nanosecond: 999999999,
            timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(time.year, 2023)
        @Expect(time.month == April)
        @Expect(time.monthValue, 4)
        @Expect(time.dayOfMonth, 23)
        @Expect(time.dayOfWeek == Sunday)
        @Expect(time.dayOfYear, 113)
        @Expect(time.hour, 12)
        @Expect(time.minute, 10)
        @Expect(time.second, 59)
        @Expect(time.nanosecond, 999999999)
        @Expect(equalsDate(time.date, (2023, April, 23)))
        @Expect(equalsTime(time.time, (12, 10, 59)))
    }

    @TestCase
    func checkDayofProp(): Unit {
        let leapMonth = DateTime.of(year: 2020, month: 2, dayOfMonth: 29)
        let normalMonth1 = DateTime.of(year: 2023, month: 2, dayOfMonth: 28)
        let normalMonth2 = DateTime.of(year: 2023, month: 3, dayOfMonth: 31)
        let leapYear = DateTime.of(year: 2020, month: 12, dayOfMonth: 31)
        let normalYear = DateTime.of(year: 2023, month: 12, dayOfMonth: 31)

        @Expect(unixEpoch.dayOfMonth, 1)
        @Expect(leapMonth.dayOfMonth, 29)
        @Expect(normalMonth1.dayOfMonth, 28)
        @Expect(normalMonth2.dayOfMonth, 31)
        @Expect(leapYear.dayOfMonth, 31)
        @Expect(normalYear.dayOfMonth, 31)

        @Expect(unixEpoch.dayOfWeek == Thursday)
        @Expect(leapMonth.dayOfWeek == Saturday)
        @Expect(normalMonth1.dayOfWeek == Tuesday)
        @Expect(normalMonth2.dayOfWeek == Friday)
        @Expect(leapYear.dayOfWeek == Thursday)
        @Expect(normalYear.dayOfWeek == Sunday)

        @Expect(unixEpoch.dayOfYear, 1)
        @Expect(leapMonth.dayOfYear, 60)
        @Expect(normalMonth1.dayOfYear, 59)
        @Expect(normalMonth2.dayOfYear, 90)
        @Expect(leapYear.dayOfYear, 366)
        @Expect(normalYear.dayOfYear, 365)
    }

    @TestCase
    func checkIsoWeekProp(): Unit {
        @Expect(unixEpoch.isoWeek[0], 1970)
        @Expect(unixEpoch.isoWeek[1], 1)

        let dateTime1 = DateTime.of(year: 2021, month: 1, dayOfMonth: 1)
        @Expect(dateTime1.isoWeek[0], 2020)
        @Expect(dateTime1.isoWeek[1], 53)

        let dateTime2 = DateTime.of(year: 2024, month: 12, dayOfMonth: 31)
        @Expect(dateTime2.isoWeek[0], 2025)
        @Expect(dateTime2.isoWeek[1], 1)
    }

    @TestCase
    func checkZoneInfo(): Unit {
        @Expect(unixEpoch.zone.id, TimeZone.UTC.id)
        @Expect(unixEpoch.zoneId == "UTC", true)

        let dateTime1 = DateTime.of(year: 2021, month: 1, dayOfMonth: 1)
        @Expect(dateTime1.zone.id, TimeZone.Local.id)

        let dateTime2 = DateTime.of(year: 2023, month: 4, dayOfMonth: 1, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime2.zone.id, TimeZone.load("Asia/Shanghai").id)
        @Expect(dateTime2.zoneId == "Asia/Shanghai")
        @Expect(dateTime2.zoneOffset.toHours(), 8)

        let dateTime3 = DateTime.of(year: 2023, month: 3, dayOfMonth: 1, timeZone: TimeZone.load("America/New_York"))
        @Expect(dateTime3.zone.id, TimeZone.load("America/New_York").id)
        @Expect(dateTime3.zoneId == "America/New_York")
        @Expect(dateTime3.zoneOffset.toHours(), -5)

        // test DST
        let dateTime4 = DateTime.of(year: 2023, month: 4, dayOfMonth: 1, timeZone: TimeZone.load("America/New_York"))
        @Expect(dateTime4.zoneOffset.toHours(), -4)
    }

    func equalsDate(v1: (Int64, Month, Int64), v2: (Int64, Month, Int64)): Bool {
        return v1[0] == v2[0] && v1[1] == v2[1] && v1[2] == v2[2]
    }
    func equalsTime(v1: (Int64, Int64, Int64), v2: (Int64, Int64, Int64)): Bool {
        return v1[0] == v2[0] && v1[1] == v2[1] && v1[2] == v2[2]
    }
}
