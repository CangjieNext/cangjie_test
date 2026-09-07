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
// TEST INTENT: cancelAll never flags the scope's own thread
// DOC REF: cancelAll targets "every thread launched by this ThreadGroup" only
// EXPECT: hasPendingCancellation false inside fn, results still consumable, exit 0

import std.concurrent.*
import std.sync.*

// The scope's own thread is never flagged by group cancellation: after
// cancelAll, Thread.currentThread.hasPendingCancellation stays false inside fn
// and the group's results remain consumable.
main(): Int64 {
    let mainFlagged = AtomicBool(true)
    let sum = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 1 }
            group.launch { 2 }
            group.cancelAll()
            mainFlagged.store(Thread.currentThread.hasPendingCancellation)
            for (value in group) {
                sum.fetchAdd(value)
            }
    }
    if (mainFlagged.load()) {
        return 1
    }
    return if (sum.load() == 3) { 0 } else { 2 }
}
