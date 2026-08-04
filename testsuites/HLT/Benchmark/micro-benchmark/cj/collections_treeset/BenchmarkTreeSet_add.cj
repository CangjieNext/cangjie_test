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
public class Test_TreeSet_Add {
    func strategyBuilder_Int64() {
        @Strategy
        func strategy(): GenerateEachInputProvider<TreeSet<Int64>> {
            GenerateEachInputProvider { =>
                TreeSet<Int64>()
            }
        }
        strategy
    }

    func strategyBuilder_Int64_contents(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<TreeSet<Int64>> {
            GenerateEachInputProvider { =>
                TreeSet<Int64>(len, {x: Int64 => x})
            }
        }
        strategy
    }

    @Bench[set in strategyBuilder_Int64()]
    func BenchmarkTreeSet_add_Int64_G1(set: TreeSet<Int64>): Unit {
        set.add(0)
    }

    @Bench[set in strategyBuilder_Int64()]
    func BenchmarkTreeSet_add_Int64_G16(set: TreeSet<Int64>): Unit {
        for (i in 0..16) {
            set.add(i)
        }
    }

    @Bench[set in strategyBuilder_Int64()]
    func BenchmarkTreeSet_add_Int64_G256(set: TreeSet<Int64>): Unit {
        for (i in 0..256) {
            set.add(i)
        }
    }

    @Bench[set in strategyBuilder_Int64()]
    func BenchmarkTreeSet_add_Int64_G4096(set: TreeSet<Int64>): Unit {
        for (i in 0..4096) {
            set.add(i)
        }
    }

    @Bench[set in strategyBuilder_Int64_contents(16)]
    func BenchmarkTreeSet_add_Int64_G1_exists(set: TreeSet<Int64>): Unit {
        set.add(0)
    }

    @Bench[set in strategyBuilder_Int64_contents(16)]
    func BenchmarkTreeSet_add_Int64_G16_exists(set: TreeSet<Int64>): Unit {
        for (i in 0..16) {
            set.add(i)
        }
    }

    @Bench[set in strategyBuilder_Int64_contents(256)]
    func BenchmarkTreeSet_add_Int64_G256_exists(set: TreeSet<Int64>): Unit {
        for (i in 0..256) {
            set.add(i)
        }
    }

    @Bench[set in strategyBuilder_Int64_contents(4096)]
    func BenchmarkTreeSet_add_Int64_G4096_exists(set: TreeSet<Int64>): Unit {
        for (i in 0..4096) {
            set.add(i)
        }
    }
}