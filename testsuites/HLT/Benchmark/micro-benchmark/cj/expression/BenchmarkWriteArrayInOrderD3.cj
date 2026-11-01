/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
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
public class Test_Write_Array_In_Order_D3 {

    static var arrD3_32 = Array<Array<Array<Int64>>>(32, {i => Array<Array<Int64>>(32, {i => Array<Int64>(32, repeat: 0)})})
    static var arrD3_256 = Array<Array<Array<Int64>>>(256, {i => Array<Array<Int64>>(256, {i => Array<Int64>(256, repeat: 0)})})

    @Bench
    func BenchmarkWriteArrayInOrderD3_N32(): Unit {
        for (k in 0..32) {
            for (j in 0..32) {
                for (i in 0..32) {
                    arrD3_32[k][j][i] = i
                }
            }
        }
        blackBox(arrD3_32[0][0][0])
    }

    @Bench
    func BenchmarkWriteArrayInOrderD3_N256(): Unit {
        for (k in 0..256) {
            for (j in 0..256) {
                for (i in 0..256) {
                    arrD3_256[k][j][i] = i
                }
            }
        }
        blackBox(arrD3_256[0][0][0])
    }
}
