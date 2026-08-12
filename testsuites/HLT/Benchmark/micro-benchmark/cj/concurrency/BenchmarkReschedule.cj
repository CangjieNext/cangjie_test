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


let testName = "Reschedule"

func testFunc(rep: Int64, threads: Int64): Unit {
    let wg = WaitGroup(threads)
    for (i in 0..threads) {
        let future = spawn {
            for (j in 0..rep) {
                sleep(Duration.Zero)
            }
            wg.done()
        }
    }
    wg.wait()
}

func benchmark(rep: Int64, threads: Int64): Unit {
    concurrencyBenchmark(testName, testFunc, rep, threads)
}

main(): Int64 {
    // The time consumed outside the loop is about 20,000 ns.
    // The average time consumed outside the loop is 0.02 ns/op.
    // The total time consumed is about 300 ns/op.
    // The time consumed outside the loop is less than 1/10000 of the total time consumed.
    benchmark(1000000, 1)
    benchmark(1000000, 2)
    benchmark(1000000, 4)
    benchmark(1000000, 8)

    // 16 threads take almost 10 times as much time as 1 thread, thus reducing the number of cycles.
    benchmark(100000, 16)
    benchmark(100000, 32)
    benchmark(100000, 64)
    benchmark(100000, 128)
    return 0
}
