/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source code is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx -O2 %overflow_wrapping --no-sub-pkg --test -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Read_Array_In_Order {

    static let arrD1_32 = Array<Int64>(32, {i => i})
    static let arrD1_256 = Array<Int64>(256, {i => i})
    static let arrD1_2048 = Array<Int64>(2048, {i => i})
    static let arrD1_16384 = Array<Int64>(16384, {i => i})
    static let arrD2_32 = Array<Array<Int64>>(32, {i => Array<Int64>(32, {i => i})})
    static let arrD2_256 = Array<Array<Int64>>(256, {i => Array<Int64>(256, {i => i})})
    static let arrD2_2048 = Array<Array<Int64>>(2048, {i => Array<Int64>(2048, {i => i})})
    static let arrD2_16384 = Array<Array<Int64>>(16384, {i => Array<Int64>(16384, {i => i})})
    static let arrD3_32 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, { i => i })})})
    static let arrD3_256 = Array<Array<Array<Int64>>>(256, {i => Array<Array<Int64>>(256, {i => Array<Int64>(256, { i => i })})})

    @Bench[arrLen in [32, 256, 2048, 16384]]
    func BenchmarkReadArrayInOrderD1_N(arrLen: Int64): Unit {
        let arr = if (arrLen == 32) {
            arrD1_32
        } else if (arrLen == 256) {
            arrD1_256
        } else if (arrLen == 2048) {
            arrD1_2048
        } else {
            arrD1_16384
        }
        var element = 0
        for (i in 0..arrLen) {
            element = arr[i]
        }
        blackBox(element)
    }

    @Bench[arrLen in [32, 256, 2048, 16384]]
    func BenchmarkReadArrayInOrderD2_N(arrLen: Int64): Unit {
        let arr = if (arrLen == 32) {
            arrD2_32
        } else if (arrLen == 256) {
            arrD2_256
        } else if (arrLen == 2048) {
            arrD2_2048
        } else {
            arrD2_16384
        }
        var element = 0
        for (j in 0..arrLen) {
            for (i in 0..arrLen) {
                element = arr[j][i]
            }
        }
        blackBox(element)
    }

    @Bench[arrLen in [32, 256]]
    func BenchmarkReadArrayInOrderD3_N(arrLen: Int64): Unit {
        let arr = if (arrLen == 32) {
            arrD3_32
        } else {
            arrD3_256
        }
        var element = 0
        for (k in 0..arrLen) {
            for (j in 0..arrLen) {
                for (i in 0..arrLen) {
                    element = arr[k][j][i]
                }
            }
        }
        blackBox(element)
    }
}
