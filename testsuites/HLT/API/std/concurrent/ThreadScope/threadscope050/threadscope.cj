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
// TEST INTENT: ThreadGroup<T> is consumable through an Iterable-typed helper
// DOC REF: ThreadGroup<T> <: Iterable<T>
// EXPECT: helper sums 1+2+3 == 6, exit 0

import std.concurrent.*

// The group is consumed through a helper taking ThreadGroup<T> as a plain
// Iterable parameter: iteration protocol works through the interface type.
func consumeAll(group: Iterable<Int64>): Int64 {
    var sum = 0
    for (value in group) {
        sum += value
    }
    return sum
}

main(): Int64 {
    let sum = threadScope<Int64, Int64> {
        group =>
            group.launch { 1 }
            group.launch { 2 }
            group.launch { 3 }
            consumeAll(group)
    }
    return if (sum == 6) { 0 } else { 1 }
}
