/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.runtime.*

var cnt1 = 0
var cnt2 = 0
var cnt3 = 0
var cnt4 = 0

@Test
class Test_start_count_period {
    @TestCase
    func test_start_count_period_01(): Unit {
        var timer = Timer.repeatTimes(5, Duration.millisecond * 100, Duration.millisecond * 100, {=> cnt1 += 1})
        sleep(Duration.millisecond * 550)
        @Expect(cnt1, 5)
    }

    @TestCase
    func test_start_count_period_02(): Unit {
        var timer = Timer.repeatTimes(5, Duration.millisecond * -100, Duration.millisecond * 100, {=> cnt2 += 1})
        sleep(Duration.millisecond * 500)
        @Expect(cnt2, 5)
    }

    @TestCase
    func test_start_count_period_03(): Unit {
        var timer = Timer.repeatTimes(5, Duration.Max, Duration.millisecond * 100, {=> cnt3 += 1})
        sleep(Duration.millisecond * 500)
        @Expect(cnt3, 0)
    }

    @TestCase
    func test_start_count_period_04(): Unit {
        var flag = false
        try {
            var timer = Timer.repeatTimes(0, Duration.Zero, Duration.millisecond * 100, {=> cnt3 += 1})
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message, "Count cannot be less than or equal to 0.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_start_count_period_05(): Unit {
        var flag = false
        try {
            var timer = Timer.repeatTimes(-1, Duration.Zero, Duration.millisecond * 100, {=> cnt3 += 1})
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message, "Count cannot be less than or equal to 0.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_start_count_period_06(): Unit {
        var flag = false
        try {
            var timer = Timer.repeatTimes(5, Duration.Zero, Duration.Zero, {=> cnt3 += 1})
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message, "Interval cannot be less than or equal to Duration.Zero.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_start_count_period_07(): Unit {
        var flag = false
        try {
            var timer = Timer.repeatTimes(5, Duration.Zero, Duration.nanosecond * -1, {=> cnt3 += 1})
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message, "Interval cannot be less than or equal to Duration.Zero.")
        }
        @Expect(flag, true)
    }
}
