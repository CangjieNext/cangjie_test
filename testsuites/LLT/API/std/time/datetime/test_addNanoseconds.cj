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
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo\%run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.math.*

@Test
public class AddNanosecondsTest {
    @TestCase
    func addNanoseconds(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        var after = dateTime.addNanoseconds(NANOSECONDS_PER_DAY)
        var expect = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        after = dateTime.addNanoseconds(NANOSECONDS_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        after = dateTime.addNanoseconds(NANOSECONDS_PER_DAY)
        expect = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        @Expect(after, expect)
    }

    @TestCase
    func subNanoseconds(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 1)
        var after = dateTime.addNanoseconds(-NANOSECONDS_PER_DAY)
        var expect = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2020, month: 3, dayOfMonth: 1)
        after = dateTime.addNanoseconds(-NANOSECONDS_PER_DAY)
        expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        dateTime = DateTime.ofUTC(year: 2024, month: 1, dayOfMonth: 1)
        after = dateTime.addNanoseconds(-NANOSECONDS_PER_DAY)
        expect = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        @Expect(after, expect)
    }

    @TestCase
    func addAndSubNanoseconds(): Unit {
        let dateTime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        let after = dateTime.addNanoseconds(-NANOSECONDS_PER_DAY).addNanoseconds(NANOSECONDS_PER_DAY)
        @Expect(dateTime, after)
    }

    @TestCase
    func addSubNanosecondsSkipDST(): Unit {
        // 1933-04-30 02:00 -09:30 ~ 1933-05-21 11:59 -09:30
        // DST for Honolulu
        let datetime = DateTime.of(year: 1933, month: 4, dayOfMonth: 30, hour: 1, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: TimeZone.load("Pacific/Honolulu"))

        @Expect(datetime.addNanoseconds(1).toString(), "1933-04-30T03:00:00-09:30")
        @Expect(datetime.addNanoseconds(2).addNanoseconds(-2), datetime)
    }

    @TestCase
    func addNanosecondsOutOfRange_1(): Unit {
        var datetime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31)
        try {
            datetime.addNanoseconds(NANOSECONDS_PER_DAY)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addNanoseconds(Int64.Max)
        } catch (e: ArithmeticException) {
            @Expect(false)
        }

        datetime = DateTime.of(year: 999999999, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        try {
            datetime.addNanoseconds(1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addNanosecondsOutOfRange_2(): Unit {
        var datetime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            datetime.addNanoseconds(-1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: -2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addNanoseconds(Int64.Min)
        } catch (e: ArithmeticException) {
            @Expect(false)
        }
    }
}
