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
// TEST INTENT: cancelAll on an empty group is a no-op
// DOC REF: ThreadGroup.cancelAll - no exceptions listed
// EXPECT: task launched after cancelAll still runs, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let ran = AtomicBool(false)

    threadScope<Unit, Unit> {
        group =>
            group.cancelAll()
            group.launch {
                ran.store(true)
            }
    }

    return if (ran.load()) { 0 } else { 1 }
}
