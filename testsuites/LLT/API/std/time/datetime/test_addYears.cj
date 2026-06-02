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
public class AddYearsTest {
    @TestCase
    func addYears(): Unit {
        let datetime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)

        var after = datetime.addYears(1)
        var expect = DateTime.ofUTC(year: 2021, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        after = datetime.addYears(4)
        expect = DateTime.ofUTC(year: 2024, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        after = datetime.addYears(80)
        expect = DateTime.ofUTC(year: 2100, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        after = datetime.addYears(380)
        expect = DateTime.ofUTC(year: 2400, month: 2, dayOfMonth: 29)
        @Expect(after, expect)
    }

    @TestCase
    func subYears(): Unit {
        let datetime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)

        var after = datetime.addYears(-1)
        var expect = DateTime.ofUTC(year: 2019, month: 2, dayOfMonth: 28)
        @Expect(after, expect)

        after = datetime.addYears(-4)
        expect = DateTime.ofUTC(year: 2016, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        after = datetime.addYears(-20)
        expect = DateTime.ofUTC(year: 2000, month: 2, dayOfMonth: 29)
        @Expect(after, expect)

        after = datetime.addYears(-120)
        expect = DateTime.ofUTC(year: 1900, month: 2, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func addAndSubYears(): Unit {
        let datetime = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        let after = datetime.addYears(-1).addYears(1)
        let expect = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 28)
        @Expect(after, expect)
    }

    @TestCase
    func addSubYearsSkipDST(): Unit {
        // 1933-04-30 02:00 -09:30 ~ 1933-05-21 11:59 -09:30
        // DST for Honolulu
        let dateTime = DateTime.of(year: 1932, month: 4, dayOfMonth: 30, hour: 2,
            timeZone: TimeZone.load("Pacific/Honolulu"))
        @Expect(dateTime.addYears(1).toString(), "1933-04-30T03:00:00-09:30")
        let expect = DateTime.of(year: 1932, month: 4, dayOfMonth: 30, hour: 3,
            timeZone: TimeZone.load("Pacific/Honolulu"))
        @Expect(dateTime.addYears(1).addYears(-1), expect)
    }

    @TestCase
    func addSubYearsOutOfRange_1(): Unit {
        var datetime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31)
        try {
            datetime.addYears(1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: 2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addYears(Int64.Max)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func addYearsOutOfRange_2(): Unit {
        var datetime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            datetime.addYears(-1)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        datetime = DateTime.ofUTC(year: -2023, month: 3, dayOfMonth: 31)
        try {
            datetime.addYears(Int64.Min)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
