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
public class Test_TreeMap_Add {
    func strategyBuilder_Int64() {
        @Strategy
        func strategy(): GenerateEachInputProvider<TreeMap<Int64, Int64>> {
            GenerateEachInputProvider { =>
                TreeMap<Int64, Int64>()
            }
        }
        strategy
    }

    func strategyBuilder_String() {
        @Strategy
        func strategy(): GenerateEachInputProvider<TreeMap<String, Int64>> {
            GenerateEachInputProvider { =>
                TreeMap<String, Int64>()
            }
        }
        strategy
    }

    @Bench[map in strategyBuilder_Int64()]
    func BenchmarkTreeMap_add_Int64_G1(map: TreeMap<Int64, Int64>): Unit {
        map.add(0, 0)
    }

    @Bench[map in strategyBuilder_Int64()]
    func BenchmarkTreeMap_add_Int64_G16(map: TreeMap<Int64, Int64>): Unit {
        for (i in 0..16) {
            map.add(i, i)
        }
    }

    @Bench[map in strategyBuilder_Int64()]
    func BenchmarkTreeMap_add_Int64_G256(map: TreeMap<Int64, Int64>): Unit {
        for (i in 0..256) {
            map.add(i, i)
        }
    }

    @Bench[map in strategyBuilder_Int64()]
    func BenchmarkTreeMap_add_Int64_G4096(map: TreeMap<Int64, Int64>): Unit {
        for (i in 0..4096) {
            map.add(i, i)
        }
    }

    @Bench[map in strategyBuilder_String()]
    func BenchmarkTreeMap_add_String_G1(map: TreeMap<String, Int64>): Unit {
        map.add("0", 0)
    }

    @Bench[map in strategyBuilder_String()]
    func BenchmarkTreeMap_add_String_G16(map: TreeMap<String, Int64>): Unit {
        for (i in 0..16) {
            map.add(i.toString(), i)
        }
    }

    @Bench[map in strategyBuilder_String()]
    func BenchmarkTreeMap_add_String_G256(map: TreeMap<String, Int64>): Unit {
        for (i in 0..256) {
            map.add(i.toString(), i)
        }
    }

    @Bench[map in strategyBuilder_String()]
    func BenchmarkTreeMap_add_String_G4096(map: TreeMap<String, Int64>): Unit {
        for (i in 0..4096) {
            map.add(i.toString(), i)
        }
    }
}