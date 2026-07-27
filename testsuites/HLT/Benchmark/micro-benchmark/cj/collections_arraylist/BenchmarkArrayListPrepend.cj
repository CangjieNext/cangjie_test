/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.time.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayList_Prepend { 

    func strategyBuilder<T>(f: (Int64) -> T) {
        @Strategy
        func strategy(): GenerateEachInputProvider<ArrayList<T>> {
            GenerateEachInputProvider { =>
                ArrayList<T>(8, f)
            }   
        }

        strategy
    }

    @Bench[x in strategyBuilder<Int64>{ i => i }]
    func BenchmarkArrayListPrependInt64(x: ArrayList<Int64>): Unit {
        x.add(654321, at: 0)
    }

    @Bench[x in strategyBuilder<UInt8>{ i => UInt8(i) }]
    func BenchmarkArrayListPrependUInt8(x: ArrayList<UInt8>): Unit {
        x.add(UInt8(66), at: 0)
    }

    @Bench[x in strategyBuilder<Float64>{ i => Float64(i) }]
    func BenchmarkArrayListPrependFloat64(x: ArrayList<Float64>): Unit {
        x.add(3.14f64, at: 0)
    }

    @Bench[x in strategyBuilder<Bool>{ i => i%2==0 }]
    func BenchmarkArrayListPrependBool(x: ArrayList<Bool>): Unit {
        x.add(true, at: 0)
    }
}
