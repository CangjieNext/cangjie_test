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

var res :Option<UInt8> = None

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second] 
public class Test_suit { 
    var str1 = "H" * 1
    var str2 = "H" * 1024
    var str3 = "H" * 1024 * 1024

    @Bench
    func BenchmarkStringTryGet_N1(): Unit {
        res = str1.get(0)
    }


    @Bench
    func BenchmarkStringTryGet_N1k_start(): Unit {
        res = str2.get(0)
    }

    @Bench
    func BenchmarkStringTryGet_N1k_middle(): Unit {
        res = str2.get(512)
    }

    @Bench
    func BenchmarkStringTryGet_N1k_end(): Unit {
        res = str2.get(1023)
    }

    @Bench
    func BenchmarkStringTryGet_N1m_start(): Unit {
        res = str3.get(0)
    }

    @Bench
    func BenchmarkStringTryGet_N1m_middle(): Unit {
        res = str3.get(1024*512)
    }

    @Bench
    func BenchmarkStringTryGet_N1m_end(): Unit {
        res = str3.get(1024 * 1024 -1)
    }
}
