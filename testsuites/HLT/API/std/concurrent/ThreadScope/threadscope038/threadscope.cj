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
// TEST INTENT: T = Unit and T = user-defined class result types
// DOC REF: ThreadGroup<T> generic over any T
// EXPECT: 3 Unit results counted; Box payloads sum to 30, exit 0

import std.concurrent.*
import std.sync.*

// Result types beyond Int64: Unit tasks are counted through for-in, and a
// user-defined class type flows through launch and consumption with its
// payload intact.
class Box {
    public let value: Int64
    public init(value: Int64) {
        this.value = value
    }
}

main(): Int64 {
    let unitCount = AtomicInt64(0)
    threadScope<Unit, Unit> {
        group =>
            group.launch { () }
            group.launch { () }
            group.launch { () }
            for (_ in group) {
                unitCount.fetchAdd(1)
            }
    }
    if (unitCount.load() != 3) {
        return 1
    }

    let boxSum = AtomicInt64(0)
    threadScope<Box, Unit> {
        group =>
            group.launch { Box(10) }
            group.launch { Box(20) }
            for (box in group) {
                boxSum.fetchAdd(box.value)
            }
    }
    return if (boxSum.load() == 30) { 0 } else { 2 }
}
