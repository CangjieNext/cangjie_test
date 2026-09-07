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
// TEST INTENT: unconsumed failing task is rethrown even though fn returned normally
// DOC REF: threadScope - "If any unconsumed task throws ... the group iterator rethrows that failure while threadScope is waiting"
// EXPECT: caught "late failure", exit 0

import std.concurrent.*
import std.sync.*

// An unconsumed failing task is rethrown by threadScope even when fn itself
// returns normally (funcs.md paragraph 1: the group iterator rethrows the
// failure while threadScope is waiting).
main(): Int64 {
    var caught = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    sleep(Duration.millisecond * 30)
                    10
                }
                group.launch {
                    sleep(Duration.millisecond * 20)
                    throw IllegalArgumentException("late failure")
                }
                group.launch {
                    sleep(Duration.millisecond * 10)
                    20
                }
        }
    } catch (e: IllegalArgumentException) {
        caught = e.message
    }
    return if (caught == "late failure") { 0 } else { 1 }
}
