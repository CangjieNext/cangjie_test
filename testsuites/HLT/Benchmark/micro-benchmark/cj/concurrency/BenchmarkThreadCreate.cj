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

let testName = "ThreadCreate"

func testFunc(rep: Int64, threads: Int64): Unit {
    for ( i in 0..rep)
    {
        for ( j in 0..threads)
        {
            spawn {}
        }
    }
}

func benchmark(rep: Int64, threads: Int64): Unit {
    concurrencyBenchmark(testName, testFunc, rep, threads)
}

main(): Int64 {
    benchmark(45000, 64)
    benchmark(22000, 128)
    benchmark(10000, 256)
    benchmark(5500, 512)
    benchmark(2700, 1024)
    benchmark(2800, 2048)
    benchmark(700, 4096)
    benchmark(300, 8192)
    benchmark(300, 10000)

    return 0
}
