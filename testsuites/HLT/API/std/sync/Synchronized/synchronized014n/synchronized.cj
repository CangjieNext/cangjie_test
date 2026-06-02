/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.*
import std.collection.ArrayList

var sum: AtomicInt64 = AtomicInt64(0)

class NewReentrantMutex <: IReentrantMutex {
    let mtx: ReentrantMutex = ReentrantMutex()

    public func lock(): Unit {
        mtx.lock()
    }
    public func tryLock(): Bool {
        mtx.tryLock()
    }
    public func unlock(): Unit {
        mtx.unlock()
    }
}

main(): Int64 {
    var threads: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    let mtxNew: NewReentrantMutex = NewReentrantMutex()
    for (i in 0..1000) {
        threads.add(spawn {
            synchronized(mtxNew) {
                sum.fetchAdd(1)
            }
        })
    }
    for (i in threads) {
        i.get()
    }
    if (sum.load() != 1000) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_mismatched_types
