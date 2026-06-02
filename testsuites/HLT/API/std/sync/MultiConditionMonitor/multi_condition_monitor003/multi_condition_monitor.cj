/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException

import std.sync.*
import std.time.*

var running: AtomicInt64 = AtomicInt64(0)
var awake: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mcm: MultiConditionMonitor = MultiConditionMonitor()
    mcm.lock()
    let con: ConditionID = mcm.newCondition()
    mcm.unlock()
    let future: Future<Unit> = spawn {
        mcm.lock()
        running.fetchAdd(1)
        if (!mcm.wait(con, timeout: Duration.Zero)) {
            awake.fetchAdd(1)
        }
        awake.fetchAdd(1)
        mcm.unlock()
    }
    while (running.load() != 1) {}
    try {
        future.get()
    } catch (e: IllegalArgumentException) {
        return 1
    }
    if (running.load() != 1 || awake.load() != 0) {
        return 2
    }
    return 0
}
