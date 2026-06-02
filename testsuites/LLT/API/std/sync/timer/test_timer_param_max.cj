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
 *          public static func once(delay: Duration, task: ()->Unit): Timer
 *          public static func repeat(delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer {
 *          public static func repeatDuring(period: Duration, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer {
 *          public static func repeatTimes(count: Int64, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer {
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import std.math.*
import std.collection.*

@Test
class TestTimer {
    let timers = ArrayList<Timer>()

    @TestCase
    func testParamMax(): Unit {
        // *********************** Timer.once ****************************
        Timer.once(Duration.Min) {=>} |> timers.add
        Timer.once(Duration.Max) {=>} |> timers.add

        // *********************** Timer.repeat ****************************
        Timer.repeat(Duration.Min, Duration.Max, {=>}) |> timers.add
        Timer.repeat(Duration.Max, Duration.Max, {=>}) |> timers.add

        Timer.repeat(Duration.Min, Duration.Max, {=>}, style: Burst) |> timers.add
        Timer.repeat(Duration.Max, Duration.Max, {=>}, style: Burst) |> timers.add

        Timer.repeat(Duration.Min, Duration.Max, {=>}, style: Delay) |> timers.add
        Timer.repeat(Duration.Max, Duration.Max, {=>}, style: Delay) |> timers.add

        Timer.repeat(Duration.Min, Duration.Max, {=>}, style: Skip) |> timers.add
        Timer.repeat(Duration.Max, Duration.Max, {=>}, style: Skip) |> timers.add

        // *********************** Timer.repeatDuring ****************************
        Timer.repeatDuring(Duration.Max, Duration.Min, Duration.Max, {=>}) |> timers.add
        Timer.repeatDuring(Duration.Max, Duration.Max, Duration.Max, {=>}) |> timers.add

        Timer.repeatDuring(Duration.Max, Duration.Min, Duration.Max, {=>}, style: Burst) |> timers.add
        Timer.repeatDuring(Duration.Max, Duration.Max, Duration.Max, {=>}, style: Burst) |> timers.add

        Timer.repeatDuring(Duration.Max, Duration.Min, Duration.Max, {=>}, style: Delay) |> timers.add
        Timer.repeatDuring(Duration.Max, Duration.Max, Duration.Max, {=>}, style: Delay) |> timers.add

        Timer.repeatDuring(Duration.Max, Duration.Min, Duration.Max, {=>}, style: Skip) |> timers.add
        Timer.repeatDuring(Duration.Max, Duration.Max, Duration.Max, {=>}, style: Skip) |> timers.add

        // *********************** Timer.repeatTimes ****************************
        Timer.repeatTimes(Int64.Max, Duration.Min, Duration.Max, {=>}) |> timers.add
        Timer.repeatTimes(Int64.Max, Duration.Max, Duration.Max, {=>}) |> timers.add

        Timer.repeatTimes(Int64.Max, Duration.Min, Duration.Max, {=>}, style: Burst) |> timers.add
        Timer.repeatTimes(Int64.Max, Duration.Max, Duration.Max, {=>}, style: Burst) |> timers.add

        Timer.repeatTimes(Int64.Max, Duration.Min, Duration.Max, {=>}, style: Delay) |> timers.add
        Timer.repeatTimes(Int64.Max, Duration.Max, Duration.Max, {=>}, style: Delay) |> timers.add

        Timer.repeatTimes(Int64.Max, Duration.Min, Duration.Max, {=>}, style: Skip) |> timers.add
        Timer.repeatTimes(Int64.Max, Duration.Max, Duration.Max, {=>}, style: Skip) |> timers.add

        for (timer in timers) {
            timer.cancel()
        }
    }
}
