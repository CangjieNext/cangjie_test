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
public class Test_TreeMap_Contains {
    func strategyBuilder_Int64(len: Int64) {
        @Strategy
        func strategy(): TreeMap<Int64, Int64> {
            TreeMap<Int64, Int64>(len, {x: Int64 => (x, x)})
        }
        strategy
    }

    func strategyBuilder_String(len: Int64) {
        @Strategy
        func strategy(): TreeMap<String, Int64> {
            TreeMap<String, Int64>(len, {x: Int64 => (x.toString(), x)})
        }
        strategy
    }

    @Bench[map in strategyBuilder_Int64(16)]
    func BenchmarkTreeMap_contains_Int64_N16(map: TreeMap<Int64, Int64>): Unit {
        var flag: Bool = map.contains(8)
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_Int64(256)]
    func BenchmarkTreeMap_contains_Int64_N256(map: TreeMap<Int64, Int64>): Unit {
        var flag: Bool = map.contains(128)
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_Int64(2048)]
    func BenchmarkTreeMap_contains_Int64_N2048(map: TreeMap<Int64, Int64>): Unit {
        var flag: Bool = map.contains(1024)
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_Int64(16384)]
    func BenchmarkTreeMap_contains_Int64_N16384(map: TreeMap<Int64, Int64>): Unit {
        var flag: Bool = map.contains(8192)
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_String(16)]
    func BenchmarkTreeMap_contains_String_N16(map: TreeMap<String, Int64>): Unit {
        var flag: Bool = map.contains("8")
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_String(256)]
    func BenchmarkTreeMap_contains_String_N256(map: TreeMap<String, Int64>): Unit {
        var flag: Bool = map.contains("128")
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_String(2048)]
    func BenchmarkTreeMap_contains_String_N2048(map: TreeMap<String, Int64>): Unit {
        var flag: Bool = map.contains("1024")
        blackBox(flag)
    }

    @Bench[map in strategyBuilder_String(16384)]
    func BenchmarkTreeMap_contains_String_N16384(map: TreeMap<String, Int64>): Unit {
        var flag: Bool = map.contains("8192")
        blackBox(flag)
    }
}
