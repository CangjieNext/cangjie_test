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
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Array_Bracket_Set {

    static var arrD1 = Array<Int64>(32, {i => i})
    static var arrD2 = Array<Array<Int64>>(32, {i => Array<Int64>(32, {i => i})})
    static var arrD3 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, { i => i })})})

    static var element = 123

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
    func BenchmarkArrayBracketsSetD1_N(index: Int64): Unit {
        arrD1[index] = element
    }

    @Bench[index in arrayStrategyD2]
    func BenchmarkArrayBracketsSetD2_N(index: Int64): Unit {
        arrD2[index][index] = element
    }

    @Bench[index in arrayStrategyD3]
    func BenchmarkArrayBracketsSetD3_N(index: Int64): Unit {
        arrD3[index][index][index] = element
    }
}
