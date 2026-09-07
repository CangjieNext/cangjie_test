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
// TEST INTENT: T = Option<Int64>: Some and None results are classified on consumption
// DOC REF: ThreadGroup<T> generic over any T
// EXPECT: someCount == 1 and noneCount == 1, exit 0

import std.concurrent.*
import std.sync.*

// Option<Int64> as the result type T: both Some and None results flow through
// the group and are classified during consumption.
main(): Int64 {
    let someCount = AtomicInt64(0)
    let noneCount = AtomicInt64(0)
    threadScope<Option<Int64>, Unit> {
        group =>
            group.launch { Some(1) }
            group.launch { Option<Int64>.None }
            for (value in group) {
                match (value) {
                    case Some(_) =>
                        someCount.fetchAdd(1)
                    case None =>
                        noneCount.fetchAdd(1)
                }
            }
    }
    if (someCount.load() != 1 || noneCount.load() != 1) {
        return 1
    }
    return 0
}
