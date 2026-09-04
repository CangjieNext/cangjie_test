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
    var str1 = "H" * 8
    var str1_32 = "H" * 32
    var str1_256 = "H" * 256
    var str1k = "R" * 1023 +"H" 
    var str1k_half = "H" * 512 + "R" * 512
    var str1k_all = "H" * 1024
    var str1m = "R" * (1024 * 1024 - 1) + "H"
    var str1m_half = "H" * 1024 * 512 + "R" * 1024 *512 
    var str1m_all = "H" * (1024 * 1024) 

    @Bench
    func BenchmarkStringReplace_N8(): Unit {
        blackBox(str1.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N32(): Unit {
        blackBox(str1_32.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N256(): Unit {
        blackBox(str1_256.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1k(): Unit {
        blackBox(str1k.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1k_half(): Unit {
        blackBox(str1k_half.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1k_all(): Unit {
        blackBox(str1k_all.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1m(): Unit {
        blackBox(str1m.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1m_half(): Unit {
        blackBox(str1m_half.replace("H", "R"))
    }

    @Bench
    func BenchmarkStringReplace_N1m_all(): Unit {
        blackBox(str1m_all.replace("H", "R"))
    }
}
