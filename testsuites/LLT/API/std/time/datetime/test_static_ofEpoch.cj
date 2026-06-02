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
public class StaticofEpochTest {
    @TestCase
    func checkInputForOfEpoch(): Unit {
        try {
            DateTime.ofEpoch(second: 31536000, nanosecond: 31536000000000000)
            @Assert(false)
        } catch (exp1: IllegalArgumentException) {
            @Expect(exp1.message, "The nanosecond value should be in the range [0, 999,999,999].")
        }

        try {
            DateTime.ofEpoch(second: 31536000, nanosecond: -1)
            @Assert(false)
        } catch (exp2: IllegalArgumentException) {
            @Expect(exp2.message, "The nanosecond value should be in the range [0, 999,999,999].")
        }

        try {
            DateTime.ofEpoch(second: Int64.Max, nanosecond: 1000000)
            @Assert(false)
        } catch (exp1: ArithmeticException) {
            @Expect(exp1.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.ofEpoch(second: Int64.Min, nanosecond: 1000000)
            @Assert(false)
        } catch (exp2: ArithmeticException) {
            @Expect(exp2.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            DateTime.ofEpoch(second: 31622462264505600, nanosecond: 1000000)
            @Assert(false)
        } catch (exp3: ArithmeticException) {
            @Expect(exp3.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func compareOfEpochAndFromUnixTimeStamp(): Unit {
        var dateTime = DateTime.of(year: 1900, month: 1, dayOfMonth: 2, hour: 3, minute: 45, second: 6, nanosecond: 100,
            timeZone: TimeZone.UTC)
        var duration = dateTime - DateTime.UnixEpoch
        var seconds = duration.toSeconds() - 1 // nanoseconds must > 0
        var nanoseconds = (duration - Duration.second * seconds).toNanoseconds()
        let dateTime1 = DateTime.ofEpoch(second: seconds, nanosecond: nanoseconds)
        let dateTime2 = DateTime.fromUnixTimeStamp(duration)
        @Expect(dateTime1, dateTime2)

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 1, hour: 16, minute: 0, second: 0,
            nanosecond: 999999999, timeZone: TimeZone.load("Asia/Shanghai"))
        duration = Duration.second * 1680336000 + Duration.nanosecond * 999999999
        let dateTime3 = DateTime.ofEpoch(second: 1680336000, nanosecond: 999999999)
        let dateTime4 = DateTime.fromUnixTimeStamp(duration)
        @Expect(dateTime3, dateTime)
        @Expect(dateTime4, dateTime)
    }
}
