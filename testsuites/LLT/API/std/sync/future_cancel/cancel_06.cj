/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan cancelled

/*
 * Test description: Test thread cancellation
 * Test API:
 *   - Future.cancel()
 *   - Thread.hasPendingCancellation
 */

internal import std.sync.AtomicInt64

main(): Unit {
    let flag = AtomicInt64(0)
    let fut = spawn {
        // Spin
        while (flag.load() == 0) {
        }
        if (Thread.currentThread.hasPendingCancellation) {
            println("cancelled")
            return
        }
    }
    for (_ in 0..100) {
        spawn {
            if (Thread.currentThread.hasPendingCancellation) {
                println("cancelled")
                return
            }
        }
    }
    fut.cancel()
    flag.store(1)
    fut.get()
}
