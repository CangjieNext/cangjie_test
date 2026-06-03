/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./the_class.cj
// EXEC: %compiler %cmp_opt %f ./the_class.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.common.*

let done = Barrier(2)

func testReadWriteLock(): Unit {
    const count = 100
    let rwLock = ReadWriteLock()
    let arr = ArrayList<Future<Unit>>()
    let sb = StringBuilder()
    for (i in 0..count) {
        arr.add(spawn {
            let rl = rwLock.readLock
            rl.lock()
            println("thread#${i} read: ${sb.toString()}")
            sleep(Duration.nanosecond * 2)
            rl.unlock()
        })
        arr.add(spawn {
            let rl = rwLock.writeLock
            rl.lock()
            sb.append("${i}")
            println("thread#${i} write: ${sb.toString()}")
            sleep(Duration.nanosecond * 2)
            rl.unlock()
        })
    }
    for (f in arr) {
        f.get()
    }
    done.wait()
}

main(): Unit {
    let c = C(testReadWriteLock)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    done.wait()
}
