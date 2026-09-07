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
// TEST INTENT: R = ArrayList<Int64>: results gathered into a collection inside fn
// DOC REF: threadScope Returns R - The return value of fn
// EXPECT: size == 10 and sum of squares == 285, exit 0

import std.collection.ArrayList
import std.concurrent.*
import std.sync.*

// A collection as the scope's result type R: ten tasks' results are gathered
// into an ArrayList inside fn and returned after the group is drained.
main(): Int64 {
    let collected = threadScope<Int64, ArrayList<Int64>> {
        group =>
            for (i in 0..10) {
                group.launch { i * i }
            }
            let results = ArrayList<Int64>()
            for (value in group) {
                results.add(value)
            }
            results
    }
    if (collected.size != 10) {
        return 1
    }
    var sum = 0
    for (value in collected) {
        sum += value
    }
    return if (sum == 285) { 0 } else { 2 }
}
