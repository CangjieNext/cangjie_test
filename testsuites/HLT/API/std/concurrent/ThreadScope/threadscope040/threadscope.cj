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
// TEST INTENT: a fully drained group accepts new launches and consumption rounds
// DOC REF: ThreadGroup - records one result for every thread launched
// EXPECT: round 1 sum == 1, round 2 sum == 5, exit 0

import std.concurrent.*
import std.sync.*

// A group may be consumed in multiple rounds: after a full drain, newly
// launched tasks are consumed by a fresh iteration of the same group.
main(): Int64 {
    let firstRound = AtomicInt64(0)
    let secondRound = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 1 }
            var sum = 0
            for (value in group) {
                sum += value
            }
            firstRound.store(sum)

            group.launch { 2 }
            group.launch { 3 }
            var sum2 = 0
            for (value in group) {
                sum2 += value
            }
            secondRound.store(sum2)
    }
    if (firstRound.load() != 1) {
        return 1
    }
    return if (secondRound.load() == 5) { 0 } else { 2 }
}
