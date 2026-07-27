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
public class Test_ArrayList_Init_HashSet { 
    static var set_16 = HashSet<Int64>(16, {index: Int64 => index})
    static var set_128 = HashSet<Int64>(128, {index: Int64 => index})
    static var set_1024 = HashSet<Int64>(1024, {index: Int64 => index})
    static var set_8192 = HashSet<Int64>(8192, {index: Int64 => index})
    static var set_65536 = HashSet<Int64>(65536, {index: Int64 => index})

    @Bench
    func BenchmarkArrayListInitFromHashSet_N16(): Unit {
        var arr = ArrayList<Int64>(set_16)
    }

    @Bench
    func BenchmarkArrayListInitFromHashSet_N128(): Unit {
        var arr = ArrayList<Int64>(set_128)
    }

    @Bench
    func BenchmarkArrayListInitFromHashSet_N1024(): Unit {
        var arr = ArrayList<Int64>(set_1024)
    }

    @Bench
    func BenchmarkArrayListInitFromHashSet_N8192(): Unit {
        var arr = ArrayList<Int64>(set_8192)
    }

    @Bench
    func BenchmarkArrayListInitFromHashSet_N65536(): Unit {
        var arr = ArrayList<Int64>(set_65536)
    }
}
