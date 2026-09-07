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
// TEST INTENT: fn throwing with no tasks rethrows directly
// DOC REF: threadScope - Exceptions: "Thrown if fn throws an exception"
// EXPECT: caught IllegalArgumentException "fn failed", exit 0

import std.concurrent.*

main(): Int64 {
    var caughtMessage = ""
    try {
        threadScope<Int64, Unit> {
            _ =>
                throw IllegalArgumentException("fn failed")
        }
    } catch (e: IllegalArgumentException) {
        caughtMessage = e.message
    }
    return if (caughtMessage == "fn failed") { 0 } else { 1 }
}
