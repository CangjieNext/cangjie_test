/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hasPendingCancellation finished

import std.sync.SyncCounter

main(): Int64 {
    let syncCounter = SyncCounter(1)
    let fut1 = spawn {
        syncCounter.waitUntilZero()
        if (Thread.currentThread.hasPendingCancellation) {
            return 0
        }
        return 1
    }

    let fut2 = spawn {
        let fut2_1 = spawn {
            syncCounter.waitUntilZero()
            if (Thread.currentThread.hasPendingCancellation) {
                return 1
            }
            return 0
        }
        syncCounter.waitUntilZero()
        fut2_1.get()
        if (Thread.currentThread.hasPendingCancellation) {
            return 0
        }
        return 1
    }

    let fut3 = spawn {
        let fut3_1 = spawn {
            syncCounter.waitUntilZero()
            if (Thread.currentThread.hasPendingCancellation) {
                return 0
            }
            return 1
        }
        fut3_1.cancel()
        syncCounter.waitUntilZero()
        if (Thread.currentThread.hasPendingCancellation) {
            return 1
        }
        fut3_1.get()
        return 0
    }

    let fut4 = spawn {
        syncCounter.waitUntilZero()
        if (Thread.currentThread.hasPendingCancellation) {
            return 1
        }
        return 0
    }

    fut1.cancel()
    fut2.cancel()
    syncCounter.dec()
    println("hasPendingCancellation finished")
    if (fut1.get() == 1 || fut2.get() == 1 || fut3.get() == 1 || fut4.get() == 1) {
        return 1
    }
    return 0
}
