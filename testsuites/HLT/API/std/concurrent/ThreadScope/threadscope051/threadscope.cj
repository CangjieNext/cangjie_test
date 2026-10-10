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
// TEST INTENT: for-in over an empty group runs zero iterations
// DOC REF: Iterable<T> semantics with no launched tasks
// EXPECT: iteration count == 0, exit 0

import std.concurrent.*
import std.sync.*

// Empty group iteration: for-in over a group with zero launched tasks runs
// zero iterations and the scope completes normally with fn's value.
main(): Int64 {
    let iterations = AtomicInt64(-1)
    threadScope<Int64, Unit> {
        group =>
            var count = 0
            for (value in group) {
                count += 1
            }
            iterations.store(count)
    }
    return if (iterations.load() == 0) { 0 } else { 1 }
}
