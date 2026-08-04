/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.random.*
import std.collection.*
import std.collection.concurrent.*
import std.runtime.*
import std.sync.*
import std.time.*
import std.fs.*
import std.io.*
import std.net.*
import std.process.*


class Load {
    let buffer = Random()
}

class Test {
    var test: Int32 = Int32(0)
}

let count_full = AtomicInt64(0)

func recursive(deep: Int64): Unit {
    if (deep <= 0) {
        let n = count_full.fetchAdd(1)
        if (n % 100 == 0) {
            GC()
        }
        return
    }
    let futures = ArrayList<Future<Unit>>()
    let N = 10
    for (i in 0..N) {
        let f = spawn {
            let load = Load()
            let temp = load.buffer.nextInt32(2)
            recursive(deep - 1)
        }
        futures.add(f)
    }
    for (f in futures) {
        f.get()
    }
}



func class_traverse() {
    let atomic = AtomicInt32(0)
    let syncCounter = SyncCounter(1)
    let className = ArrayList<Random>()
    var fut = ArrayList<Future<Unit>>()
    let NUM = 250
    for (_ in 0..NUM) {
        className.add(Random())
    }

    for (i in 0..NUM) {
        fut.add(
            spawn {
            var tmp_i = i
            syncCounter.waitUntilZero()
            let tmp = className[tmp_i].nextInt32(2)

            var tmp_a: Int32 = Int32(tmp_i)
            var tmp_b: Int32 = Int32(tmp_i)
            sleep(Duration.Zero)
            if (tmp_a != tmp_b) {
                atomic.fetchAdd(1)
            }
        })
    }
    syncCounter.dec()
    sleep(Duration.second * 5)
    var test_a = Test()
    for (i in 0..NUM) {
        let tmp = className[i].nextInt32(2)

        var test_b = Test()
        test_b.test = Int32(i)
        if (i != 0 && test_a.test == test_b.test) {
            println("test_a.test == test_b.test")
            return 1
        }
        test_a = test_b
    }

    var count = atomic.load()
    if (count > 0) {
        println("tmp_a != tmp_b")
        return 1
    }
    return 0
}

main(): Unit {
    var start_total = DateTime.now()

    let classResult = class_traverse()
    if (classResult != 0) {
        println("classResult != 0")
        return
    }

    recursive(3)
    if (count_full.load() != 10 * 10 * 10 ) {
        println("count_full.load() != 10 * 10 * 10 ")
        return
    }

    var cost_total = (DateTime.now() - start_total).toNanoseconds()
    println("classRandom: ms = ${ Float64(cost_total) / 1000000.0 }")
    return
}
