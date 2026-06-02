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

func test(): Unit {
    let mtx: ReentrantMutex = ReentrantMutex()
    synchronized(mtx) {
        sum.fetchAdd(1)
    }
}

main(): Int64 {
    var threads: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    for (i in 0..1000) {
        threads.add(spawn {
            test()
        })
    }
    for (i in threads) {
        i.get()
    }
    if (sum.load() != 1000) {
        return 1
    }
    asanGC()
    return 0
}
