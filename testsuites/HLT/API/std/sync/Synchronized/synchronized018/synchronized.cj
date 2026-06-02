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
    spawn {
        synchronized(mtx) {
            sum.fetchAdd(1)
            while (true) {}
        }
    }
    let future: Future<Unit> = spawn {
        while (sum.load() != 1) {}
        if (!mtx.tryLock()) {
            sum.fetchAdd(1)
            ()
        } else {
            mtx.unlock()
        }
    }
    let res: Unit = future.get()
    if (sum.load() != 2 || mtx.tryLock()) {
        return 1
    }
    return 0
}
