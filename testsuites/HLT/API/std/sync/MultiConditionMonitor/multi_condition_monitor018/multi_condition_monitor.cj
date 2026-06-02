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
    for (i in 0..100) {
        running.store(0)
        awake.store(0)
        mcm.lock()
        let con1: ConditionID = mcm.newCondition()
        let con2: ConditionID = mcm.newCondition()
        let con3: ConditionID = mcm.newCondition()
        mcm.unlock()
        let future1: Future<Unit> = spawn {
            mcm.lock()
            running.fetchAdd(1)
            mcm.wait(con1)
            mcm.notifyAll(con2)
            awake.fetchAdd(1)
            mcm.unlock()
        }
        let future2: Future<Unit> = spawn {
            mcm.lock()
            running.fetchAdd(1)
            mcm.wait(con2)
            awake.fetchAdd(1)
            mcm.unlock()
        }
        let future3: Future<Unit> = spawn {
            mcm.lock()
            running.fetchAdd(1)
            mcm.wait(con3)
            awake.fetchAdd(1)
            mcm.unlock()
        }
        while (running.load() != 3) {}
        mcm.lock()
        mcm.notify(con1)
        mcm.unlock()
        var res1: Unit = future1.get()
        var res2: Unit = future2.get()
        try {
            future3.get(Duration.millisecond)
            return 1
        } catch (_: TimeoutException) {
        }

        if (awake.load() != 2) {
            return 2
        }
    }
    return 0
}
