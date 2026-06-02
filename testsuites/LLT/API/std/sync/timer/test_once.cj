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
 *          public static func once(delay: Duration, task: ()->Unit): Timer
 */

import std.collection.concurrent.*
import std.time.*
import std.sync.*

@Test
class TestOnce {
    private static let DELAY = Duration.millisecond * 100
    private static let EPSILON = Duration.millisecond * 30

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
        Timer.once(delay) {=> ticks.enqueue(MonoTime.now())}

        expectTick(ticks.dequeue(), start + expectDelay)
    }
}
