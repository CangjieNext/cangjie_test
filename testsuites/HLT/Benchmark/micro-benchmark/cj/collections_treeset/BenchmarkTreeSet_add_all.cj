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
public class Test_TreeSet_Add_All {
    func strategyBuilder_Int64(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<(TreeSet<Int64>, ArrayList<Int64>)> {
            GenerateEachInputProvider { =>
                (TreeSet<Int64>(), ArrayList<Int64>(len, {x: Int64 => x}))
            }
        }
        strategy
    }

    func strategyBuilder_Int64_reserve(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<(TreeSet<Int64>, ArrayList<Int64>)> {
            GenerateEachInputProvider { =>
                (TreeSet<Int64>(), ArrayList<Int64>(len, {x: Int64 => x - x % 2}))
            }
        }
        strategy
    }

    @Bench[sets in strategyBuilder_Int64(16)]
    func BenchmarkTreeSet_add_all_Int64_N16(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }

    @Bench[sets in strategyBuilder_Int64(256)]
    func BenchmarkTreeSet_add_all_Int64_N256(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }

    @Bench[sets in strategyBuilder_Int64(4096)]
    func BenchmarkTreeSet_add_all_Int64_N4096(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(16)]
    func BenchmarkTreeSet_add_all_Int64_N16_reserve(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(256)]
    func BenchmarkTreeSet_add_all_Int64_N256_reserve(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(4096)]
    func BenchmarkTreeSet_add_all_Int64_N4096_reserve(sets: (TreeSet<Int64>, ArrayList<Int64>)): Unit {
        let (treeset, arr) = sets
        treeset.add(all: arr)
    }
}