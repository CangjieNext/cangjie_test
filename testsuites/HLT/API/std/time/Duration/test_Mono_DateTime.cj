/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.time.*
import std.collection.*
import std.sync.*

@Test
class DateTime_new_Test01 {
    let durMax = Duration.Max
    let durMin = Duration.Min
    let time0 = DateTime.now()

    @TestCase
    func datetimesub_case01(): Unit {
        let time1 = DateTime.of(year: 999999999, month: January, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0)
        let time2 = DateTime.of(year: -999999999, month: January, dayOfMonth: 1, hour: 9, minute: 0, second: 0,
            nanosecond: 0)
        try {
            let dur = time1 - time0
        } catch (e: ArithmeticException) {
            @Expect(false)
        }
        try {
            let dur2 = time2 - time0
        } catch (e: ArithmeticException) {
            @Expect(false)
        }
    }

    @TestCase
    func durationadd_case02(): Unit {
        try {
            let time3 = time0 + durMax
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        try {
            let time4 = time0 + durMin
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func durationsub_case03(): Unit {
        try {
            let time5 = time0 - durMin
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        try {
            let time5 = time0 - durMax
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func fromUnixTimeStamp_case04(): Unit {
        try {
            let time6 = DateTime.fromUnixTimeStamp(durMax)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
        try {
            let time7 = DateTime.fromUnixTimeStamp(durMin)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
