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
// TEST INTENT: failure in a second consumption round after a clean first round
// DOC REF: ThreadGroup - results recorded per launch across rounds
// EXPECT: round 1 sum == 10, round 2 failure rethrown, exit 0

import std.concurrent.*
import std.sync.*

// Launch-consume-launch round trips with a failure in the second round:
// the first round's value is already consumed, then the second round's failure
// propagates out of the scope.
main(): Int64 {
    let firstRound = AtomicInt64(0)
    var caught = ""
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch { 10 }
                var sum = 0
                for (value in group) {
                    sum += value
                }
                firstRound.store(sum)
                group.launch {
                    throw IllegalArgumentException("second round failure")
                }
                for (value in group) {
                    sum += 100
                }
        }
    } catch (e: IllegalArgumentException) {
        caught = e.message
    }
    if (firstRound.load() != 10) {
        return 1
    }
    return if (caught == "second round failure") { 0 } else { 2 }
}
