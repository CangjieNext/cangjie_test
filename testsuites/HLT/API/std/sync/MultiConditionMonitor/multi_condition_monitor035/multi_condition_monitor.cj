/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var running: AtomicInt64 = AtomicInt64(0)
var done: AtomicBool = AtomicBool(false)

main(): Int64 {
    for (i in 0..100) {
        running.store(0)
        let mcm: MultiConditionMonitor = MultiConditionMonitor()
        mcm.lock()
        let con: ConditionID = mcm.newCondition()
        mcm.unlock()
        let future: Future<Unit> = spawn {
            mcm.lock()
            running.fetchAdd(1)
            mcm.wait(con)
            mcm.unlock()
            running.fetchAdd(1)
        }
        while (running.load() != 1) {}
        mcm.lock()
        mcm.unlock()
        done.store(false)
        spawn {
            mcm.lock()
            mcm.notifyAll(con)
            mcm.unlock()
        }
        spawn {
            mcm.lock()
            while (!done.load()) {
                mcm.wait(con)
            }
            mcm.unlock()
        }
        let res: Unit = future.get()
        if (running.load() != 2) {
            return 1
        }
        mcm.lock()
        done.store(true)
        mcm.unlock()
        mcm.lock()
        mcm.notifyAll(con)
        mcm.unlock()
        GC()
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
