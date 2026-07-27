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
public class Test_Array_ToString { 
    // D1 - case4
    var arr_32 = Array<Int64>(32, repeat: 0)
    var arr_256 = Array<Int64>(256, repeat: 0)
    var arr_2048 = Array<Int64>(2048, repeat: 0)
    var arr_1048576 = Array<Int64>(1048576, repeat: 0)

    @Bench
    func BenchmarkArrayToStringD1_N32(): Unit {
        var str = arr_32.toString()
    }

    @Bench
    func BenchmarkArrayToStringD1_N256(): Unit {
        var str = arr_256.toString()
    }

    @Bench
    func BenchmarkArrayToStringD1_N2048(): Unit {
        var str = arr_2048.toString()
    }

    @Bench
    func BenchmarkArrayToStringD1_N1048576(): Unit {
        var str = arr_1048576.toString()
    }

    // D2 - case3
    var arr_D2_32 = Array<Array<Int64>>(32, {int: Int64 => Array<Int64>(32, repeat: 0)})
    var arr_D2_256 = Array<Array<Int64>>(256, {int: Int64 => Array<Int64>(256, repeat: 0)})
    var arr_D2_2048 = Array<Array<Int64>>(2048, {int: Int64 => Array<Int64>(2048, repeat: 0)})
    @Bench
    func BenchmarkArrayToStringD2_N32(): Unit {
        var str = arr_D2_32.toString()
    }

    @Bench
    func BenchmarkArrayToStringD2_N256(): Unit {
        var str = arr_D2_256.toString()
    }

    @Bench
    func BenchmarkArrayToStringD2_N2048(): Unit {
        var str = arr_D2_2048.toString()
    }

    // D3 - case2
    var arr_D3_32 = Array<Array<Array<Int64>>>(32, {int: Int64 => Array<Array<Int64>>(32, {int: Int64 => Array<Int64>(32, repeat: 0)})})
    var arr_D3_128 = Array<Array<Array<Int64>>>(128, {int: Int64 => Array<Array<Int64>>(128, {int: Int64 => Array<Int64>(128, repeat: 0)})})

    @Bench
    func BenchmarkArrayToStringD3_N32(): Unit {
        var str = arr_D3_32.toString()
    }

    @Bench
    func BenchmarkArrayToStringD3_N128(): Unit {
        var str = arr_D3_128.toString()
    }
}
