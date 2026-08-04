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

import std.fs.*

let testName = "IOInstensive"

func removeAllIOInstensiveTestFiles(tasks: Int64): Unit {
    for (i in 0..tasks) {
        let fileName = "temp${i}.txt"
        if (exists(fileName)) {
            remove(fileName)
        }
    }
}

func testFunc(rep: Int64, threads: Int64): Unit {
    let tasks = 1000
    let arr = Array<UInt8>(1024 * 100, repeat: 66) // The length of the string is 100 KB and the content is B
    removeAllIOInstensiveTestFiles(tasks)
    for (k in 0..rep) {
        let wg = WaitGroup(threads)
        for (i in 0..threads) {
            let future = spawn {
                for (j in 0..(tasks / threads)) {
                    File.writeTo("temp${j*threads+i}.txt", arr)
                }
                wg.done()
            }
        }
        wg.wait()
        removeAllIOInstensiveTestFiles(tasks)
    }
}

func benchmark(rep: Int64, threads: Int64): Unit {
    concurrencyBenchmark(testName, testFunc, rep, threads)
}

main(): Int64 {
    benchmark(10, 1)
    benchmark(10, 10)
    benchmark(10, 100)
    benchmark(10, 1000)
    return 0
}
