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
// TEST INTENT: a task free to ignore cancellation runs to completion
// DOC REF: ThreadGroup.cancelAll - "A thread is free to ignore cancellation requests"
// EXPECT: stubborn task finishes and result is consumable, exit 0

import std.concurrent.*
import std.sync.*

// A task that never checks cancellation is free to ignore the request:
// after cancelAll it still runs to completion and its result is consumable
// (ThreadGroup.cancelAll: "A thread is free to ignore cancellation requests").
main(): Int64 {
    let stubbornDone = AtomicBool(false)
    threadScope<Int64, Unit> {
        group =>
            group.launch {
                sleep(Duration.millisecond * 30)
                stubbornDone.store(true)
                5
            }
            group.cancelAll()
            var sum = 0
            for (value in group) {
                sum += value
            }
    }
    return if (stubbornDone.load()) { 0 } else { 1 }
}
