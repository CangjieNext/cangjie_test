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
 *          public static func repeatDuring(period: Duration, delay: Duration, interval: Duration, task: () -> Unit, style!: CatchupStyle = Burst): Timer
 */

import std.collection.concurrent.*
import std.time.*
import std.sync.*

@Test
class TestRepeatDuring {
    private static let DELAY = Duration.millisecond * 100
    private static let INTERVAL = Duration.millisecond * 100
    private static let PERIOD = Duration.millisecond * 500

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
        let t1 = DELAY
        let t2 = t1 + INTERVAL
        let t3 = t2 + INTERVAL
        let t4 = t3 + INTERVAL
        let t5 = t4 + INTERVAL
        let t6 = t5 + INTERVAL
        doTestStyleWithTaskDelay(Burst, firstTaskDelay, t1, t2, t3, t4, t5, t6)
    }

    @TestCase
    func testBurstStyleTaskGreaterThanInterval(): Unit {
        let firstTaskDelay = INTERVAL * 2
        let t1 = DELAY
        let t2 = t1 + firstTaskDelay
        let t3 = t2 // burst t3 
        let t4 = t3 + INTERVAL
        let t5 = t4 + INTERVAL
        let t6 = t5 + INTERVAL
        doTestStyleWithTaskDelay(Burst, firstTaskDelay, t1, t2, t3, t4, t5, t6)
    }

    @TestCase
    func testSkipStyleTaskLessThanInterval(): Unit {
        let firstTaskDelay = INTERVAL / 2
        let t1 = DELAY
        let t2 = t1 + INTERVAL
        let t3 = t2 + INTERVAL
        let t4 = t3 + INTERVAL
        let t5 = t4 + INTERVAL
        let t6 = t5 + INTERVAL
        doTestStyleWithTaskDelay(Skip, firstTaskDelay, t1, t2, t3, t4, t5, t6)
    }

    @TestCase
    func testSkipStyleTaskGreaterThanInterval(): Unit {
        let firstTaskDelay = INTERVAL * 2
        let t1 = DELAY
        let t2 = t1 + firstTaskDelay
        // skip t3 
        let t4 = t2 + INTERVAL
        let t5 = t4 + INTERVAL
        let t6 = t5 + INTERVAL
        doTestStyleWithTaskDelay(Skip, firstTaskDelay, t1, t2, t4, t5, t6)
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

    func doTestStyleWithTaskDelay(style: CatchupStyle, firstTaskDelay: Duration, expectTicks: Array<Duration>): Unit {
        let ticks = BlockingQueue<MonoTime>()
        let isFirst = AtomicBool(true)

        let start = MonoTime.now()
        let timer = Timer.repeatDuring(
            PERIOD,
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

        for (tick in expectTicks) {
            expectTick(ticks.dequeue(), start + tick)
        }

        // expect no ticks any more
        if (let Some(unexpectTick) <- ticks.dequeue(PERIOD)) {
            println("Unexpcet tick at: ${unexpectTick - start}")
            timer.cancel()
            @Expect(false)
        }
    }
}
