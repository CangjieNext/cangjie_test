/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: Concurrency.cj WaitGroup.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f Concurrency.cj WaitGroup.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args

import std.sync.*

let testName = "Condition"

func testFunc(rep: Int64, threads: Int64): Unit {
    let monitors = Array<Monitor>(rep, {i => Monitor()})
    let vars = Array<Int64>(rep, repeat: 0)
    spawn {
        for (i in 0..rep) {
            monitors[i].lock()
            vars[i] = rep
            monitors[i].notify()
            monitors[i].unlock()
        }
    }
    for (i in 0..rep) {
        monitors[i].lock()
        while (vars[i] != rep) {
            monitors[i].wait()
        }
        monitors[i].unlock()
    }
}

func benchmark(rep: Int64, threads: Int64): Unit {
    concurrencyBenchmark(testName, testFunc, rep, threads)
}

main(): Int64 {
    benchmark(1000000, 1)
    return 0
}
