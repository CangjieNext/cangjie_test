// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime semaphore pass

import std.sync.*
import std.runtime.*
import std.collection.*

func testBasicSemaphore(): Bool {
    let sem = Semaphore(1)
    sem.acquire()
    sem.release()
    true
}

func testMultiAcquireRelease(): Bool {
    let sem = Semaphore(3)
    sem.acquire()
    sem.acquire()
    sem.acquire()
    sem.release()
    sem.release()
    sem.release()
    true
}

func testConcurrentSemaphore(): Bool {
    let sem = Semaphore(2)
    let counter = AtomicInt64(0)
    let futures = ArrayList<Future<Unit>>()

    for (_ in 0..10) {
        futures.add(spawn { =>
            sem.acquire()
            counter.fetchAdd(1)
            sleep(10 * Duration.millisecond)
            counter.fetchAdd(-1)
            sem.release()
        })
    }
    for (f in futures) { f.get() }
    counter.load() == 0
}

main(): Int64 {
    if (!testBasicSemaphore()) { return 1 }
    if (!testMultiAcquireRelease()) { return 2 }
    if (!testConcurrentSemaphore()) { return 3 }
    println("runtime semaphore pass")
    0
}
