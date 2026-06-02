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
var cnt6 = 0
var cnt7 = 0

@Test
class Test_cancel {
    @TestCase
    func test_cancel_01(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.once(Duration.Zero, {=> ticks.enqueue(MonoTime.now())})
        while (cnt1 < 1) {
            let tick = ticks.dequeue()
            cnt1++
        }
        timer.cancel()
        sleep(Duration.millisecond * 2000)
        @Expect(cnt1, 1)
    }

    @TestCase
    func test_cancel_02(): Unit {
        var timer = Timer.once(Duration.millisecond * 100) {=> cnt2 += 1}
        timer.cancel()
        sleep(Duration.millisecond * 200)
        @Expect(cnt2, 0)
    }

    @TestCase
    func test_cancel_03(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(Duration.Zero, Duration.second, {=> ticks.enqueue(MonoTime.now())})
        while (cnt3 < 3) {
            let tick = ticks.dequeue()
            cnt3++
        }
        timer.cancel()
        sleep(Duration.millisecond * 2000)
        timer.cancel()
        @Expect(cnt3, 3)
    }

    @TestCase
    func test_cancel_04(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(Duration.millisecond * 100, Duration.millisecond * 100,
            {=> ticks.enqueue(MonoTime.now())})
        while (cnt4 < 2) {
            let tick = ticks.dequeue()
            cnt4++
        }
        timer.cancel()
        sleep(Duration.millisecond * 200)
        timer.cancel()
        @Expect(cnt4, 2)
    }

    @TestCase
    func test_cancel_05(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeatDuring(Duration.millisecond * 500, Duration.Zero, Duration.millisecond * 100,
            {=> ticks.enqueue(MonoTime.now())})
        while (cnt5 < 4) {
            let tick = ticks.dequeue()
            cnt5++
        }
        timer.cancel()

        sleep(Duration.millisecond * 390)
        timer.cancel()
        @Expect(cnt5, 4)
    }

    @TestCase
    func test_cancel_06(): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let timer = Timer.repeatTimes(5, Duration.Zero, Duration.millisecond * 100, {=> ticks.enqueue(MonoTime.now())})
        while (cnt6 < 4) {
            let tick = ticks.dequeue()
            cnt6++
        }
        timer.cancel()
        sleep(Duration.millisecond * 390)
        timer.cancel()
        @Expect(cnt6, 4)
    }
}
