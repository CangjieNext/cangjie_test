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
public class Test_suit { 
    var arr1 = Array<Rune>(8, repeat:r'H')
    var arr1_32 = Array<Rune>(32, repeat:r'H')
    var arr1_256 = Array<Rune>(256, repeat:r'H')
    var arr2 = Array<Rune>(1024, repeat:r'H')
    var arr3 = Array<Rune>(1024 * 1024, repeat:r'H')

    @Bench
    func BenchmarkStringCreateRune_N8(): Unit {
        blackBox(String(arr1))
    }

    @Bench
    func BenchmarkStringCreateRune_N32(): Unit {
        blackBox(String(arr1_32))
    }

    @Bench
    func BenchmarkStringCreateRune_N256(): Unit {
        blackBox(String(arr1_256))
    }

    @Bench
    func BenchmarkStringCreateRune_N1K(): Unit {
        blackBox(String(arr2))
    }

    @Bench
    func BenchmarkStringCreateRune_N1M(): Unit {
        blackBox(String(arr3))
    }
}
