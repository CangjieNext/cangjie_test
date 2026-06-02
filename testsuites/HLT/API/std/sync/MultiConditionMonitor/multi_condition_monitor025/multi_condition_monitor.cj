/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*

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
        mcm.wait(con)
        awake.fetchAdd(1)
        mcm.unlock()
    }
    while (running.load() != 1) {}
    mcm.lock()
    mcm.notify(con)
    try {
        future.get(Duration.millisecond * 10)
    } catch (e: Exception) {
        return 0
    }
    return 1
}
