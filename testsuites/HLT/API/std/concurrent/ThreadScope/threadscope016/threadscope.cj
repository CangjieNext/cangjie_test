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
// TEST INTENT: fn throwing cancels long-running tasks and is rethrown
// DOC REF: threadScope - "If fn throws ... sends cancellation requests to all launched tasks"
// EXPECT: caught "stop scope" and worker observed cancellation, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let cancelled = AtomicBool(false)
    var caughtMessage = ""

    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    while (true) {
                        if (Thread.currentThread.hasPendingCancellation) {
                            cancelled.store(true)
                            return 0
                        }
                        sleep(Duration.millisecond * 5)
                    }
                    return 1
                }

                sleep(Duration.millisecond * 50)
                throw IllegalArgumentException("stop scope")
        }
    } catch (e: IllegalArgumentException) {
        caughtMessage = e.message
    }

    if (caughtMessage != "stop scope") {
        return 1
    }
    return if (cancelled.load()) { 0 } else { 2 }
}
