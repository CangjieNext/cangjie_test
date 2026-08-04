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
public class Test_TreeSet_Init {
    func strategyBuilder_Int64(len: Int64) {
        @Strategy
        func strategy(): ArrayList<Int64> {
            ArrayList<Int64>(len, {x: Int64 => x})
        }
        strategy
    }

    func strategyBuilder_Int64_reserve(len: Int64) {
        @Strategy
        func strategy(): ArrayList<Int64> {
            ArrayList<Int64>(len, {x: Int64 => x - x % 2})
        }
        strategy
    }

    func strategyBuilder_String(len: Int64) {
        @Strategy
        func strategy(): ArrayList<String> {
            ArrayList<String>(len, {x: Int64 => x.toString()})
        }
        strategy
    }

    func strategyBuilder_String_reserve(len: Int64) {
        @Strategy
        func strategy(): ArrayList<String> {
            ArrayList<String>(len, {x: Int64 => (x - x % 2).toString()})
        }
        strategy
    }

    @Bench[sets in strategyBuilder_Int64(16)]
    func BenchmarkTreeSet_Init_Int64_N16(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64(256)]
    func BenchmarkTreeSet_Init_Int64_N256(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64(2048)]
    func BenchmarkTreeSet_Init_Int64_N2048(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64(16384)]
    func BenchmarkTreeSet_Init_Int64_N16384(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64(131072)]
    func BenchmarkTreeSet_Init_Int64_N131072(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(16)]
    func BenchmarkTreeSet_Init_Int64_N16_reserve(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(256)]
    func BenchmarkTreeSet_Init_Int64_N256_reserve(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(2048)]
    func BenchmarkTreeSet_Init_Int64_N2048_reserve(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(16384)]
    func BenchmarkTreeSet_Init_Int64_N16384_reserve(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_Int64_reserve(131072)]
    func BenchmarkTreeSet_Init_Int64_N131072_reserve(sets: ArrayList<Int64>): Unit {
        var treesets: TreeSet<Int64> = TreeSet<Int64>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String(16)]
    func BenchmarkTreeSet_Init_String_N16(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String(256)]
    func BenchmarkTreeSet_Init_String_N256(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String(2048)]
    func BenchmarkTreeSet_Init_String_N2048(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String(16384)]
    func BenchmarkTreeSet_Init_String_N16384(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String(131072)]
    func BenchmarkTreeSet_Init_String_N131072(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String_reserve(16)]
    func BenchmarkTreeSet_Init_String_N16_reserve(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String_reserve(256)]
    func BenchmarkTreeSet_Init_String_N256_reserve(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String_reserve(2048)]
    func BenchmarkTreeSet_Init_String_N2048_reserve(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String_reserve(16384)]
    func BenchmarkTreeSet_Init_String_N16384_reserve(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }

    @Bench[sets in strategyBuilder_String_reserve(131072)]
    func BenchmarkTreeSet_Init_String_N131072_reserve(sets: ArrayList<String>): Unit {
        var treesets: TreeSet<String> = TreeSet<String>(sets)
        blackBox(treesets)
    }
}
