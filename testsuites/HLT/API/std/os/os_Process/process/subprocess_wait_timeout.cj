/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not OHOS and not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not Windows) ASSERT: scan subprocess_wait_timeout.cj
import std.process.*
import std.time.*
import std.sync.*

// Regression tests for SubProcess.wait(timeout:):
//  - a timed-out wait must not leave a background reaper thread behind,
//    otherwise the child is reaped by that stray thread and every later
//    wait() fails with ECHILD and returns -1;
//  - wait() must be idempotent: the exit status is cached on the instance so
//    repeated calls return the same result instead of -1.
@Test
class Test_subprocess_wait_timeout {
    @TestCase
    func test_timeout_then_rewait_same_instance(): Unit {
        // wait(timeout:) times out cleanly without spawning a residual reaper,
        // so a later wait() on the same instance reaps the child itself and
        // returns the real exit status (0) instead of -1.
        let sub = Process.start("sleep", "2")
        try {
            sub.wait(timeout: Duration.millisecond * 500)
            @Expect(false)
        } catch (_: TimeoutException) {
        }
        // Give the child enough time to exit. With the old implementation the
        // stray reaper thread reaps it here, making the wait() below return -1.
        sleep(Duration.second * 3)
        @Expect(sub.wait(), 0)
    }

    @TestCase
    func test_idempotent_rewait(): Unit {
        // Once reaped, repeated wait() calls must return the cached exit
        // status instead of failing with ECHILD.
        let sub = Process.start("sleep", "1")
        @Expect(sub.wait(), 0)
        @Expect(sub.wait(), 0)
        @Expect(sub.wait(), 0)
    }

    @TestCase
    func test_multiple_timeouts_then_rewait(): Unit {
        // Several timed-out waits must not poison later waits either.
        let sub = Process.start("sleep", "2")
        var timeoutCnt = 0
        try {
            sub.wait(timeout: Duration.millisecond * 300)
            @Expect(false)
        } catch (_: TimeoutException) {
            timeoutCnt++
        }
        try {
            sub.wait(timeout: Duration.millisecond * 300)
            @Expect(false)
        } catch (_: TimeoutException) {
            timeoutCnt++
        }
        try {
            sub.wait(timeout: Duration.millisecond * 300)
            @Expect(false)
        } catch (_: TimeoutException) {
            timeoutCnt++
        }
        @Expect(timeoutCnt, 3)
        sleep(Duration.second * 3)
        @Expect(sub.wait(), 0)
    }
}
