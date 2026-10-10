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
// TEST INTENT: explicit iteration counts values and failures exactly
// DOC REF: ThreadGroup.iterator - each result consumed once; failures rethrown at consumption
// EXPECT: 2 Some + 1 rethrown failure from 3 launches, exit 0

import std.concurrent.*
import std.sync.*

// Mixed value and failure results fully consumed by explicit iteration: each
// value yields Some and each failure rethrows exactly once - 2 values plus
// 1 failure from 3 launches, nothing lost or duplicated.
main(): Int64 {
    let someCount = AtomicInt64(0)
    let errCount = AtomicInt64(0)
    try {
        threadScope<Int64, Unit> {
            group =>
                group.launch { 1 }
                group.launch {
                    throw IllegalArgumentException("f")
                }
                group.launch { 2 }
                let iter = group.iterator()
                while (true) {
                    try {
                        match (iter.next()) {
                            case Some(_) => someCount.fetchAdd(1)
                            case None => break
                        }
                    } catch (e: IllegalArgumentException) {
                        errCount.fetchAdd(1)
                    }
                }
        }
    } catch (e: Exception) {
        return 1
    }
    if (someCount.load() != 2 || errCount.load() != 1) {
        return 2
    }
    return 0
}
