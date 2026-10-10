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
// TEST INTENT: nested threadScope scopes drain independently
// DOC REF: threadScope - prohibition covers spawn, not nested scopes
// EXPECT: outer sum 1 + inner sum 2 == 3, exit 0

import std.concurrent.*
import std.sync.*

// Nested threadScope: an inner scope runs inside the outer fn, each with its
// own group; both drain independently and results aggregate correctly.
// (Only `spawn` is prohibited inside a threadScope, not nested scopes.)
main(): Int64 {
    let total = threadScope<Int64, Int64> {
        outer =>
            outer.launch { 1 }
            let innerSum = threadScope<Int64, Int64> {
                inner =>
                    inner.launch { 2 }
                    var sum = 0
                    for (value in inner) {
                        sum += value
                    }
                    sum
            }
            var outerSum = 0
            for (value in outer) {
                outerSum += value
            }
            outerSum + innerSum
    }
    return if (total == 3) { 0 } else { 1 }
}
