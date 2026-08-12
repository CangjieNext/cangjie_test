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
import std.collection.LinkedList

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Array_Brackets_Range_Get {

    static let arrD1_32 = Array<Int64>(32, {i => i})
    static let arrD1_256 = Array<Int64>(256, {i => i})
    static let arrD1_2048 = Array<Int64>(2048, {i => i})
    static let arrD1_1048576 = Array<Int64>(1048576, {i => i})

    static let blackhole = LinkedList<Array<Int64>>()
    static var element = Array<Int64>()

    // This is to prevent aggresive optimizations, like DCE and inline
    @AfterAll
    public func dumb(): Unit {
        blackhole.addLast(element)
    }

    static var arrD1 = Array<Int64>(32, {i => i})

    @Strategy[len in [32, 256, 2048, 1048576] ]
    func arrayStrategyD1(len: Int64): Int64 {
        arrD1 = Array<Int64>(len, {i => i})
        len/2
    }

    @Bench[index in arrayStrategyD1]
    func BenchmarkArrayBracketsRangeGetD1_N(index: Int64): Unit {
        element = arrD1[0..index]
    }
}
