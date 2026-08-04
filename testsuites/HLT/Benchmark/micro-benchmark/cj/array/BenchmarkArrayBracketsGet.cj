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
import std.collection.HashSet

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Array_Bracket_Get {

    static let blackhole = HashSet<Int64>()
    static var element = 0

    // This is to prevent aggresive optimizations, like DCE and inline
    @AfterAll
    public func dumb(): Unit {
        blackhole.add(element)
    }

    static var arrD1: Array<Int64> = []
    static var arrD2: Array<Array<Int64>> = []
    static var arrD3: Array<Array<Array<Int64>>> = []

    @Strategy[len in [32, 256, 2048, 1048576] ]
    func arrayStrategyD1(len: Int64): Int64 {
        arrD1 = Array<Int64>(len, {i => i})
        len/2
    }

    @Strategy[len in [32, 256, 2048]]
    func arrayStrategyD2(len: Int64): Int64 {
        arrD2 = Array<Array<Int64>>(len, {i => Array<Int64>(len, {i => i})})
        len/2
    }

    @Strategy[len in [32, 256]]
    func arrayStrategyD3(len: Int64): Int64 {
        arrD3 = Array<Array<Array<Int64>>>(len, {i => Array<Array<Int64>>(len, {i => Array<Int64>(len, {i => i})})})
        len/2
    }

    @Bench[index in arrayStrategyD1]
    func BenchmarkArrayBracketsGetD1_N(index: Int64): Unit {
        element = arrD1[index]
    }

    @Bench[index in arrayStrategyD2]
    func BenchmarkArrayBracketsGetD2_N(index: Int64): Unit {
        element = arrD2[index][index]
    }

    @Bench[index in arrayStrategyD3]
    func BenchmarkArrayBracketsGetD3_N(index: Int64): Unit {
        element = arrD3[index][index][index]
    }

    static var arrD1_32 = Array<Int64>(32, {i => i})
    static var arrD2_32 = Array<Array<Int64>>(32, {i => Array<Int64>(32, {i => i})})
    static var arrD3_32 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, { i => i })})})

    @Bench
    func BenchmarkArrayBracketsGetD1(): Unit {
        var index: Int64 = 32 / 2
        element = arrD1_32[index] 
    }
    @Bench
    func BenchmarkArrayBracketsGetD2(): Unit {
        var index: Int64 = 32 / 2
        element = arrD2_32[index][index]
    }
    @Bench
    func BenchmarkArrayBracketsGetD3(): Unit {
        var index: Int64 = 32 / 2
        element = arrD3_32[index][index][index]
    }

}
