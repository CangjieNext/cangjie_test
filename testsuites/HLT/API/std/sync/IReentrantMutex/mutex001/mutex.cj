/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.collection.ArrayList
import std.runtime.*
import std.argopt.*
import std.process
import asan.*

var sum: AtomicInt64 = AtomicInt64(0)
let mtx: ReentrantMutex = ReentrantMutex()

class NewReentrantMutex <: IReentrantMutex {
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
        var future: Future<Unit> = spawn {
            for (i in 0..10) {
                mtxNew.lock()
                sum.fetchAdd(1)
                mtxNew.unlock()
            }
        }
        threads.add(future)
    }
    for (i in threads) {
        let res = i.get()
    }
    if (sum.load() != 10000 || !mtxNew.tryLock()) {
        return 1
    }
    asanGC()
    return 0
}
