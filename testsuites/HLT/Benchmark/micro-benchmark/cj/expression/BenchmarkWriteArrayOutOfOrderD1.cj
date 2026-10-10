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
public class Test_Write_Array_Out_Of_Order_D1 {

    static var arrD1_32 = Array<Int64>(32, repeat: 0)
    static var arrD1_256 = Array<Int64>(256, repeat: 0)
    static var arrD1_2048 = Array<Int64>(2048, repeat: 0)
    static var arrD1_16384 = Array<Int64>(16384, repeat: 0)
    static var arrD1_131072 = Array<Int64>(131072, repeat: 0)
    static var arrD1_1048576 = Array<Int64>(1048576, repeat: 0)

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N32(): Unit {
        for (i in 0..32:64) {
            arrD1_32[i] = i
        }
        blackBox(arrD1_32[0])
    }

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N256(): Unit {
        for (i in 0..256:64) {
            arrD1_256[i] = i
        }
        blackBox(arrD1_256[0])
    }

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N2048(): Unit {
        for (i in 0..2048:64) {
            arrD1_2048[i] = i
        }
        blackBox(arrD1_2048[0])
    }

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N16384(): Unit {
        for (i in 0..16384:64) {
            arrD1_16384[i] = i
        }
        blackBox(arrD1_16384[0])
    }

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N131072(): Unit {
        for (i in 0..131072:64) {
            arrD1_131072[i] = i
        }
        blackBox(arrD1_131072[0])
    }

    @Bench
    func BenchmarkWriteArrayOutOfOrderD1_N1048576(): Unit {
        for (i in 0..1048576:64) {
            arrD1_1048576[i] = i
        }
        blackBox(arrD1_1048576[0])
    }
}
