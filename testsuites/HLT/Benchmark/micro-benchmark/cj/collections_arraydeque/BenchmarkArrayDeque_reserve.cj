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

import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayDeque_Reserve {
    func strategyBuilder(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<ArrayDeque<Int64>> {
            GenerateEachInputProvider { =>
                ArrayDeque<Int64>(len)
            }
        }
        strategy
    }

    @Bench[x in strategyBuilder(8)]
    func BenchmarkArrayDeque_reserve_N64(x: ArrayDeque<Int64>): Unit {
        x.reserve(64)
    }

    @Bench[x in strategyBuilder(8)]
    func BenchmarkArrayDeque_reserve_N512(x: ArrayDeque<Int64>): Unit {
        x.reserve(512)
    }

    @Bench[x in strategyBuilder(8)]
    func BenchmarkArrayDeque_reserve_N4096(x: ArrayDeque<Int64>): Unit {
        x.reserve(4096)
    }
}