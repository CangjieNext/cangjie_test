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
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_StringBuilder_Init {
    var string_32 = String(Array<Rune>(32, repeat: r'A'))
    var string_1k = String(Array<Rune>(1024, repeat: r'A'))
    var string_1m = String(Array<Rune>(1024 * 1024, repeat: r'A'))

    var array_32 = Array<Rune>(32, repeat: r'A')
    var array_1k = Array<Rune>(1024, repeat: r'A')
    var array_1m = Array<Rune>(1024 * 1024, repeat: r'A')

    @Bench
    func BenchmarkStringBuilderInit_Empty_N32(): Unit {
        var stringbuilder = StringBuilder()
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Empty_N1k(): Unit {
        var stringbuilder = StringBuilder(1024)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Empty_N1m(): Unit {
        var stringbuilder = StringBuilder(1024 * 1024)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_From_str_N32(): Unit {
        var stringbuilder = StringBuilder(string_32)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_From_str_N1k(): Unit {
        var stringbuilder = StringBuilder(string_1k)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_From_str_N1m(): Unit {
        var stringbuilder = StringBuilder(string_1m)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromrune_N32(): Unit {
        var stringbuilder = StringBuilder(r'A', 32)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromrune_N1k(): Unit {
        var stringbuilder = StringBuilder(r'A', 1024)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromrune_N1m(): Unit {
        var stringbuilder = StringBuilder(r'A', 1024 * 1024)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromarray_N32(): Unit {
        var stringbuilder = StringBuilder(array_32)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromarray_N1k(): Unit {
        var stringbuilder = StringBuilder(array_1k)
        blackBox(stringbuilder)
    }

    @Bench
    func BenchmarkStringBuilderInit_Fromarray_N1m(): Unit {
        var stringbuilder = StringBuilder(array_1m)
        blackBox(stringbuilder)
    }
}
