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

func test(count: Int64): Future<Unit> {
    let mtx: ReentrantMutex = ReentrantMutex()
    var future: Future<Unit> = spawn {
        if (count > 0) {
            var future: Future<Unit> = test(count - 1)
            for (i in 0..count) {
                mtx.lock()
                sum.fetchAdd(1)
            }
            for (i in 0..count) {
                mtx.unlock()
            }
            let res: Unit = future.get()
        }
    }
    return future
}

main(): Int64 {
    var future: Future<Unit> = test(1000)
    let res: Unit = future.get()
    if (sum.load() != 500500) {
        return 1
    }
    asanGC()
    return 0
}
