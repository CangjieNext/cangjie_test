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
// TEST INTENT: task failure reaches the scope caller's catch
// DOC REF: threadScope - Exceptions: unhandled launched task result
// EXPECT: caught IllegalArgumentException "task error", exit 0

import std.concurrent.*

main(): Int64 {
    var caught = false
    var caughtMessage = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    throw IllegalArgumentException("task error")
                }
        }
    } catch (e: IllegalArgumentException) {
        caught = true
        caughtMessage = e.message
    } catch (e: Exception) {
        caught = true
        caughtMessage = e.message
    }
    if (!caught || caughtMessage != "task error") {
        return 1
    }
    return 0
}
