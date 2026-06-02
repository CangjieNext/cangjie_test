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

@Test
public class CompareTest {
    @TestCase
    func comPareEq(): Unit {
        let dateTime = DateTime.ofEpoch(second: 0, nanosecond: 0)
        @Expect(dateTime == DateTime.UnixEpoch)
        @Expect(dateTime.compare(DateTime.UnixEpoch), Ordering.EQ)

        var dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        var dateTime2 = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, hour: 8,
            timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime1 == dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.EQ)

        dateTime1 = DateTime.now()
        dateTime2 = DateTime.fromUnixTimeStamp(dateTime1.toUnixTimeStamp())
        @Expect(dateTime1 == dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.EQ)
    }

    @TestCase
    func comPareNotEq(): Unit {
        let dateTime = DateTime.ofEpoch(second: 10, nanosecond: 20)
        @Expect(dateTime != DateTime.UnixEpoch)

        var dateTime1 = DateTime.now()
        var dateTime2 = DateTime.now() + Duration.second
        @Expect(dateTime1 != dateTime2)

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 11, minute: 44, second: 30, nanosecond: 123456789)
        dateTime2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 11, minute: 44, second: 30, nanosecond: 123456788)
        @Expect(dateTime1 != dateTime2)
    }

    @TestCase
    func comPareGTOrEQ(): Unit {
        var dateTime1 = DateTime.ofEpoch(second: 1680336000, nanosecond: 999999999)
        var dateTime2 = DateTime.ofEpoch(second: 1680336000, nanosecond: 999999998)
        @Expect(dateTime1 >= dateTime2)
        @Expect(dateTime1 > dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.GT)

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        dateTime2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 9, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        var duration = Duration.nanosecond
        @Expect(dateTime1 >= dateTime2)
        @Expect(dateTime1 >= dateTime2 - duration)
        @Expect(dateTime1 + duration >= dateTime2)
        @Expect(dateTime1 > dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.GT)
        @Expect(dateTime1 > dateTime2 - duration)
        @Expect(dateTime1 + duration > dateTime2)
        @Expect((dateTime1 + duration).compare(dateTime2), Ordering.GT)
    }

    @TestCase
    func comPareLTOrEQ(): Unit {
        var dateTime1 = DateTime.now()
        sleep(Duration.nanosecond)
        var dateTime2 = DateTime.now()
        @Expect(dateTime1 < dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.LT)

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 9, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        dateTime2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        var duration = Duration.nanosecond
        @Expect(dateTime1 <= dateTime2)
        @Expect(dateTime1 <= dateTime2 - duration)
        @Expect(dateTime1 + duration <= dateTime2)
        @Expect(dateTime1 < dateTime2)
        @Expect(dateTime1.compare(dateTime2), Ordering.LT)
        @Expect(dateTime1 < dateTime2 + duration)
        @Expect(dateTime1.compare( dateTime2 + duration), Ordering.LT)
        @Expect(dateTime1 - duration < dateTime2)
        @Expect((dateTime1 - duration).compare(dateTime2), Ordering.LT)
    }

    @TestCase
    func comPareHashCode(): Unit {
        var dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 3, hour: 11, minute: 14, second: 30,
            nanosecond: 0)
        var dateTime2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 3, hour: 11, minute: 14, second: 30,
            nanosecond: 0)
        @Expect(dateTime1.hashCode() == dateTime2.hashCode())

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 3)
        dateTime2 = DateTime.of(year: 2023, month: 4, dayOfMonth: 3, hour: 8, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime1.hashCode() == dateTime2.hashCode())

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 3, hour: 11, minute: 14, second: 30, nanosecond: 0)
        dateTime2 = dateTime1.inLocal()
        @Expect(dateTime1.hashCode() == dateTime2.hashCode())

        dateTime1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 3)
        dateTime2 = DateTime.of(year: 2023, month: 4, dayOfMonth: 3, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime1.hashCode() != dateTime2.hashCode())
    }
}
