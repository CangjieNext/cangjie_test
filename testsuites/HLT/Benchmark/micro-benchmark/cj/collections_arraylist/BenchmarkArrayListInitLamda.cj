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
public class Test_ArrayList_Init_Lamda {
    static var arr = ArrayList<Int64>()

    @Bench
    func BenchmarkArrayListInitLamda_N32(): Unit {
        arr = ArrayList<Int64>(32, {i => i})
    }

    @Bench
    func BenchmarkArrayListInitLamda_N256(): Unit {
        arr = ArrayList<Int64>(256, {i => i})
    }

    @Bench
    func BenchmarkArrayListInitLamda_N2048(): Unit {
        arr = ArrayList<Int64>(2048, {i => i})
    }

    @AfterAll
    func teardown() {
        println(arr.size)
    }
}
