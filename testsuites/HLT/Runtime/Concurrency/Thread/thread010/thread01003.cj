/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// ASSERT: scan-2 thread id = 1
// ASSERT: scan-2 thread id = 2
// ASSERT: scan-2 thread id = 3

import std.sync.SyncCounter

main(): Int64 {
    let ct = Thread.currentThread
    let fut1 = spawn {
        println("thread id = ${Thread.currentThread.id}")
        println("thread id = ${ct.id}")
    }

    let fut2 = spawn {
        println("thread id = ${Thread.currentThread.id}")
        println("thread id = ${ct.id}")
    }
    fut1.get()
    fut2.get()

    println("thread id = ${fut1.thread.id}")
    println("thread id = ${fut2.thread.id}")

    return 0
}
