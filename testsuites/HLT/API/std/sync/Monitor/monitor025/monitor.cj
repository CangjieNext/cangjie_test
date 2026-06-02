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
    let mtr: Monitor = Monitor()
    let future1: Future<Unit> = spawn {
        mtr.lock()
        sum.store(1)
        mtr.wait()
        if (sum.load() != 2) {
            throw Exception()
        }
        sum.store(3)
        mtr.notify()
        mtr.unlock()
    }
    let future2: Future<Unit> = spawn {
        while (sum.load() < 1) {}
        mtr.lock()
        while (true) {
            if (sum.load() == 1) {
                sum.store(2)
                mtr.notify()
                break
            }
            mtr.unlock()
            sleep(Duration.Zero)
            mtr.lock()
        }
        mtr.unlock()
    }
    let future3: Future<Unit> = spawn {
        while (sum.load() < 3) {}
        mtr.lock()
        while (true) {
            if (sum.load() == 2) {
                mtr.notify()
                if (sum.load() != 3) {
                    throw Exception()
                }
                break
            }
            if (sum.load() == 3) {
                break
            }
            mtr.unlock()
            sleep(Duration.Zero)
            mtr.lock()
        }
        mtr.unlock()
    }
    let res1: Unit = future1.get()
    let res2: Unit = future2.get()
    let res3: Unit = future3.get()
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
