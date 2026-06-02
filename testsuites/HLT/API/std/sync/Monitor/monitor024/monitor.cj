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
import std.collection.ArrayList
import std.runtime.*
import std.argopt.*
import std.process

var running: AtomicInt64 = AtomicInt64(0)
var awake: AtomicInt64 = AtomicInt64(0)
var exit: AtomicBool = AtomicBool(false)

main(): Int64 {
    var threads: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    let mtr: Monitor = Monitor()
    for (i in 0..200) {
        let future: Future<Unit> = spawn {
            mtr.lock()
            while (!exit.load()) {
                running.fetchAdd(1)
                mtr.wait()
                awake.fetchAdd(1)
            }
            mtr.unlock()
        }
        threads.add(future)
        while (running.load() != i + 1) {}
    }
    for (i in 0..200) {
        while (running.load() != 200) {}
        running.store(0)
        if (i == 199) {
            mtr.lock()
            exit.store(true)
            mtr.unlock()
        }
        if (awake.load() != 0) {
            return 1
        }
        mtr.lock()
        mtr.notifyAll()
        mtr.unlock()
        while (awake.load() != 200) {}
        awake.store(0)
    }
    if (running.load() != 0 || awake.load() != 0) {
        return 2
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
