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
public class AddMonthsTest {
    @TestCase
    func addMonths(): Unit {
        let dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)

        var after = dateTime.addMonths(1)
        var expect = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 30)
        @Expect(after, expect)

        after = dateTime.addMonths(2)
        expect = DateTime.ofUTC(year: 2023, month: 5, dayOfMonth: 31)
        @Expect(after, expect)

        after = dateTime.addMonths(11)
        expect = DateTime.ofUTC(year: 2024, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        after = dateTime.addMonths(23)
        expect = DateTime.ofUTC(year: 2025, month: 2, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func subMonths(): Unit {
        let dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 30)

        var after = dateTime.addMonths(-1)
        var expect = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        after = dateTime.addMonths(-2)
        expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 30)
        @Expect(after, expect)

        after = dateTime.addMonths(-4)
        expect = DateTime.ofUTC(year: 2022, month: 11, dayOfMonth: 30)
        @Expect(after, expect)

        after = dateTime.addMonths(-37)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)
    }

    @TestCase
    func addAndSubMonth(): Unit {
        let dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        let after = dateTime.addMonths(-1).addMonths(1)
        let expect = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func addMonthsSkipDST(): Unit {
        // 2022-03-27 02:00  ~ 2022-10-30 01:59
        // DST for London
        var dateTime = DateTime.of(year: 2022, month: 2, dayOfMonth: 27, hour: 2, minute: 15,
            timeZone: TimeZone.load("Europe/London"))
        @Expect(dateTime.addMonths(1).toString(), "2022-03-27T02:15:00+01:00")
        @Expect(dateTime.addMonths(1).addMonths(-1), dateTime)

        dateTime = DateTime.of(year: 2022, month: 9, dayOfMonth: 30, hour: 2, minute: 15,
            timeZone: TimeZone.load("Europe/London"))
        @Expect(dateTime.addMonths(1).toString(), "2022-10-30T02:15:00Z")
        @Expect(dateTime.addMonths(1).addMonths(-1), dateTime)
    }

    @TestCase
    func addMonthsOutOfRange_1(): Unit {
        var datetime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31)
        try {
            datetime.addMonths(1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addMonths(Int64.Max)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addMonthsOutOfRange_2(): Unit {
        var datetime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            datetime.addMonths(-1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: -2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addMonths(Int64.Min)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
