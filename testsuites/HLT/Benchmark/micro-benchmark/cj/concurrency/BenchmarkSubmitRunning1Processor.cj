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

func testFuncSubmit(rep: Int64, threads: Int64): Unit {
    for (i in 0..rep) {
        for (j in 0..threads) {
            spawn {
                
            }
        }
    }
}

func testFuncRunning(rep: Int64, threads: Int64): Unit {
    let wg = WaitGroup(rep * threads)
    for (i in 0..rep) {
        for (j in 0..threads) {
            spawn {
                wg.done()
            }
        }
    }
    wg.wait()
}

main(): Int64 {
    concurrencyBenchmark("Submit1Processor", testFuncSubmit, 1000, 1000)
    concurrencyBenchmark("Running1Processor", testFuncRunning, 1000, 1000)
    return 0
}
