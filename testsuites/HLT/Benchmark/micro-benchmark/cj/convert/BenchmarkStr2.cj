/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.convert.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Str2 {

    @Bench
    func BenchmarkStr2Int8(): Unit {
        blackBox(Int8.parse("100"))
    }

    @Bench
    func BenchmarkStr2Int16(): Unit {
        blackBox(Int16.parse("100"))
    }

    @Bench
    func BenchmarkStr2Int32(): Unit {
        blackBox(Int32.parse("100"))
    }

    @Bench
    func BenchmarkStr2Int64(): Unit {
        blackBox(Int64.parse("100"))
    }

    @Bench
    func BenchmarkStr2UInt8(): Unit {
        blackBox(UInt8.parse("100"))
    }

    @Bench
    func BenchmarkStr2UInt16(): Unit {
        blackBox(UInt16.parse("100"))
    }

    @Bench
    func BenchmarkStr2UInt32(): Unit {
        blackBox(UInt32.parse("100"))
    }

    @Bench
    func BenchmarkStr2UInt64(): Unit {
        blackBox(UInt64.parse("100"))
    }

    @Bench
    func BenchmarkStr2Float16(): Unit {
        blackBox(Float16.parse("100.100"))
    }

    @Bench
    func BenchmarkStr2Float32(): Unit {
        blackBox(Float32.parse("100.100"))
    }

    @Bench
    func BenchmarkStr2Float64(): Unit {
        blackBox(Float64.parse("100.100"))
    }

    @Bench
    func BenchmarkStr2Bool(): Unit {
        blackBox(Bool.parse("true"))
    }

    @Bench
    func BenchmarkStr2Bool_false(): Unit {
        blackBox(Bool.parse("false"))
    }

    @Bench
    func BenchmarkStr2Char(): Unit {
        blackBox(Rune.parse("'a'"))
    }
}