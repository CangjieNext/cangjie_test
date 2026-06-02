/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %export cjHeapSize=4gb && %run %run_opt %output %run_utest_opt %run_args --bench | compare %f
// ASSERT: scan Starting the benchmark
// ASSERT: scan Runtime(GCCount)
// ASSERT: scan Runtime(GCTime)
// ASSERT: scan Runtime(AllocatedMemory)

import std.time.*
import std.sync.*
import std.runtime.*
import std.collection.*

@Test
@Measure[TimeNow()]
@Measure[Runtime(RuntimeInfo.GCCount), Runtime(RuntimeInfo.GCTime), Runtime(RuntimeInfo.AllocatedMemory)]
class Test_Measure_03 {
    @Strategy
    func generate_arraylist(): ArrayList<Int64> {
        ArrayList<Int64>([0, 1])
    }

    @Bench[arr in generate_arraylist]
    @Configure[warmup: Duration.second * 0.5, minDuration: Duration.second]
    @Configure[explicitGC: Light]
    func test001(arr: ArrayList<Int64>) {
        blackBox(arr[0])
    }

    @Bench[arr in generate_arraylist]
    @Configure[warmup: Duration.second * 0.5, minDuration: Duration.second]
    @Configure[explicitGC: Heavy]
    func test002(arr: ArrayList<Int64>) {
        blackBox(arr[1])
    }

    @Bench[arr in generate_arraylist]
    @Configure[explicitGC: Disabled]
    func test003(arr: ArrayList<Int64>) {
        blackBox(arr[1])
    }

    // @Bench[arr in generate_arraylist]
    // @Configure[explicitGC: HeavyAndWait]
    // func test004(arr: ArrayList<Int64>) {
    //     blackBox(arr[1])
    // }

    @Bench[arr in generate_arraylist]
    @Configure[explicitGC: Auto]
    func test005(arr: ArrayList<Int64>) {
        blackBox(arr[1])
    }

    // default
    @Bench[arr in generate_arraylist]
    func test006(arr: ArrayList<Int64>) {
        blackBox(arr[1])
    }
}