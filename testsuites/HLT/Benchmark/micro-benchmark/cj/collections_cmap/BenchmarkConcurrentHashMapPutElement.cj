/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args
// TIMEOUT: 2400

import std.collection.concurrent.*
import std.time.*
import std.random.*
import std.convert.*
import std.math.*

let threads = [4, 8, 16, 32, 256, 1024]
let tasks = 10000

func perThreadCode(tasks: Int64, myMap: ConcurrentHashMap<UInt64, Int64>) {
    let random = Random()
    for (j in 0..tasks) {
        myMap.put(random.nextUInt64(), j)
    }
}

func writeTest(thread: Int64): Unit {
    let myMap = ConcurrentHashMap<UInt64, Int64>(concurrencyLevel: max(thread, 16))
    let startTime = DateTime.now()
    var fs = Array<Future<Unit>>(thread) { _ =>
        spawn { perThreadCode(tasks, myMap) }
    }
    for (i in 0..thread) {
        fs[i].get()
    }
    let endTime = DateTime.now()
    let perTime = (endTime - startTime).toNanoseconds()
    println("BenchmarkCHM_PutElement_Thread_${thread}: ${perTime} ns/op")
}

main() {
    for (thread in threads) {
        writeTest(thread)
    }
}