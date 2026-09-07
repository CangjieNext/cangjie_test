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
// TEST INTENT: next() rethrows a consumed task failure at the iterator level
// DOC REF: ThreadGroup.iterator - Exceptions: "Thrown if the consumed task result is an exception"
// EXPECT: caught IllegalArgumentException "task failed", exit 0

import std.concurrent.*

main(): Int64 {
    var caughtMessage = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw IllegalArgumentException("task failed")
                }

                let iter = group.iterator()
                match (iter.next()) {
                    case Some(_) => ()
                    case None => ()
                }
        }
    } catch (e: IllegalArgumentException) {
        caughtMessage = e.message
    }
    return if (caughtMessage == "task failed") { 0 } else { 1 }
}
