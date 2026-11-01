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
// TEST INTENT: cancelAll invoked from inside a launched task does not deadlock or crash
// DOC REF: ThreadGroup warning - not thread-safe; pins current tolerant behavior
// EXPECT: sibling completes and group stays consumable, exit 0

import std.concurrent.*
import std.sync.*

// cancelAll sent from inside a launched task does not dead-lock or crash the
// scope: both tasks complete and the group remains consumable. (The API is
// documented as not thread-safe; this pins current tolerant behavior.)
main(): Int64 {
    let siblingDone = AtomicBool(false)
    threadScope<Unit, Unit> {
        group =>
            group.launch {
                group.cancelAll()
            }
            group.launch {
                sleep(Duration.millisecond * 20)
                siblingDone.store(true)
            }
    }
    return if (siblingDone.load()) { 0 } else { 1 }
}
