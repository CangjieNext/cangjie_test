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
// TEST INTENT: repeated cancelAll calls are harmless and idempotent
// DOC REF: ThreadGroup.cancelAll - no state that breaks on repetition
// EXPECT: 3 tasks complete across interleaved cancels, exit 0

import std.concurrent.*
import std.sync.*

// Repeated cancelAll calls are harmless: cancel three times around launches
// and the cooperative tasks still finish, with results consumable.
main(): Int64 {
    let done = AtomicInt64(0)
    threadScope<Unit, Unit> {
        group =>
            group.launch {
                done.fetchAdd(1)
            }
            group.cancelAll()
            group.launch {
                done.fetchAdd(1)
            }
            group.cancelAll()
            group.cancelAll()
            group.launch {
                done.fetchAdd(1)
            }
    }
    return if (done.load() == 3) { 0 } else { 1 }
}
