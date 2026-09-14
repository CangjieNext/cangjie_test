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
// TEST INTENT: fail-fast consumption: completion order decides which failure comes first
// DOC REF: ThreadGroup - "Results are yielded as threads complete" (failures included)
// EXPECT: first next() rethrows "early failure", exit 0

import std.concurrent.*
import std.sync.*

// Fail-fast consumption: with an early failure and a later value, the first
// next() rethrows the failure that completed first - results are yielded in
// completion order regardless of success or failure.
main(): Int64 {
    let outcome = AtomicInt64(0)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch {
                    sleep(Duration.millisecond * 50)
                    1
                }
                group.launch {
                    sleep(Duration.millisecond * 10)
                    throw IllegalArgumentException("early failure")
                }
                let iter = group.iterator()
                try {
                    match (iter.next()) {
                        case Some(_) => outcome.store(2)
                        case None => outcome.store(3)
                    }
                } catch (e: IllegalArgumentException) {
                    outcome.store(if (e.message == "early failure") { 0 } else { 3 })
                }
        }
    } catch (e: Exception) {
        outcome.store(1)
    }
    return outcome.load()
}
