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
public class UnixTimeStampTest {
    @TestCase
    func toUnixTimeStamp(): Unit {
        var dateTime = DateTime.UnixEpoch
        @Expect(dateTime.toUnixTimeStamp().toNanoseconds(), 0)

        dateTime = DateTime.ofUTC(year: 1960, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        @Expect(dateTime.toUnixTimeStamp().toNanoseconds(), -315619200000000000)

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 3, hour: 10, minute: 30, second: 30,
            nanosecond: 123456789, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime.toUnixTimeStamp().toNanoseconds(), 1680489030123456789)

        dateTime = DateTime.ofUTC(year: 9999, month: 1, dayOfMonth: 1)
        @Expect(dateTime.toUnixTimeStamp().toSeconds(), 253370764800)
    }
    @TestCase
    func fromUnixTimeStamp(): Unit {
        let dateTime = DateTime.of(year: 1900, month: 1, dayOfMonth: 2, hour: 3, minute: 45, second: 6, nanosecond: 789,
            timeZone: TimeZone.UTC)
        let duration = dateTime - DateTime.UnixEpoch // d < 0
        @Expect(dateTime == DateTime.fromUnixTimeStamp(duration))

        try {
            DateTime.fromUnixTimeStamp(Duration.Max)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        @Expect(dateTime == DateTime.fromUnixTimeStamp(duration))

        try {
            DateTime.fromUnixTimeStamp(Duration.Min)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
