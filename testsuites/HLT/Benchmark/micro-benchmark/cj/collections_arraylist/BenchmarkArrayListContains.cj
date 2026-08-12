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
public class Test_ArrayList_Contains {
    static var int_16 = ArrayList<Int64>(16, {index: Int64 => index})
    static var int_128 = ArrayList<Int64>(128, {index: Int64 => index})
    static var int_4096 = ArrayList<Int64>(4096, {index: Int64 => index})
    var res = false

    @Bench
    func BenchmarkArrayListContains_Int64_N16(): Unit {
        res = int_16.contains(8)
    }

    @Bench
    func BenchmarkArrayListContains_Int64_N128(): Unit {
        res = int_128.contains(64)
    }

    @Bench
    func BenchmarkArrayListContains_Int64_N4096(): Unit {
        res = int_4096.contains(2048)
    }

    @Bench
    func BenchmarkArrayListContains_Notexist_Int64_N16(): Unit {
        res = int_16.contains(20)
    }

    @Bench
    func BenchmarkArrayListContains_Notexist_Int64_N128(): Unit {
        res = int_128.contains(130)
    }

    @Bench
    func BenchmarkArrayListContains_Notexist_Int64_N4096(): Unit {
        res = int_4096.contains(5000)
    }
}
