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
// TEST INTENT: breaking out of for-in leaves remaining values to the implicit drain
// DOC REF: threadScope - unconsumed values are consumed and discarded
// EXPECT: fn returns 100 after first result, exit 0

import std.concurrent.*
import std.sync.*

// break out of a for-in over the group after the first result: the remaining
// unconsumed values are drained silently at scope end and fn's value is
// returned unchanged.
main(): Int64 {
    let seen = AtomicBool(false)
    let result = threadScope<Int64, Int64> {
        group =>
            group.launch { 1 }
            group.launch { 2 }
            group.launch { 3 }
            for (value in group) {
                seen.store(true)
                break
            }
            100
    }
    if (!seen.load()) {
        return 1
    }
    return if (result == 100) { 0 } else { 2 }
}
