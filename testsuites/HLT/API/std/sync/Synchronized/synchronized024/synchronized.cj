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

var running: AtomicInt64 = AtomicInt64(0)
var awake: AtomicInt64 = AtomicInt64(0)

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    let future: Future<Int64> = spawn {
        synchronized(mtx) {
            return running.fetchAdd(1)
            awake.fetchAdd(1)
        }
    }
    let res: Int64 = future.get()
    if (running.load() != 1 || awake.load() != 0 || !mtx.tryLock()) {
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
