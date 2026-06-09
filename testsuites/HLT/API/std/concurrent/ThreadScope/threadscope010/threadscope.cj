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

import std.concurrent.*
import std.sync.*

main(): Int64 {
    let taskCount = 4
    let finishedCount = AtomicInt64(0)
    var caughtException = false

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
        caughtException = true
    }

    if (!caughtException) {
        return 1
    }
    return if (finishedCount.load() == Int64(taskCount)) { 0 } else { 2 }
}
