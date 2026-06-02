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
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo2\;%pwd\zoneinfo1\;%pwd\zoneinfo\ %run %run_opt %output %run_utest_opt %run_args 

import std.time.*

@Test
class BaseTest {
    @TestCase
    func CheckUTC(): Unit {
        let timeZone = TimeZone.UTC
        @Expect(timeZone.toString(), "UTC")
        @Expect(timeZone.id, "UTC")
        let dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00Z")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "UTC")
        @Expect(dateTime.zoneOffset, Duration.Zero)
    }

    @TestCase
    func checkInit(): Unit {
        var timeZone = TimeZone("Asia/Nanjing",
            (25 * Duration.hour) + (59 * Duration.minute) + (59 * Duration.second) + (59 * Duration.millisecond))
        @Expect(timeZone.toString(), "Asia/Nanjing")
        @Expect(timeZone.id, "Asia/Nanjing")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+25:59:59")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Nanjing")
        @Expect(dateTime.zoneOffset, (25 * Duration.hour) + (59 * Duration.minute) + (59 * Duration.second))

        timeZone = TimeZone("Asia/Nanjing",
            (-24 * Duration.hour) - (59 * Duration.minute) - (59 * Duration.second) - (59 * Duration.millisecond))
        @Expect(timeZone.toString(), "Asia/Nanjing")
        @Expect(timeZone.id, "Asia/Nanjing")
        dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
            timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00-24:59:59")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Nanjing")
        @Expect(dateTime.zoneOffset, (-24 * Duration.hour) - (59 * Duration.minute) - (59 * Duration.second))

        timeZone = TimeZone("Asia/Nanjing", Duration.Zero)
        @Expect(timeZone.toString(), "Asia/Nanjing")
        @Expect(timeZone.id, "Asia/Nanjing")
        dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
            timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00Z")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Nanjing")
        @Expect(dateTime.zoneOffset, Duration.Zero)
    }

    @TestCase
    func CheckInitException(): Unit {
        try {
            TimeZone("Asia/Shanghai", 26 * Duration.hour)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid offset.")
        }

        try {
            TimeZone("Asia/Shanghai", -25 * Duration.hour)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid offset.")
        }
        try {
            TimeZone("", (7 * Duration.hour) + (30 * Duration.minute))
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }
    }

    @TestCase
    func TimeZoneCompare(): Unit {
        let timeZone1 = TimeZone.UTC
        let timeZone2 = TimeZone.load("UTC")
        @Expect(timeZone1 == timeZone2, true)
        @Expect(timeZone1 != timeZone2, false)

        let timeZone3 = TimeZone.load("Asia/Shanghai")
        @Expect(timeZone2 == timeZone3, false)
        @Expect(timeZone2 != timeZone3, true)
    }
}
