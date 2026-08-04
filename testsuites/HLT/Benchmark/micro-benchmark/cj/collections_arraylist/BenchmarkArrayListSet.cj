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
@Configure[explicitGC: Disabled]
public class Test_ArrayList_Set { 
    static var int_16 = ArrayList<Int64>(16, {index: Int64 => index})
    static var int_128 = ArrayList<Int64>(128, {index: Int64 => index})
    static var int_1024 = ArrayList<Int64>(1024, {index: Int64 => index})
    static var int_1048576 = ArrayList<Int64>(1048576, {index: Int64 => index})

    static var str_16 = ArrayList<String>(16, {index: Int64 => "cj"})
    static var str_128 = ArrayList<String>(128, {index: Int64 => "cj"})
    static var str_1024 = ArrayList<String>(1024, {index: Int64 => "cj"})
    static var str_1048576 = ArrayList<String>(1048576, {index: Int64 => "cj"})

    @Bench
    func BenchmarkArrayListSet_Int64_N16(): Unit {
        int_16[8] = 123
    }

    @Bench
    func BenchmarkArrayListSet_Int64_N128(): Unit {
        int_128[64] = 123
    }

    @Bench
    func BenchmarkArrayListSet_Int64_N1024(): Unit {
        int_1024[512] = 123
    }

    @Bench
    func BenchmarkArrayListSet_Int64_N1048576(): Unit {
        int_1048576[524288] = 123
    }

    @Bench
    func BenchmarkArrayListSetIndex_Int64_N16(): Unit {
        int_16[8] = 123
    }

    @Bench
    func BenchmarkArrayListSetIndex_Int64_N128(): Unit {
        int_128[64] = 123
    }

    @Bench
    func BenchmarkArrayListSetIndex_Int64_N1024(): Unit {
        int_1024[512] = 123
    }

    @Bench
    func BenchmarkArrayListSetIndex_Int64_N1048576(): Unit {
        int_1048576[524288] = 123
    }

    @Bench
    func BenchmarkArrayListSet_N16(): Unit {
        str_16[8] = "a"
    }

    @Bench
    func BenchmarkArrayListSet_N128(): Unit {
        str_128[64] = "a"
    }

    @Bench
    func BenchmarkArrayListSet_N1024(): Unit {
        str_1024[512] = "a"
    }

    @Bench
    func BenchmarkArrayListSet_N1048576(): Unit {
        str_1048576[524288] = "a"
    }
}
