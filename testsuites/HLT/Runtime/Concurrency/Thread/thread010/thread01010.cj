/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
// (CJNATIVE) ASSERT: scan-2 thread id = 2
// (not CJNATIVE) ASSERT: scan-2 thread id = 1

import std.sync.SyncCounter

class A {
    var a = 1
}

main(): Int64 {
    let a = A()
    let fut1 = spawn {
        println("thread id = ${Thread.currentThread.id}")
    }
    fut1.get()
    let thread1 = fut1.thread
    println("thread id = ${thread1.id}")
    return 0
}
