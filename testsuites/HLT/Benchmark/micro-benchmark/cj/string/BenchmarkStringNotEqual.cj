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
    var str1 = "H"
    var str1_equal = "H"
    var str1_notEqual = "S"

    var str1k = "H" * 1024
    var str1k_equal = "H" * 1024
    var str1k_notEqual = "H" * 1023 + "S"

    var str1m = "H" * 1024 * 1024
    var str1m_equal = "H" * 1024 * 1024
    var str1m_notEqual = "H" * (1024 * 1024 - 1) + "S"

    @Bench
    func BenchmarkStringNotEqual_N1_Equal(): Unit {
        blackBox(str1 != str1_equal)
    }

    @Bench
    func BenchmarkStringNotEqual_N1_notEqual(): Unit {
        blackBox(str1 != str1_notEqual)
    }

    @Bench
    func BenchmarkStringNotEqual_N1k_Equal(): Unit {
        blackBox(str1k != str1k_equal)
    }

    @Bench
    func BenchmarkStringNotEqual_N1k_notEqual(): Unit {
        blackBox(str1k != str1k_notEqual)
    }

    @Bench
    func BenchmarkStringNotEqual_N1m_Equal(): Unit {
        blackBox(str1m != str1m_equal)
    }

    @Bench
    func BenchmarkStringNotEqual_N1m_notEqual(): Unit {
        blackBox(str1m != str1m_notEqual)
    }
}
