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
// TEST INTENT: fn returning early leaves remaining values silently drained
// DOC REF: threadScope - "Task values that have not been consumed inside fn are consumed and discarded"
// EXPECT: 3 tasks ran, scope returns fn value, exit 0

import std.concurrent.*
import std.sync.*

// fn returns early after partially consuming the group: remaining unconsumed
// task values are drained and silently discarded while threadScope is waiting,
// and the scope still returns fn's value (funcs.md paragraph 1).
main(): Int64 {
    let drained = AtomicInt64(0)
    let holder = AtomicInt64(0)
    let r = threadScope<Int64, Int64> {
        group =>
            group.launch { drained.fetchAdd(1); 10 }
            group.launch { drained.fetchAdd(1); 20 }
            group.launch { drained.fetchAdd(1); 30 }
            let iter = group.iterator()
            match (iter.next()) {
                case Some(value) => holder.store(value)
                case None => ()
            }
            holder.load()
    }
    if (drained.load() != 3) {
        return 1
    }
    return if (r == holder.load()) { 0 } else { 2 }
}
