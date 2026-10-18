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
public class Test_Read_Array_Out_Of_Order {

    static let arrD1_32 = Array<Int64>(32, {i => i})
    static let arrD1_256 = Array<Int64>(256, {i => i})
    static let arrD1_2048 = Array<Int64>(2048, {i => i})
    static let arrD1_16384 = Array<Int64>(16384, {i => i})
    static let arrD1_131072 = Array<Int64>(131072, {i => i})
    static let arrD1_1048576 = Array<Int64>(1048576, {i => i})
    static let arrD2_32 = Array<Array<Int64>>(32, {i => Array<Int64>(32, {i => i})})
    static let arrD2_256 = Array<Array<Int64>>(256, {i => Array<Int64>(256, {i => i})})
    static let arrD2_2048 = Array<Array<Int64>>(2048, {i => Array<Int64>(2048, {i => i})})
    static let arrD2_16384 = Array<Array<Int64>>(16384, {i => Array<Int64>(16384, {i => i})})
    static let arrD3_32 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, { i => i })})})
    static let arrD3_256 = Array<Array<Array<Int64>>>(256, {i => Array<Array<Int64>>(256, {i => Array<Int64>(256, { i => i })})})

    @Bench[arrLen in [32, 256, 2048, 16384, 131072, 1048576]]
    func BenchmarkReadArrayOutOfOrderD1_N(arrLen: Int64): Unit {
        let arr = if (arrLen == 32) {
            arrD1_32
        } else if (arrLen == 256) {
            arrD1_256
        } else if (arrLen == 2048) {
            arrD1_2048
        } else if (arrLen == 16384) {
            arrD1_16384
        } else if (arrLen == 131072) {
            arrD1_131072
        } else {
            arrD1_1048576
        }
        var element = 0
        for (i in 0..arrLen:64) {
            element = arr[i]
        }
        blackBox(element)
    }

    @Bench[arrLen in [32, 256, 2048, 16384]]
    func BenchmarkReadArrayOutOfOrderD2_N(arrLen: Int64): Unit {
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
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                element = arr[i][j]
            }
        }
        blackBox(element)
    }

    @Bench[arrLen in [32, 256]]
    func BenchmarkReadArrayOutOfOrderD3_N(arrLen: Int64): Unit {
        let arr = if (arrLen == 32) {
            arrD3_32
        } else {
            arrD3_256
        }
        var element = 0
        for (i in 0..arrLen:64) {
            for (j in 0..arrLen:64) {
                for (k in 0..arrLen:64) {
                    element = arr[i][j][k]
                }
            }
        }
        blackBox(element)
    }
}
