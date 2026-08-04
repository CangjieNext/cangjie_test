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

var arr_32 = Array<Int64>(32, {index: Int64 => index})
var arr_256 = Array<Int64>(256, {index: Int64 => index})
var arr_2048 = Array<Int64>(2048, {index: Int64 => index})
var arr_65536 = Array<Int64>(65536, {index: Int64 => index})
var arr_1048576 = Array<Int64>(1048576, {index: Int64 => index})

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Array_Bracket_Range_Set { 
    var set_32 = Array<Int64>(32, repeat: 0)
    var set_256 = Array<Int64>(256, repeat: 0)
    var set_2048 = Array<Int64>(2048, repeat: 0)
    var set_65536 = Array<Int64>(65536, repeat: 0)
    var set_1048576 = Array<Int64>(1048576, repeat: 0)

    @BeforeEach
    public func reset(): Unit {
        arr_32 = Array<Int64>(32, {index: Int64 => index})
        arr_256 = Array<Int64>(256, {index: Int64 => index})
        arr_2048 = Array<Int64>(2048, {index: Int64 => index})
        arr_65536 = Array<Int64>(65536, {index: Int64 => index})
        arr_1048576 = Array<Int64>(1048576, {index: Int64 => index})
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetD1_N32(): Unit {
        arr_32[0..32].fill(0)
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetD1_N256(): Unit {
        arr_256[0..256].fill(0)
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetD1_N2048(): Unit {
        arr_2048[0..2048].fill(0)
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetD1_N65536(): Unit {
        arr_65536[0..65536].fill(0)
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetD1_N1048576(): Unit {
        arr_1048576[0..1048576].fill(0)
    }

    // public operator func [](range: Range<Int64>, value!: Array<T>): Unit
    @Bench
    func BenchmarkArrayBracketsRangeSetArrayD1_N32(): Unit {
        arr_32[0..32] = set_32
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetArrayD1_N256(): Unit {
        arr_256[0..256] = set_256
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetArrayD1_N2048(): Unit {
        arr_2048[0..2048] = set_2048
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetArrayD1_N65536(): Unit {
        arr_65536[0..65536] = set_65536
    }

    @Bench
    func BenchmarkArrayBracketsRangeSetArrayD1_N1048576(): Unit {
        arr_1048576[0..1048576] = set_1048576
    }
}
