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

func testBarrier(): Unit {
    const count = 3
    let b = Barrier(count)
    let arr = ArrayList<Future<Unit>>()
    for (i in 0..count) {
        arr.add(spawn {
            println("thread #${i} before")
            sleep(Duration.second * 2)
            println("thread #${i} barrier")
            b.wait()
            println("thread #${i} continuing")
        })
    }
    for (f in arr) {
        f.get()
    }
    done.wait()
}

main(): Unit {
    let c = C(testBarrier)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    done.wait()
}
