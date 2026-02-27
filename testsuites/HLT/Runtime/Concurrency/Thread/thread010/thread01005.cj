/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ct1.id: 1, ct1.name:
// ASSERT: scan ct2.id: 1, ct2.name: test1
// ASSERT: scan-4 ct.id: 1, ct.name: test2
// ASSERT: scan fut1.id: 2, fut1.name: fut111
// ASSERT: scan fut2.id: 3, fut2.name: fut222

import std.sync.SyncCounter

main(): Int64 {
    let ct1 = Thread.currentThread
    let ct2 = Thread.currentThread
    let ct4 = ct1

    let fut1 = spawn {
        println("id: ${Thread.currentThread.id}, name: ${Thread.currentThread.name}")
        println("ct1.id: ${ct1.id}, ct1.name: ${ct1.name}")
        ct1.name = "test1"
        Thread.currentThread.name = "fut1"
        Thread.currentThread.name = "fut11"
        Thread.currentThread.name = "fut111"
    }
    fut1.get()
    let fut2 = spawn {
        println("id: ${Thread.currentThread.id}, name: ${Thread.currentThread.name}")
        println("ct2.id: ${ct2.id}, ct2.name: ${ct2.name}")
        ct2.name = "test2"
        Thread.currentThread.name = "fut2"
        Thread.currentThread.name = "fut22"
        Thread.currentThread.name = "fut222"
    }
    fut2.get()
    let ct3 = Thread.currentThread
    println("ct.id: ${ct1.id}, ct.name: ${ct1.name}")
    println("ct.id: ${ct2.id}, ct.name: ${ct2.name}")
    println("ct.id: ${ct3.id}, ct.name: ${ct3.name}")
    println("ct.id: ${ct4.id}, ct.name: ${ct4.name}")
    println("fut1.id: ${fut1.thread.id}, fut1.name: ${fut1.thread.name}")
    println("fut2.id: ${fut2.thread.id}, fut2.name: ${fut2.thread.name}")
    return 0
}
