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
// TEST INTENT: exhausted iterator returns None after all results are consumed
// DOC REF: ThreadGroup.iterator - next blocks, yields results, then None
// EXPECT: results 2,1 in completion order then None, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let first = AtomicInt64(0)
    let second = AtomicInt64(0)
    let exhausted = AtomicBool(false)
    threadScope<Int64, Unit> {
        group =>
            group.launch { sleep(Duration.millisecond * 30); 1 }
            group.launch { sleep(Duration.millisecond * 10); 2 }

            let iter = group.iterator()
            match (iter.next()) {
                case Some(value) => first.store(value)
                case None => exhausted.store(true)
            }
            match (iter.next()) {
                case Some(value) => second.store(value)
                case None => exhausted.store(true)
            }
            match (iter.next()) {
                case Some(_) => exhausted.store(false)
                case None => exhausted.store(true)
            }
    }
    if (first.load() != 2 || second.load() != 1) {
        return 2
    }
    return if (exhausted.load()) { 0 } else { 3 }
}
