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
public class Test_ArrayList_ToString { 
    static var arr_16 = ArrayList<Int64>(Array<Int64>(16, repeat: 0))
    static var arr_1024 = ArrayList<Int64>(Array<Int64>(1024, repeat: 0))
    static var arr_131072 = ArrayList<Int64>(Array<Int64>(131072, repeat: 0))

    @Bench
    func BenchmarkArrayListToString_N16(): Unit {
        var str = arr_16.toString()
    }

    @Bench
    func BenchmarkArrayListToString_N1024(): Unit {
        var str = arr_1024.toString()
    }

    @Bench
    func BenchmarkArrayListToString_N131072(): Unit {
        var str = arr_131072.toString()
    }
}