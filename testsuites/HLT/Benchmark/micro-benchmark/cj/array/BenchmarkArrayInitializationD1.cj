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

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Array_Init {

    // This is to prevent aggresive optimizations, like DCE and inline
    static var arr : Array<Int64> = Array<Int64>()

    @Bench
    func BenchmarkArrayInitializationD1_N32(): Unit {
        arr = Array<Int64>(32, repeat: 0)
    }

    @Bench
    func BenchmarkArrayInitializationD1_N256(): Unit {
        arr = Array<Int64>(256, repeat: 0)
    }

    @Bench
    func BenchmarkArrayInitializationD1_N2048(): Unit {
        arr = Array<Int64>(2048, repeat: 0)
    }

    @Bench
    func BenchmarkArrayInitializationD1_N16384(): Unit {
        arr = Array<Int64>(16384, repeat: 0)
    }

    @Bench
    func BenchmarkArrayInitializationD1_N131072(): Unit {
        arr = Array<Int64>(131072, repeat: 0)
    }

    @Bench
    func BenchmarkArrayInitializationD1_N1048576(): Unit {
        arr = Array<Int64>(1048576, repeat: 0)
    }

    // 以下使用lambda
    @Bench
    func BenchmarkArrayInitDataD1_N32(): Unit {
        arr = Array<Int64>(32, {index : Int64 => index})
    }

    @Bench
    func BenchmarkArrayInitDataD1_N256(): Unit {
        arr = Array<Int64>(256, {index : Int64 => index})
    }

    @Bench
    func BenchmarkArrayInitDataD1_N2048(): Unit {
        arr = Array<Int64>(2048, {index : Int64 => index})
    }

    @Bench
    func BenchmarkArrayInitDataD1_N16384(): Unit {
        arr = Array<Int64>(16384, {index : Int64 => index})
    }

    @Bench
    func BenchmarkArrayInitDataD1_N131072(): Unit {
        arr = Array<Int64>(131072, {index : Int64 => index})
    }

    @Bench
    func BenchmarkArrayInitDataD1_N1048576(): Unit {
        arr = Array<Int64>(1048576, {index : Int64 => index})
    }
}
