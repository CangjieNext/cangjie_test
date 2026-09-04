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
    var str1 = Array<String>(8, repeat:"s")
    var str1_32 = Array<String>(32, repeat:"s")
    var str1_256 = Array<String>(256, repeat:"s")
    var str1k = Array<String>(1024, repeat:"s")
    var str1m = Array<String>(1024*1024, repeat:"s")

    @Bench
    func BenchmarkStringJoin_N8(): Unit {
        blackBox(String.join(str1))
    }

    @Bench
    func BenchmarkStringJoin_N32(): Unit {
        blackBox(String.join(str1_32))
    }

    @Bench
    func BenchmarkStringJoin_N256(): Unit {
        blackBox(String.join(str1_256))
    }

    @Bench
    func BenchmarkStringJoin_N1k(): Unit {
        blackBox(String.join(str1k))
    }

    @Bench
    func BenchmarkStringJoin_N1m(): Unit {
        blackBox(String.join(str1m))
    }
}
