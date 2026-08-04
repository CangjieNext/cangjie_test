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


import std.collection.concurrent.*
import std.time.*
import std.convert.*

let ops = 1024 * 1024 * 16
let threads = [4, 8, 16, 32, 256, 1024]

func perThreadCode(t: Int64, n: Int64, cmap: ConcurrentHashMap<Int64, Int64>) {
    var k = (t + 1573) & 127
    for(i in 0..n) {
        match(cmap.putIfAbsent(k, 1)) {
            case Some(v) => cmap.replace(k, k + i + 1)
            case None => None<Int64>
        }
        k = (k + 7) & 127
    }
}

func performance(ts: Int64, cmap: ConcurrentHashMap<Int64, Int64>): Unit {
    let startTime = DateTime.now()
    var fs = Array<Future<Unit>>(ts) { t =>
        spawn { perThreadCode(t, ops / ts, cmap) }
    }
    for(i in 0..ts) {
        fs[i].get()
    }
    let endTime = DateTime.now()
    let perTime = (endTime - startTime).toNanoseconds()
    println("BenchmarkCHM_UpdateElement_Thread_${ts}: ${perTime} ns/op")
}

main() {
    for(ts in threads) {
        let cmap = ConcurrentHashMap<Int64, Int64>(concurrencyLevel: ts)
        performance(ts, cmap)
    }
}