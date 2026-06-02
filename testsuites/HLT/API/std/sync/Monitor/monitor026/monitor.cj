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
var done: AtomicBool = AtomicBool(false)

main(): Int64 {
    for (i in 0..1000) {
        running.store(0)
        let mtr: Monitor = Monitor()
        let future: Future<Unit> = spawn {
            mtr.lock()
            running.fetchAdd(1)
            mtr.wait()
            mtr.unlock()
            running.fetchAdd(1)
        }
        while (running.load() != 1) {}
        mtr.lock()
        mtr.unlock()
        done.store(false)
        spawn {
            mtr.lock()
            mtr.notifyAll()
            mtr.unlock()
        }
        spawn {
            mtr.lock()
            while (!done.load()) {
                mtr.wait()
            }
            mtr.unlock()
        }
        let res: Unit = future.get()
        if (running.load() != 2) {
            return 1
        }
        mtr.lock()
        done.store(true)
        mtr.unlock()
        mtr.lock()
        mtr.notifyAll()
        mtr.unlock()
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
