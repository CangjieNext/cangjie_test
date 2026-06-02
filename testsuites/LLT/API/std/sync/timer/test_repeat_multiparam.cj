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

    /************************ Test @p interval & @p style ***********************************/
    @TestCase
    func testDelayStyleTaskLessThanInterval(): Unit {
        let firstTaskDelay = INTERVAL / 2
        doTestDelayStyleWithTaskDelay(firstTaskDelay, INTERVAL)
    }

    @TestCase
    func testDelayStyleTaskGreaterThanInterval(): Unit {
        let firstTaskDelay = INTERVAL * 2.5
        doTestDelayStyleWithTaskDelay(firstTaskDelay, INTERVAL)
    }

    @TestCase
    func testBurstStyleTaskLessThanInterval(): Unit {
        let firstTaskDelay = INTERVAL / 2
        let firstTick = DELAY
        let secondTick = firstTick + INTERVAL
        let thirdTick = secondTick + INTERVAL
        doTestStyleWithTaskDelay(Burst, firstTaskDelay, firstTick, secondTick, thirdTick)
    }

    @TestCase
    func testBurstStyleTaskGreaterThanInterval(): Unit {
        let firstTaskDelay = INTERVAL * 2
        let firstTick = DELAY
        let secondTick = firstTick + firstTaskDelay
        let thirdTick = secondTick
        doTestStyleWithTaskDelay(Burst, firstTaskDelay, firstTick, secondTick, thirdTick)
    }

    @TestCase
    func testSkipStyleTaskLessThanInterval(): Unit {
        let firstTaskDelay = INTERVAL / 2
        let firstTick = DELAY
        let secondTick = firstTick + INTERVAL
        let thirdTick = secondTick + INTERVAL
        doTestStyleWithTaskDelay(Skip, firstTaskDelay, firstTick, secondTick, thirdTick)
    }

    @TestCase
    func testSkipStyleTaskGreaterThanInterval(): Unit {
        let firstTaskDelay = INTERVAL * 2
        let firstTick = DELAY
        let secondTick = firstTick + firstTaskDelay
        let thirdTick = secondTick + INTERVAL
        doTestStyleWithTaskDelay(Skip, firstTaskDelay, firstTick, secondTick, thirdTick)
    }

    func doTestDelayStyleWithTaskDelay(firstTaskDelay: Duration, interval: Duration): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let isFirst = AtomicBool(true)

        let start = MonoTime.now()
        let lastTime = BlockingQueue<MonoTime>()
        let timer = Timer.repeat(
            DELAY,
            INTERVAL,
            {
                =>
                ticks.enqueue(MonoTime.now());
                if (isFirst.load()) {
                    sleep(firstTaskDelay);
                    isFirst.store(false)
                };
                lastTime.enqueue(MonoTime.now())
            },
            style: Delay
        )

        expectTick(ticks.dequeue(), start + DELAY)
        expectTick(ticks.dequeue(), lastTime.dequeue() + interval)
        expectTick(ticks.dequeue(), lastTime.dequeue() + interval)

        timer.cancel()
    }

    func doTestStyleWithTaskDelay(style: CatchupStyle, firstTaskDelay: Duration, firstTick: Duration,
        secondTick: Duration, thirdTick: Duration): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let isFirst = AtomicBool(true)

        let start = MonoTime.now()
        let timer = Timer.repeat(
            DELAY,
            INTERVAL,
            {
                =>
                ticks.enqueue(MonoTime.now());
                if (isFirst.load()) {
                    sleep(firstTaskDelay);
                    isFirst.store(false)
                }
            },
            style: style
        )

        expectTick(ticks.dequeue(), start + firstTick)
        expectTick(ticks.dequeue(), start + secondTick)
        expectTick(ticks.dequeue(), start + thirdTick)

        timer.cancel()
    }
}
