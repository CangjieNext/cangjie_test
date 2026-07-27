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

import std.runtime.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayDeque_Init {
    @Bench
    func BenchmarkArrayDeque_Init_Int64_N16(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(16)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_Int64_N256(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(256)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_Int64_N2048(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(2048)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_Int64_N16384(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(16384)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_Int64_N131072(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(131072)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_Int64_N1048576(): Unit {
        var arrDeque: ArrayDeque<Int64> = ArrayDeque<Int64>(1048576)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N16(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(16)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N256(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(256)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N2048(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(2048)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N16384(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(16384)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N131072(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(131072)
        blackBox(arrDeque)
    }

    @Bench
    func BenchmarkArrayDeque_Init_String_N1048576(): Unit {
        var arrDeque: ArrayDeque<String> = ArrayDeque<String>(1048576)
        blackBox(arrDeque)
    }
}
