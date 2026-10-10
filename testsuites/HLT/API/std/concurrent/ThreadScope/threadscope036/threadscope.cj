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
// TEST INTENT: two iterators used sequentially hand off the result stream
// DOC REF: ThreadGroup warning - concurrent iteration is not supported; sequential use is
// EXPECT: both iterators consume one result each, exit 0

import std.concurrent.*
import std.sync.*

// Two iterators on the same group used sequentially (never concurrently):
// each takes over the remaining stream and together they consume all results.
// Concurrent iteration over a single group is explicitly not supported; this
// covers the supported sequential hand-off pattern.
main(): Int64 {
    let seen = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 1 }
            group.launch { 2 }
            let first = group.iterator()
            let firstResult = first.next()
            match (firstResult) {
                case Some(_) => seen.fetchAdd(1)
                case None => seen.fetchAdd(0)
            }
            let second = group.iterator()
            let secondResult = second.next()
            match (secondResult) {
                case Some(_) => seen.fetchAdd(1)
                case None => seen.fetchAdd(0)
            }
    }
    return if (seen.load() == 2) { 0 } else { 1 }
}
