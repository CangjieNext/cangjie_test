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
public class Test_TreeMap_Add_All {
    func strategyBuilder_Int64(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<(TreeMap<Int64, Int64>, HashMap<Int64, Int64>)> {
            GenerateEachInputProvider { =>
                (TreeMap<Int64, Int64>(), HashMap<Int64, Int64>(len, {x: Int64 => (x, x)}))
            }
        }
        strategy
    }

    func strategyBuilder_String(len: Int64) {
        @Strategy
        func strategy(): GenerateEachInputProvider<(TreeMap<String, Int64>, HashMap<String, Int64>)> {
            GenerateEachInputProvider { =>
                (TreeMap<String, Int64>(), HashMap<String, Int64>(len, {x: Int64 => (x.toString(), x)}))
            }
        }
        strategy
    }

    @Bench[maps in strategyBuilder_Int64(16)]
    func BenchmarkTreeMap_add_all_Int64_N16(maps: (TreeMap<Int64, Int64>, HashMap<Int64, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }

    @Bench[maps in strategyBuilder_Int64(256)]
    func BenchmarkTreeMap_add_all_Int64_N256(maps: (TreeMap<Int64, Int64>, HashMap<Int64, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }

    @Bench[maps in strategyBuilder_Int64(4096)]
    func BenchmarkTreeMap_add_all_Int64_N4096(maps: (TreeMap<Int64, Int64>, HashMap<Int64, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }

    @Bench[maps in strategyBuilder_String(16)]
    func BenchmarkTreeMap_add_all_String_N16(maps: (TreeMap<String, Int64>, HashMap<String, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }

    @Bench[maps in strategyBuilder_String(256)]
    func BenchmarkTreeMap_add_all_String_N256(maps: (TreeMap<String, Int64>, HashMap<String, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }

    @Bench[maps in strategyBuilder_String(4096)]
    func BenchmarkTreeMap_add_all_String_N4096(maps: (TreeMap<String, Int64>, HashMap<String, Int64>)): Unit {
        let (treemap, hashmap) = maps
        treemap.add(all: hashmap)
    }
}