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
// TEST INTENT: multiple tasks consumed via for-in sum to 60
// DOC REF: ThreadGroup Iterable<T> - iteration waits and yields results
// EXPECT: sum == 60, exit 0

import std.concurrent.*

main(): Int64 {
    let sum = threadScope<Int64, Int64> {
        group =>
            group.launch { 10 }
            group.launch { 20 }
            group.launch { 30 }

            var total = 0
            for (value in group) {
                total += value
            }
            total
    }
    return if (sum == 60) { 0 } else { 1 }
}
