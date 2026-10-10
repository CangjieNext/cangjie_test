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
// TEST INTENT: failure consumed and handled inside fn leaves scope normal
// DOC REF: threadScope - "If any unconsumed task throws ..." counter-case: handled consumption does not propagate
// EXPECT: iterator caught task failure, other results consumed, sum == 5, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let finishedCount = AtomicInt64(0)
    let caughtInside = AtomicBool(false)

    let result = threadScope<Int64, Int64> {
        group =>
            group.launch {
                throw IllegalArgumentException("task failed")
            }
            group.launch {
                sleep(Duration.millisecond * 30)
                finishedCount.fetchAdd(1)
                2
            }
            group.launch {
                sleep(Duration.millisecond * 10)
                finishedCount.fetchAdd(1)
                3
            }

            var sum = 0
            let iter = group.iterator()
            while (true) {
                try {
                    match (iter.next()) {
                        case Some(v) => sum += v
                        case None => break
                    }
                } catch (e: IllegalArgumentException) {
                    caughtInside.store(true)
                }
            }
            sum
    }

    if (!caughtInside.load()) {
        return 1
    }
    if (finishedCount.load() != 2) {
        return 2
    }
    return if (result == 5) { 0 } else { 3 }
}
