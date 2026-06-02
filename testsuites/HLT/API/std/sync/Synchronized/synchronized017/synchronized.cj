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
import std.runtime.*
import std.argopt.*
import std.process

var sum: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    let future1: Future<Unit> = spawn {
        mtx.lock()
        sum.fetchAdd(1)
        mtx.unlock()
    }
    let res1: Unit = future1.get()
    let future2: Future<Unit> = spawn {
        synchronized(mtx) {
            sum.fetchAdd(1)
        }
    }
    let res2: Unit = future2.get()
    if (sum.load() != 2 || !mtx.tryLock()) {
        return 1
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
