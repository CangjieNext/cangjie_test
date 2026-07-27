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
public class Test_TreeMap_Get {
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
    func BenchmarkTreeMap_get_Int64_N16_p1(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(0)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(16)]
    func BenchmarkTreeMap_get_Int64_N16_p2(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(7)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(16)]
    func BenchmarkTreeMap_get_Int64_N16_p3(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(15)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(256)]
    func BenchmarkTreeMap_get_Int64_N256_p1(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(0)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(256)]
    func BenchmarkTreeMap_get_Int64_N256_p2(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(127)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(256)]
    func BenchmarkTreeMap_get_Int64_N256_p3(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(255)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(2048)]
    func BenchmarkTreeMap_get_Int64_N2048_p1(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(0)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(2048)]
    func BenchmarkTreeMap_get_Int64_N2048_p2(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(1023)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(2048)]
    func BenchmarkTreeMap_get_Int64_N2048_p3(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(2047)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(16384)]
    func BenchmarkTreeMap_get_Int64_N16384_p1(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(0)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(16384)]
    func BenchmarkTreeMap_get_Int64_N16384_p2(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(8191)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_Int64(16384)]
    func BenchmarkTreeMap_get_Int64_N16384_p3(map: TreeMap<Int64, Int64>): Unit {
        var value: ?Int64 = map.get(16383)
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16)]
    func BenchmarkTreeMap_get_String_N16_p1(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("0")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16)]
    func BenchmarkTreeMap_get_String_N16_p2(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("7")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16)]
    func BenchmarkTreeMap_get_String_N16_p3(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("15")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(256)]
    func BenchmarkTreeMap_get_String_N256_p1(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("0")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(256)]
    func BenchmarkTreeMap_get_String_N256_p2(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("127")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(256)]
    func BenchmarkTreeMap_get_String_N256_p3(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("255")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(2048)]
    func BenchmarkTreeMap_get_String_N2048_p1(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("0")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(2048)]
    func BenchmarkTreeMap_get_String_N2048_p2(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("1023")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(2048)]
    func BenchmarkTreeMap_get_String_N2048_p3(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("2047")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16384)]
    func BenchmarkTreeMap_get_String_N16384_p1(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("0")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16384)]
    func BenchmarkTreeMap_get_String_N16384_p2(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("8191")
        blackBox(value)
    }

    @Bench[map in strategyBuilder_String(16384)]
    func BenchmarkTreeMap_get_String_N16384_p3(map: TreeMap<String, Int64>): Unit {
        var value: ?Int64 = map.get("16383")
        blackBox(value)
    }
}
