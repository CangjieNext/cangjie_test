/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench | compare %f
// ASSERT: scan Starting the benchmark
// ASSERT: regex Warming up for.*.ms
// ASSERT: regex Warming up for.*.iterations.
// ASSERT: regex Starting measurements of.*.batches. Measuring Measurement.
// ASSERT: regex Max batch size.*.estimated execution time

import std.time.*
import std.sync.*
import std.collection.*

class myMeasure <: Measurement {}

@Test
@Measure[myMeasure()]
class Test_Measure_01 {
    @Strategy
    func generate_arraylist(): GenerateEachInputProvider<ArrayList<Int64>> {
        GenerateEachInputProvider {
            => ArrayList<Int64>()
        }
    }

    @Bench[arr in generate_arraylist, 
 ele in [ 0, 1 ] 
]
    @Configure[warmup: Duration.second * 0.08, minDuration: Duration.second]
    func test001(arr: ArrayList<Int64>, ele: Int64) {
        arr.add(ele)
    }

    @Bench[arr in generate_arraylist]
    @Configure[warmup: 10, minDuration: Duration.second]
    func test002(arr: ArrayList<Int64>) {
        arr.add(0)
    }
}
