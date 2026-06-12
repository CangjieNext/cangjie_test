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
@Configure[warmup: Duration.second * 0.5, minDuration: Duration.second]
@Measure[Runtime(RuntimeInfo.GCCount), Runtime(RuntimeInfo.GCTime), Runtime(RuntimeInfo.AllocatedMemory)]
class Test_Measure_01 {
    @Strategy
    func generate_arraylist(): GenerateEachInputProvider<ArrayList<String>> {
        GenerateEachInputProvider {
            => ArrayList<String>()
        }
    }

    @Bench[arr in generate_arraylist]
    func test001(arr: ArrayList<String>) {
        arr.add("a".clone())
    }

    @Bench[arr in generate_arraylist]
    func test002(arr: ArrayList<String>) {
        arr.add("仓颉编程语言-2025-仓颉编程语言".clone())
    }
}