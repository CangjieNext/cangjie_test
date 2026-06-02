/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*

var sum: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    let future1: Future<Unit> = spawn {
        mtx.lock()
        sum.fetchAdd(1)
    }
    let res1: Unit = future1.get()
    if (mtx.tryLock()) {
        return 1
    }
    let future2: Future<Unit> = spawn {
        synchronized(mtx) {
            sum.fetchAdd(1)
        }
    }
    try {
        future2.get(Duration.millisecond * 10)
        return 2
    } catch (e: TimeoutException) {
        ()
    }

    if (sum.load() != 1) {
        return 3
    }
    return 0
}
