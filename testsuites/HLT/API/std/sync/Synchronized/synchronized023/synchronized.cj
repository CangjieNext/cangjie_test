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
import std.runtime.*
import std.argopt.*
import std.process

var running: AtomicInt64 = AtomicInt64(0)
var awake: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mcm: MultiConditionMonitor = MultiConditionMonitor()
    mcm.lock()
    let con: ConditionID = mcm.newCondition()
    mcm.unlock()
    let future: Future<Unit> = spawn {
        synchronized(mcm) {
            running.fetchAdd(1)
            mcm.wait(con)
            awake.fetchAdd(1)
        }
    }
    while (running.load() != 1) {}
    if (awake.load() != 0) {
        return 1
    }
    mcm.lock()
    mcm.notify(con)
    mcm.unlock()
    let res: Unit = future.get()
    if (awake.load() != 1) {
        return 2
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
