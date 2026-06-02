/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils.cj
// EXEC: %compiler %cmp_opt ./utils.cj %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Class Timer.
 * Test API:
 *          public static func repeat(delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer
 */

import std.collection.concurrent.*
import std.time.*
import std.sync.*

@Test
class TestRepeat {
    private static let DELAY = Duration.millisecond * 100
    private static let INTERVAL = Duration.millisecond * 100

    /************************ Test @p delay ***********************************/

    @TestCase
    func testDelay(): Unit {
        doTestDelay(DELAY, DELAY)
    }

    @TestCase
    func testDelayZero(): Unit {
        doTestDelay(Duration.Zero, Duration.Zero)
    }

    @TestCase
    func testDelayNegative(): Unit {
        doTestDelay(Duration.Zero - DELAY, Duration.Zero)
    }

    func doTestDelay(delay: Duration, expectDelay: Duration): Unit {
        let ticks = BlockingQueue<MonoTime>()

        let start = MonoTime.now()
        let timer = Timer.repeat(delay, INTERVAL, {=> ticks.enqueue(MonoTime.now())})

        expectTick(ticks.dequeue(), start + expectDelay)

        timer.cancel()
    }

    /************************ Test @p interval ***********************************/
    @TestCase
    func testInterval(): Unit {
        let ticks = BlockingQueue<MonoTime>()

        var lastTime = MonoTime.now()
        let timer = Timer.repeat(DELAY, INTERVAL, {=> ticks.enqueue(MonoTime.now())})

        var cnt = 0
        while (cnt < 3) { // test for 3 times

            let tick = ticks.dequeue()
            expectTick(tick, lastTime + INTERVAL)

            lastTime = tick
            cnt++
        }

        timer.cancel()
    }

    /************************ Test @p style ***********************************/
    @TestCase
    func testStyleDelay(): Unit {
        doTestStyle(Delay)
    }

    @TestCase
    func testStyleBurst(): Unit {
        doTestStyle(Burst)
    }

    @TestCase
    func testStyleSkip(): Unit {
        doTestStyle(Skip)
    }

    func doTestStyle(style: CatchupStyle): Unit {
        let ticks = BlockingQueue<MonoTime>()

        var lastTime = MonoTime.now()
        let timer = Timer.repeat(DELAY, INTERVAL, {=> ticks.enqueue(MonoTime.now())}, style: style)

        var cnt = 0
        while (cnt < 3) { // test for 3 times

            let tick = ticks.dequeue()
            expectTick(tick, lastTime + INTERVAL)

            lastTime = tick
            cnt++
        }

        timer.cancel()
    }
}
