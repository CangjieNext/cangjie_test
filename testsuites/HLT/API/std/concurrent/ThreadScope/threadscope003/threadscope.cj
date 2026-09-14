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
// TEST INTENT: task exception is rethrown to the scope caller
// DOC REF: threadScope - Exceptions: "an unhandled launched task result is an exception"
// EXPECT: caught message == "subtask failed", exit 0

import std.concurrent.*

main(): Int64 {
    var caughtMessage = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch { 1 }
                group.launch {
                    throw Exception("subtask failed")
                }
                group.launch { 3 }
        }
    } catch (e: Exception) {
        caughtMessage = e.message
    }
    return if (caughtMessage == "subtask failed") { 0 } else { 1 }
}
