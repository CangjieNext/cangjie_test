/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_datetime_pub.cj
// EXEC: %compiler %cmp_opt %f test_datetime_pub.cj %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.math.*

@Test
public class OperatorTest {
    @TestCase
    func operatorAdd(): Unit {
        var dateTime = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)

        var expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        @Expect(dateTime + Duration.nanosecond, expect)

        expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 999999999)
        @Expect(dateTime + Duration.second, expect)

        expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 59,
            nanosecond: 999999999)
        @Expect(dateTime + Duration.minute, expect)

        expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 59, second: 59,
            nanosecond: 999999999)
        @Expect(dateTime + Duration.hour, expect)

        expect = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        @Expect(dateTime + Duration.day, expect)

        var duration = Duration.nanosecond * Int64.Max
        expect = DateTime.ofUTC(year: 2262, month: 4, dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775807)
        @Expect(DateTime.UnixEpoch + duration, expect)

        duration = Duration.nanosecond * Int64.Min
        expect = DateTime.ofUTC(year: 1677, month: 9, dayOfMonth: 21, hour: 0, minute: 12, second: 43,
            nanosecond: 145224192)
        @Expect(DateTime.UnixEpoch + duration, expect)
    }

    @TestCase
    func operatorAddOutOfRange(): Unit {
        let dateTime = DateTime.ofUTC(year: MAX_YEAR, month: 12, dayOfMonth: 31, hour: 23)
        try {
            dateTime + Duration.hour
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.of(year: 2023, month: 4, dayOfMonth: 20, nanosecond: 999999999) + Duration.Max
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func operatorSubDuration(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)

        var expect = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        @Expect(dateTime - Duration.nanosecond, expect)

        expect = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59, nanosecond: 0)
        @Expect(dateTime - Duration.second, expect)

        expect = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 0, nanosecond: 0)
        @Expect(dateTime - Duration.minute, expect)

        expect = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 0, second: 0, nanosecond: 0)
        @Expect(dateTime - Duration.hour, expect)

        expect = DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0)
        @Expect(dateTime - Duration.day, expect)

        var duration = Duration.nanosecond * Int64.Max
        expect = DateTime.ofUTC(year: 1677, month: 9, dayOfMonth: 21, hour: 0, minute: 12, second: 43,
            nanosecond: 145224193)
        @Expect(DateTime.UnixEpoch - duration, expect)

        duration = Duration.nanosecond * Int64.Min
        expect = DateTime.ofUTC(year: 2262, month: 4, dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775808)
        @Expect(DateTime.UnixEpoch - duration, expect)
    }

    @TestCase
    func operatorSubDurationOutOfRange(): Unit {
        let dateTime = DateTime.ofUTC(year: MIN_YEAR, month: 1, dayOfMonth: 1)
        try {
            dateTime - Duration.nanosecond
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.of(year: 2023, month: 4, dayOfMonth: 20) - Duration.Max
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func operatorSubDateTime(): Unit {
        var dateTime1 = DateTime.ofUTC(year: 2024, month: 3, dayOfMonth: 1)
        var dateTime2 = DateTime.ofUTC(year: 2024, month: 2, dayOfMonth: 28)
        let expect = Duration.day * 2
        @Expect(dateTime1 - dateTime2, expect)

        dateTime1 = DateTime.ofUTC(year: 2262, month: 4, dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775807)
        @Expect((dateTime1 - DateTime.UnixEpoch).toNanoseconds(), Int64.Max)

        dateTime2 = DateTime.ofUTC(year: 1677, month: 9, dayOfMonth: 21, hour: 0, minute: 12, second: 43,
            nanosecond: 145224192)
        @Expect((dateTime2 - DateTime.UnixEpoch).toNanoseconds(), Int64.Min)
    }
}
