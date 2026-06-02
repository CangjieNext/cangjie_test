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

func checkTimeInOtherTimeZone(dateTime: DateTime) {
    @Expect(dateTime.inUTC() == dateTime)
    @Expect(dateTime.inLocal() == dateTime)
    @Expect(dateTime.inTimeZone(TimeZone.load("Asia/Shanghai")) == dateTime)
    @Expect(dateTime.inTimeZone(TimeZone.load("America/New_York")) == dateTime)
    @Expect(dateTime.inUTC().inLocal() == dateTime)
}

@Test
public class DateTimeInOtherTimeZoneTest {
    @TestCase
    func switchTimeZone(): Unit {
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 123456789, timeZone: TimeZone.load("America/New_York"))
        checkTimeInOtherTimeZone(dateTime)

        dateTime = DateTime.now()
        checkTimeInOtherTimeZone(dateTime)

        dateTime = DateTime.parse("2023-4-3T9:51:44:123456789 +08:00", "yyyy-M-dTH:mm:ss:SSS OO")
        checkTimeInOtherTimeZone(dateTime)

        dateTime = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, timeZone: TimeZone.load("Asia/Shanghai"))
        checkTimeInOtherTimeZone(dateTime)
    }

    @TestCase
    func timeZoneSwitchException_1(): Unit {
        let dateTime1 = DateTime.of(year: 999999999, month: 12, dayOfMonth: 31, hour: 23,
            timeZone: TimeZone.load("America/New_York"))
        let dateTime2 = DateTime.of(year: -999999999, month: 1, dayOfMonth: 1, timeZone: TimeZone.load("Asia/Shanghai"))
        try {
            dateTime1.inUTC()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        try {
            dateTime2.inUTC()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func timeZoneSwitchException_2(): Unit {
        let dateTime1 = DateTime.ofUTC(year: 999999999, month: 12, dayOfMonth: 31, hour: 23)
        let dateTime2 = DateTime.ofUTC(year: -999999999, month: 1, dayOfMonth: 1, hour: 1)
        try {
            dateTime1.inTimeZone(TimeZone.load("Asia/Shanghai"))
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        try {
            dateTime2.inTimeZone(TimeZone.load("America/New_York"))
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
