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
// TEST INTENT: iterator-level rethrow of a consumed failure (for-in reading)
// DOC REF: ThreadGroup.iterator - Exceptions section
// EXPECT: caught IllegalArgumentException "iter error", exit 0

import std.concurrent.*

main(): Int64 {
    var caughtMessage = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw IllegalArgumentException("iter error")
                }

                for (_ in group) {
                    ()
                }
        }
    } catch (e: IllegalArgumentException) {
        caughtMessage = e.message
    }
    return if (caughtMessage == "iter error") { 0 } else { 1 }
}
