/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan num1 = 0
// ASSERT: scan num2 = 99990000

import std.sync.SyncCounter
import std.collection.*
import std.sync.*

var num1 = AtomicInt64(0)
var num2 = AtomicInt64(0)

main(): Unit {
    let syncCounter = SyncCounter(1)
    var fut = ArrayList<Future<Unit>>()

    for (i in 0..10000) {
        fut.add(spawn {
            syncCounter.waitUntilZero()
            if (Thread.currentThread.hasPendingCancellation) {
                num2.fetchAdd(i + i)
                return
            }
            num1.fetchAdd(i)
            println("hello_${i}")
        })
    }

    for (i in 0..10000) {
        fut[i].cancel()
    }
    syncCounter.dec()

    for (i in 0..10000) {
        fut[i].get()
    }

    let val1 = num1.load()
    println("num1 = ${val1}")

    let val2 = num2.load()
    println("num2 = ${val2}")
}
