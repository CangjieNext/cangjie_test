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
// TEST INTENT: exhausted iterator keeps returning None on repeated next()
// DOC REF: ThreadGroup.iterator - "If no unconsumed task results remain, next returns None"
// EXPECT: exactly 2 None calls after one consumed value, exit 0

import std.concurrent.*
import std.sync.*

// Repeated exhaustion: after the group is fully consumed, further next()
// calls on the same iterator keep returning None (014 checks a single None).
main(): Int64 {
    let noneCount = AtomicInt64(0)
    threadScope<Int64, Unit> {
        group =>
            group.launch { 7 }
            let iter = group.iterator()
            let one = iter.next()
            match (one) {
                case Some(_) => noneCount.fetchAdd(0)
                case None => noneCount.fetchAdd(1)
            }
            let two = iter.next()
            match (two) {
                case Some(_) => noneCount.fetchAdd(0)
                case None => noneCount.fetchAdd(1)
            }
            let three = iter.next()
            match (three) {
                case Some(_) => noneCount.fetchAdd(0)
                case None => noneCount.fetchAdd(1)
            }
    }
    return if (noneCount.load() == 2) { 0 } else { 1 }
}
