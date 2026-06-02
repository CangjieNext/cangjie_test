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

@Test
public class AddDaysTest {
    @TestCase
    func addOneDay(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        var after = dateTime.addDays(1)
        var expect = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        after = dateTime.addDays(1)
        expect = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(1)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(1)
        expect = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func subtractOneDay(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        var after = dateTime.addDays(-1)
        var expect = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        after = dateTime.addDays(-1)
        expect = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(-1)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        after = dateTime.addDays(-1)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)
    }

    @TestCase
    func add400YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        var after = dateTime.addDays(DAYS_PER_400YEARS)
        var expect = DateTime.ofUTC(year: 2420, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2400, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2420, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2400, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2500, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2499, month: 2, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func sub400YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2420, month: 2, dayOfMonth: 28)
        var after = dateTime.addDays(-DAYS_PER_400YEARS)
        var expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2400, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2420, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(-DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2400, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(-DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2500, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2499, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_400YEARS)
        expect = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func add100YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 1999, month: 2, dayOfMonth: 28)
        var after = dateTime.addDays(DAYS_PER_100YEARS)
        var expect = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 27)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 27)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2001, month: 3, dayOfMonth: 1)
        after = dateTime.addDays(DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2101, month: 3, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func sub100YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 27)
        var after = dateTime.addDays(-DAYS_PER_100YEARS)
        var expect = DateTime.ofUTC(year: 1999, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 27)
        after = dateTime.addDays(-DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2101, month: 3, dayOfMonth: 1)
        after = dateTime.addDays(-DAYS_PER_100YEARS)
        expect = DateTime.ofUTC(year: 2001, month: 3, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func add4YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 28)
        var after = dateTime.addDays(DAYS_PER_4YEARS)
        var expect = DateTime.ofUTC(year: 2103, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2104, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2101, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2105, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 1999, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2003, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2004, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2001, month: 3, dayOfMonth: 1)
        after = dateTime.addDays(DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2005, month: 3, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func sub4YearsDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2103, month: 3, dayOfMonth: 1)
        var after = dateTime.addDays(-DAYS_PER_4YEARS)
        var expect = DateTime.ofUTC(year: 2099, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2104, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(-DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2105, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2101, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2003, month: 2, dayOfMonth: 28)
        after = dateTime.addDays(-DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 1999, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2004, month: 2, dayOfMonth: 29)
        after = dateTime.addDays(-DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2005, month: 3, dayOfMonth: 1)
        after = dateTime.addDays(-DAYS_PER_4YEARS)
        expect = DateTime.ofUTC(year: 2001, month: 3, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func addDays(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 10, dayOfMonth: 16)
        var after = dateTime.addDays(10)
        var expect = DateTime.ofUTC(year: 2023, month: 10, dayOfMonth: 26)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2023, month: 10, dayOfMonth: 16)
        after = dateTime.addDays(100)
        expect = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 24)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2023, month: 10, dayOfMonth: 16)
        after = dateTime.addDays(1000)
        expect = DateTime.ofUTC(year: 2026, month: 7, dayOfMonth: 12)

        @Expect(after, expect)
        dateTime = DateTime.ofUTC(year: 2023, month: 10, dayOfMonth: 16)
        after = dateTime.addDays(10000)
        expect = DateTime.ofUTC(year: 2051, month: 3, dayOfMonth: 3)
        @Expect(after, expect)
    }

    @TestCase
    func addDaysOutOfRange(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            dateTime.addDays(MAX_YEAR * DAYS_OF_LEAP_YEAR)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        dateTime = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1)
        try {
            dateTime.addDays((MIN_YEAR - 2023) * DAYS_OF_LEAP_YEAR)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addAndSubDaySkipDst(): Unit {
        // 2022-03-27 02:00 ~ 2022-10-30 01:59
        // DST for London
        let london = TimeZone.load("Europe/London")
        var dateTime = DateTime.of(year: 2022, month: 3, dayOfMonth: 26, hour: 1, minute: 15, second: 0, nanosecond: 0,
            timeZone: london)
        @Expect(dateTime.addDays(1).toString(), "2022-03-27T02:15:00+01:00")
        @Expect(dateTime.addDays(1).addDays(-1).toString(), "2022-03-26T02:15:00Z")

        dateTime = DateTime.of(year: 2022, month: 3, dayOfMonth: 26, hour: 3, minute: 0, second: 0, nanosecond: 0,
            timeZone: london)
        @Expect(dateTime.addDays(1).toString(), "2022-03-27T03:00:00+01:00")

        dateTime = DateTime.of(year: 2022, month: 10, dayOfMonth: 29, hour: 1, minute: 0, second: 0, nanosecond: 0,
            timeZone: london)
        @Expect(dateTime.addDays(1).toString(), "2022-10-30T01:00:00+01:00")
    }
}
