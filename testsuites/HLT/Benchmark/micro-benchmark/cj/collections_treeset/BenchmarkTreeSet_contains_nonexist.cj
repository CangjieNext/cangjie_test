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
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_TreeSet_Contains_Nonexist {
    func strategyBuilder_Int64(len: Int64) {
        @Strategy
        func strategy(): TreeSet<Int64> {
            TreeSet<Int64>(len, {x: Int64 => x})
        }
        strategy
    }

    func strategyBuilder_String(len: Int64) {
        @Strategy
        func strategy(): TreeSet<String> {
            TreeSet<String>(len, {x: Int64 => x.toString()})
        }
        strategy
    }

    @Bench[set in strategyBuilder_Int64(16)]
    func BenchmarkTreeSet_contains_nonexist_Int64_N16(set: TreeSet<Int64>): Unit {
        var flag: Bool = set.contains(-8)
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_Int64(256)]
    func BenchmarkTreeSet_contains_nonexist_Int64_N256(set: TreeSet<Int64>): Unit {
        var flag: Bool = set.contains(-128)
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_Int64(2048)]
    func BenchmarkTreeSet_contains_nonexist_Int64_N2048(set: TreeSet<Int64>): Unit {
        var flag: Bool = set.contains(-1024)
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_Int64(16384)]
    func BenchmarkTreeSet_contains_nonexist_Int64_N16384(set: TreeSet<Int64>): Unit {
        var flag: Bool = set.contains(-8192)
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_String(16)]
    func BenchmarkTreeSet_contains_nonexist_String_N16(set: TreeSet<String>): Unit {
        var flag: Bool = set.contains("-8")
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_String(256)]
    func BenchmarkTreeSet_contains_nonexist_String_N256(set: TreeSet<String>): Unit {
        var flag: Bool = set.contains("-128")
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_String(2048)]
    func BenchmarkTreeSet_contains_nonexist_String_N2048(set: TreeSet<String>): Unit {
        var flag: Bool = set.contains("-1024")
        blackBox(flag)
    }

    @Bench[set in strategyBuilder_String(16384)]
    func BenchmarkTreeSet_contains_nonexist_String_N16384(set: TreeSet<String>): Unit {
        var flag: Bool = set.contains("-8192")
        blackBox(flag)
    }
}
