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
// TEST INTENT: only the first failure is rethrown when all tasks fail
// DOC REF: threadScope - "Only the first Exception or Error is rethrown; the rest are silently discarded"
// EXPECT: caught exception is the FIRST failure ("task 0 failed"), all 4 finally blocks ran, exit 0

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let taskCount = 4
    let finishedCount = AtomicInt64(0)
    var caughtMessage = ""

    try {
        threadScope<Unit, Unit> {
            group =>
                group.launch {
                    try {
                        sleep(Duration.millisecond * 30)
                        throw Exception("task 0 failed")
                    } finally {
                        finishedCount.fetchAdd(1)
                    }
                }
                group.launch {
                    try {
                        sleep(Duration.millisecond * 60)
                        throw Exception("task 1 failed")
                    } finally {
                        finishedCount.fetchAdd(1)
                    }
                }
                group.launch {
                    try {
                        sleep(Duration.millisecond * 90)
                        throw Exception("task 2 failed")
                    } finally {
                        finishedCount.fetchAdd(1)
                    }
                }
                group.launch {
                    try {
                        sleep(Duration.millisecond * 120)
                        throw Exception("task 3 failed")
                    } finally {
                        finishedCount.fetchAdd(1)
                    }
                }
        }
    } catch (e: Exception) {
        caughtMessage = e.message
    }

    // The sleep ladder pins completion order, so task 0's failure is deterministically
    // the first one in the queue. Asserting the message proves the rethrown exception
    // is the FIRST failure, not an arbitrary or the last one.
    if (caughtMessage != "task 0 failed") {
        return 1
    }
    return if (finishedCount.load() == Int64(taskCount)) { 0 } else { 2 }
}
