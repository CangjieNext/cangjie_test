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
 *          public func cancel(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*

@Test
class TestOnce {
    private static let DELAY = Duration.millisecond * 100

    @TestCase
    func testCancelBeforeDelay(): Unit {
        let timerDone = AtomicBool(false)
        let timer = Timer.once(DELAY) {=> timerDone.store(true)}

        sleep(DELAY / 2)
        timer.cancel() // cancel before delay
        sleep(DELAY * 2)
        @Expect(!timerDone.load()) // timer cancelled
    }

    @TestCase
    func testCancelAfterDely(): Unit {
        let timerDone = AtomicBool(false)
        let timer = Timer.once(DELAY) {=> timerDone.store(true)}

        sleep(DELAY * 2)
        timer.cancel() // cancel after delay
        @Expect(timerDone.load())
    }
}
