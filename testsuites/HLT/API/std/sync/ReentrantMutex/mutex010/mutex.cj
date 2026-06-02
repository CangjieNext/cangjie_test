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
import std.runtime.*
import std.argopt.*
import std.process
import asan.*

var sum: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    var future1: Future<Unit> = spawn {
        mtx.lock()
        sum.fetchAdd(1)
        throw Exception()
        mtx.unlock()
    }
    try {
        future1.get()
        asanGC()
        return 1
    } catch (_) {
    }
    var future2: Future<Unit> = spawn {
        if (mtx.tryLock()) {
            sum.fetchAdd(1)
            mtx.unlock()
        }
    }
    let res2: Unit = future2.get()
    if (sum.load() != 1 || mtx.tryLock()) {
        asanGC()
        return 1
    }
    asanGC()
    return 0
}
