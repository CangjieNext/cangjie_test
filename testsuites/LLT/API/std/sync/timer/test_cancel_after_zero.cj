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
 * Test description: Timer task must not run after cancel() returns.
 *
 * Regression for MC-20: Timer.cancel() races with a running task. The
 * scheduler's immediate-execute path (a task returning Some(Zero) or a
 * sub-microsecond positive Duration reschedules with reload(Zero), which
 * takes the `MonoTime.now() >= endTime` branch and never re-checks
 * isEnabled) used to let the task body run again after cancel() returned.
 *
 * Scenario B is deterministic on the unfixed std: after(Zero){Some(Zero)}
 * permanently takes the immediate-execute path, so cancel() is never
 * consulted; the task keeps firing forever. On the fixed std the
 * isCancelled guard in reload() stops it.
 *
 * Test API:
 *   - public static func after(delay: Duration, task: () -> ?Duration): Timer
 *   - public func cancel(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
class TestCancelAfterZero {
    private static let WARMUP = Duration.millisecond * 150
    private static let SETTLE = Duration.millisecond * 200

    // Scenario B: after(Zero) { ...; Some(Zero) } — documented immediate
    // reschedule. On the unfixed std the timer re-fires forever because
    // reload(Zero) never re-checks isEnabled; the task body enters again
    // after cancel() returned.
    @TestCase
    func testTaskNotRunAfterCancel(): Unit {
        let postCancel = AtomicInt64(0)
        let cancelDone = AtomicBool(false)

        let timer = Timer.after(Duration.Zero) {
            if (cancelDone.load()) {
                postCancel.fetchAdd(1)
            }
            Some(Duration.Zero)
        }

        sleep(WARMUP)            // let the timer fire at least once
        timer.cancel()
        cancelDone.store(true)   // strictly AFTER cancel() returned
        sleep(SETTLE)
        sleep(SETTLE)

        let postCanceled = postCancel.load()
        // Fixed std: no execution after cancel() returned. Unfixed std: the
        // immediate-reschedule path keeps firing; the task body is observed
        // entering after cancel() returned.
        @Expect(postCanceled == 0)
    }
}
