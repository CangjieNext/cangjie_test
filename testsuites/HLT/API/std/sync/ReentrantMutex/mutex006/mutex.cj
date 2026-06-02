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

func isDone(future: Future<Unit>): Bool {
    try {
        future.get(Duration.nanosecond * 1)
        return true
    } catch (_: TimeoutException) {
        return false
    }
}

main(): Int64 {
    let mtx: ReentrantMutex = ReentrantMutex()
    var future1: Future<Unit> = spawn {
        mtx.lock()
        sleep(Duration.microsecond * 100)
        mtx.unlock()
    }
    var future2: Future<Unit> = spawn {
        for (i in 0..10) {
            sleep(Duration.microsecond * 100)
            mtx.lock()
            mtx.unlock()
        }
    }
    var future3: Future<Unit> = spawn {
        sleep(Duration.second)
    }
    while (!isDone(future3)) {
        if (isDone(future1) && isDone(future2)) {
            let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
            let map = ao.getArgumentsMap()
            if (map.contains("--asan")) {
                sleep(Duration.second * 2)
                GC()
                sleep(Duration.second * 2)
            }
            return 0
        }
    }
    return 1
}
