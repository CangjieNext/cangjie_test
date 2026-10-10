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
// TEST INTENT: iterator created before launch blocks until the late result arrives
// DOC REF: ThreadGroup.iterator - "the current thread blocks until a result is available"
// EXPECT: next() returns 99 launched 100ms after iterator creation, exit 0

import std.concurrent.*
import std.sync.*

// iterator().next() blocks until a result is available: the iterator is created
// before any task is launched, and next() waits for the late task's result.
main(): Int64 {
    let got = AtomicInt64(-1)
    threadScope<Int64, Unit> {
        group =>
            let iter = group.iterator()
            group.launch {
                sleep(Duration.millisecond * 100)
                99
            }
            match (iter.next()) {
                case Some(value) => got.store(value)
                case None => ()
            }
    }
    return if (got.load() == 99) { 0 } else { 1 }
}
