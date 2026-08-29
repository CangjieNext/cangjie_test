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
    var str1 = "h" * 8
    var str1_32 = "h" * 32
    var str1_256 = "h" * 256
    var str1k = "h" * 1024
    var str1m = "h" * 1024 * 1024

    @Bench
    func BenchmarkStringToUpper_N8(): Unit {
        blackBox(str1.toAsciiUpper())
    }

    @Bench
    func BenchmarkStringToUpper_N32(): Unit {
        blackBox(str1_32.toAsciiUpper())
    }

    @Bench
    func BenchmarkStringToUpper_N256(): Unit {
        blackBox(str1_256.toAsciiUpper())
    }

    @Bench
    func BenchmarkStringToUpper_N1k(): Unit {
        blackBox(str1k.toAsciiUpper())
    }

    @Bench
    func BenchmarkStringToUpper_N1m(): Unit {
        blackBox(str1m.toAsciiUpper())
    }
}
