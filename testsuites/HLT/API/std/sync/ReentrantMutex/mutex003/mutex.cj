/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

func HammerMutex(mtx: ReentrantMutex, loops: Int64): Bool {
    for (i in 0..loops) {
        if (i % 3 == 0) {
            if (mtx.tryLock()) {
                mtx.unlock()
            }
            continue
        }
        mtx.lock()
        mtx.unlock()
        GC()
    }
    true
}

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    mtx.lock()
    if (!mtx.tryLock()) {
        return 1
    }
    mtx.unlock()
    if (!mtx.tryLock()) {
        return 2
    }
    mtx.unlock()
    mtx.unlock()
    for (i in 0..10) {
        if (!HammerMutex(mtx, 1000)) {
            return 3
        }
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
