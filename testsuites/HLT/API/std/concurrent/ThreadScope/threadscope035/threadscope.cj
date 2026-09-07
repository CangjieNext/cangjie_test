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
// TEST INTENT: a previously obtained iterator keeps receiving newly launched results
// DOC REF: ThreadGroup.iterator - iterator is backed by the group's result queue
// EXPECT: same iterator yields 1 then 2 across an interleaved launch, exit 0

import std.concurrent.*
import std.sync.*

// Results keep flowing to a previously obtained iterator: after partially
// consuming, a new launch's result is delivered by the same iterator (the
// iterator is backed by the group's shared result queue).
main(): Int64 {
    let total = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 1 }
            let iter = group.iterator()
            match (iter.next()) {
                case Some(value) => total.fetchAdd(value)
                case None => total.fetchAdd(0)
            }
            group.launch { 2 }
            match (iter.next()) {
                case Some(value) => total.fetchAdd(value)
                case None => total.fetchAdd(0)
            }
    }
    return if (total.load() == 3) { 0 } else { 1 }
}
