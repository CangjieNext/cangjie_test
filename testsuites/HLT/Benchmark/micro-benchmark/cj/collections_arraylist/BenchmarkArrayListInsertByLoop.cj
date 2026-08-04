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
public class Test_ArrayList_Remove {
    @Strategy
    func strategyBuilder_Int64_32(): GenerateEachInputProvider<ArrayList<Int64>> {
        GenerateEachInputProvider { =>
            ArrayList<Int64>(32, {index: Int64 => index})
        }
    }

    @Strategy
    func strategyBuilder_Int64_256(): GenerateEachInputProvider<ArrayList<Int64>> {
        GenerateEachInputProvider { =>
            ArrayList<Int64>(32, {index: Int64 => index})
        }
    }

    @Strategy
    func strategyBuilder_Int64_2048(): GenerateEachInputProvider<ArrayList<Int64>> {
        GenerateEachInputProvider { =>
            ArrayList<Int64>(32, {index: Int64 => index})
        }
    }

    @Bench[x in strategyBuilder_Int64_32]
    func BenchmarkArrayListInsertByLoop_Int64_N32(x: ArrayList<Int64>): Unit {
        for (i in 0..32) {
            x.add(i, at: 1)
        }
    }

    @Bench[x in strategyBuilder_Int64_256]
    func BenchmarkArrayListInsertByLoop_Int64_N256(x: ArrayList<Int64>): Unit {
        for (i in 0..256) {
            x.add(i, at: 1)
        }
    }

    @Bench[x in strategyBuilder_Int64_2048]
    func BenchmarkArrayListInsertByLoop_Int64_N2048(x: ArrayList<Int64>): Unit {
        for (i in 0..2048) {
            x.add(i, at: 1)
        }
    }

}
