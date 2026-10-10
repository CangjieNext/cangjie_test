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
// TEST INTENT: task failure cancels unconsumed launched tasks
// DOC REF: threadScope - "sends cancellation requests to all launched tasks"
// EXPECT: caught "child failed" and worker observes hasPendingCancellation, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let cancellationObserved = AtomicBool(false)
    var caughtMessage = ""

    try {
        threadScope<Unit, Unit> {
            group =>
                group.launch {
                    throw Exception("child failed")
                }
                sleep(Duration.millisecond * 20)
                group.launch {
                    var attempts: Int64 = 0
                    var done = false
                    while (!done && attempts < 200) {
                        if (Thread.currentThread.hasPendingCancellation) {
                            cancellationObserved.store(true)
                            done = true
                        } else {
                            attempts += 1
                            sleep(Duration.millisecond * 5)
                        }
                    }
                }
        }
    } catch (e: Exception) {
        caughtMessage = e.message
    }

    if (caughtMessage != "child failed") {
        return 1
    }
    return if (cancellationObserved.load()) { 0 } else { 2 }
}
