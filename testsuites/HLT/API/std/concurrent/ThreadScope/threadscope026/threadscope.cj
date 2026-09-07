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
// TEST INTENT: fn aborting mid-iteration drains values and failures alike, rethrowing fn's failure
// DOC REF: threadScope - "If fn throws ... drains outstanding task results, and rethrows the original failure"
// EXPECT: caught "fn abort", late task completed during drain, exit 0

import std.concurrent.*
import std.sync.*

// fn aborts via its own exception after partial consumption: the remaining
// unconsumed task results (values and failures alike) are drained silently and
// the fn's original failure is rethrown (funcs.md paragraph 2).
main(): Int64 {
    let taskDone = AtomicBool(false)
    var caught = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    sleep(Duration.millisecond * 40)
                    taskDone.store(true)
                    9
                }
                let iter = group.iterator()
                iter.next()
                sleep(Duration.millisecond * 10)
                throw IllegalArgumentException("fn abort")
        }
    } catch (e: IllegalArgumentException) {
        caught = e.message
    }
    if (caught != "fn abort") {
        return 1
    }
    return if (taskDone.load()) { 0 } else { 2 }
}
