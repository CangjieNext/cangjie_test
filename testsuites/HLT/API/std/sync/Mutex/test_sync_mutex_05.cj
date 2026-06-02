/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.argopt.*
import std.process

var running: AtomicInt64 = AtomicInt64(0)
var done: AtomicBool = AtomicBool(false)

main(): Int64 {
    for (i in 0..100) {
        running.store(0)
        let mutex: Mutex = Mutex()
        mutex.lock()
        let con: Condition = mutex.condition()
        mutex.unlock()
        let future: Future<Unit> = spawn {
            mutex.lock()
            running.fetchAdd(1)
            con.wait()
            mutex.unlock()
            running.fetchAdd(1)
        }
        while (running.load() != 1) {}
        mutex.lock()
        mutex.unlock()
        done.store(false)
        spawn {
            mutex.lock()
            con.notifyAll()
            mutex.unlock()
        }
        spawn {
            mutex.lock()
            while (!done.load()) {
                con.wait()
            }
            mutex.unlock()
        }
        let res: Unit = future.get()
        if (running.load() != 2) {
            return 1
        }
        mutex.lock()
        done.store(true)
        mutex.unlock()
        mutex.lock()
        con.notifyAll()
        mutex.unlock()
        gc()
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        gc()
        sleep(Duration.second * 2)
    }
    return 0
}
