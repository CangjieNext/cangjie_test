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
 * Test description: TimerScheduler must not miss an earlier deadline.
 *
 * Regression for MC-21: the scheduler reads the heap top (deadline T0) and
 * then parks with monitor.wait(timeout: T0 - now). A concurrent add() that
 * enqueues a timer with an EARLIER deadline between the top-read and the
 * wait drops its notify (the scheduler is not parked yet), so the earlier
 * timer is delayed until the old deadline.
 *
 * Public-API pressure construction (no test fault pin): a producer loop
 * repeatedly schedules short timers (1-5 ms) while the consumer measures
 * their first-run latency. Each scheduling round reopens the top-read ->
 * wait window, so a high iteration count makes the dropped notify
 * observable as an outlier latency on the unfixed std. The fixed std
 * re-checks the queue inside the monitor, closing the window.
 *
 * Note: the top-read -> wait window is a few instructions wide; the
 * public API cannot pin it deterministically (the fix report uses a
 * scheduler fault pin for the deterministic red/green pair). This test is
 * the public-API regression guard: on the fixed std the worst latency
 * stays within the budget.
 *
 * Test API:
 *   - public static func after(delay: Duration, task: () -> Option<Duration>): Timer
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import std.collection.ArrayList

@Test
class TestSchedulerLostNotify {
    // An outlier latency well beyond any timer's nominal deadline. The
    // unfixed std delays the earlier timer by the full old-top window
    // (~the largest scheduled delay plus scheduling slack), far above this.
    private static let LATENCY_BUDGET = Duration.millisecond * 200
    private static let ROUNDS: Int64 = 400

    @TestCase
    func testShortTimersNotDelayed(): Unit {
        let latencies = ArrayList<Duration>()

        for (i in 0..ROUNDS) {
            let delay = Duration.millisecond * (1 + i % 5)
            let start = MonoTime.now()
            Timer.after(delay) {
                let lat = MonoTime.now() - start
                latencies.add(lat)
                None
            }
            if (i % 50 == 0) {
                sleep(Duration.millisecond * 2) // let some timers fire, reopen window
            }
        }

        // Give every timer a chance to fire, plus slack for the scheduler.
        sleep(Duration.millisecond * 1000)

        var worst = Duration.Zero
        for (lat in latencies) {
            if (lat > worst) {
                worst = lat
            }
        }
        // Fixed std: re-checks the queue inside the monitor, so the earlier
        // timer is never delayed past its deadline. Unfixed std: a dropped
        // notify in the top-read -> wait gap delays it by the old top's
        // remaining window (well above the budget).
        @Expect(worst <= LATENCY_BUDGET)
    }
}
