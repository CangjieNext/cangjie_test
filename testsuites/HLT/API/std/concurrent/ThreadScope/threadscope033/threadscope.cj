/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
//
// TEST INTENT: cooperative task pre-cancelled before its first instruction exits immediately
// DOC REF: ThreadGroup.cancelAll - "causes subsequently launched tasks to be cancelled as well"
// EXPECT: cancellation observed fast (< 5s wall), exit 0

import std.concurrent.*
import std.sync.*
import std.time.*

// A cooperative task that is already cancelled before its first instruction
// (cancelAll precedes launch) observes hasPendingCancellation immediately and
// exits without the scope's wait being extended.
main(): Int64 {
    let cancelledSeen = AtomicBool(false)
    let start = MonoTime.now()
    threadScope<Unit, Unit> {
        group =>
            group.cancelAll()
            group.launch {
                while (!Thread.currentThread.hasPendingCancellation) {
                    sleep(Duration.millisecond * 5)
                }
                cancelledSeen.store(true)
            }
    }
    let elapsed = (MonoTime.now() - start).toMilliseconds()
    if (!cancelledSeen.load()) {
        return 1
    }
    return if (elapsed < 5000) { 0 } else { 2 }
}
