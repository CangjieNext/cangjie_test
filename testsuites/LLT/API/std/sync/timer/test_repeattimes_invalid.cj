/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Class Timer.
 * Test API:
 *          public static func repeatTimes(count: Int64, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*

@Test
class TestRepeatTimes {
    @TestCase
    func testCountZero(): Unit {
        try {
            Timer.repeatTimes(0, Duration.Zero, Duration.second, {=>})
        } catch (e: IllegalArgumentException) {
            return // expect exception
        }
        @Expect(false)
    }

    @TestCase
    func testCountNegative(): Unit {
        try {
            Timer.repeatTimes(-1, Duration.Zero, Duration.second, {=>})
        } catch (e: IllegalArgumentException) {
            return // expect exception
        }
        @Expect(false)
    }

    @TestCase
    func testIntervalZero(): Unit {
        try {
            Timer.repeatTimes(1, Duration.Zero, Duration.Zero, {=>})
        } catch (e: IllegalArgumentException) {
            return // expect exception
        }
        @Expect(false)
    }

    @TestCase
    func testIntervalNegative(): Unit {
        try {
            Timer.repeatTimes(1, Duration.Zero, Duration.Zero - Duration.second, {=>})
        } catch (e: IllegalArgumentException) {
            return // expect exception
        }
        @Expect(false)
    }
}
