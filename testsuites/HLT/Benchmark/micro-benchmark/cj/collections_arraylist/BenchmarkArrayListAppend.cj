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
public class Test_ArrayList_Append_Types { 

    func strategyBuilder<T>() {
        @Strategy
        func strategy(): GenerateEachInputProvider<ArrayList<T>> {
            GenerateEachInputProvider { =>
                ArrayList<T>()
            }   
        }

        strategy
    }

    @Bench[x in strategyBuilder<Int64>()]
    func BenchmarkArrayListAppendInt64(x: ArrayList<Int64>): Unit {
        x.add(654321)
    }

    @Bench[x in strategyBuilder<UInt8>()]
    func BenchmarkArrayListAppendUInt8(x: ArrayList<UInt8>): Unit {
        x.add(UInt8(66))
    }

    @Bench[x in strategyBuilder<Float64>()]
    func BenchmarkArrayListAppendFloat64(x: ArrayList<Float64>): Unit {
        x.add(3.14f64)
    }

    @Bench[x in strategyBuilder<Bool>()]
    func BenchmarkArrayListAppendBool(x: ArrayList<Bool>): Unit {
        x.add(true)
    }
}
