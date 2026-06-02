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
import std.collection.concurrent.*

var cnt1 = 0
var cnt2 = 0
var cnt3 = 0
var cnt4 = 0
var cnt5 = 0

@Test
class Test_init_duration_period {
    @TestCase
    func test_init_duration_period_01(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(Duration.Zero, Duration.millisecond * 100, {=> ticks.enqueue(MonoTime.now())})
        while (cnt1 < 6) {
            let tick = ticks.dequeue()
            cnt1++
        }
        @Expect(cnt1, 6)
    }

    @TestCase
    func test_init_duration_period_02(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(Duration.nanosecond * -1, Duration.millisecond * 100,
            {=> ticks.enqueue(MonoTime.now())})
        while (cnt2 < 6) {
            let tick = ticks.dequeue()
            cnt2++
        }
        @Expect(cnt2, 6)
    }

    @TestCase
    func test_init_duration_period_03(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(Duration.millisecond * 100, Duration.millisecond * 100,
            {=> ticks.enqueue(MonoTime.now())})
        while (cnt3 < 5) {
            let tick = ticks.dequeue()
            cnt3++
        }
        @Expect(cnt3, 5)
    }

    @TestCase
    func test_init_duration_period_04(): Unit {
        var flag = false
        try {
            var timer = Timer.repeat(Duration.millisecond * 100, Duration.nanosecond * -1, {=> cnt4 += 1}) // period 为负数
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "Interval cannot be less than or equal to Duration.Zero.")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_init_duration_period_05(): Unit {
        var flag = false
        try {
            var timer = Timer.repeat(Duration.millisecond * 100, Duration.Zero, {=> cnt5 += 1}) // period 为0
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "Interval cannot be less than or equal to Duration.Zero.")
        }
        @Assert(flag, true)
    }
}
