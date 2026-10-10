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
// TEST INTENT: fn's own failure wins over a later task failure
// DOC REF: threadScope - "rethrows the original failure"
// EXPECT: caught "fn failure first", exit 0

import std.concurrent.*
import std.sync.*

// A failure thrown by fn itself wins over later task failures: fn throws
// while a task's failure is still pending, and the scope rethrows fn's
// original failure ("rethrows the original failure", funcs.md paragraph 2).
main(): Int64 {
    let outcome = AtomicInt64(0)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    sleep(Duration.millisecond * 40)
                    throw IllegalStateException("late task failure")
                }
                group.launch {
                    sleep(Duration.millisecond * 40)
                    9
                }
                sleep(Duration.millisecond * 10)
                throw IllegalArgumentException("fn failure first")
        }
    } catch (e: IllegalArgumentException) {
        outcome.store(if (e.message == "fn failure first") { 0 } else { 2 })
    } catch (e: IllegalStateException) {
        outcome.store(1)
    }
    return outcome.load()
}
