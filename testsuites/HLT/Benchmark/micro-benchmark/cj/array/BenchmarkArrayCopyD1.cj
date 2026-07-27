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

var targetArr_32 = Array<Int64>(32, repeat: 0)
var targetArr_256 = Array<Int64>(256, repeat: 0)
var targetArr_2048 = Array<Int64>(2048, repeat: 0)
var targetArr_16384 = Array<Int64>(16384, repeat: 0)
var targetArr_131072 = Array<Int64>(131072, repeat: 0)
var targetArr_1048576 = Array<Int64>(1048576, repeat: 0)
var targetArr_8388608 = Array<Int64>(8388608, repeat: 0)

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Array_Init { 
    static var srcArr_32 = Array<Int64>(32, {index: Int64 => index})
    static var srcArr_256 = Array<Int64>(256, {index: Int64 => index})
    static var srcArr_2048 = Array<Int64>(2048, {index: Int64 => index})
    static var srcArr_16384 = Array<Int64>(16384, {index: Int64 => index})
    static var srcArr_131072 = Array<Int64>(131072, {index: Int64 => index})
    static var srcArr_1048576 = Array<Int64>(1048576, {index: Int64 => index})
    static var srcArr_8388608 = Array<Int64>(8388608, {index: Int64 => index})

    @Bench
    func BenchmarkArrayCopyD1_N32(): Unit {
        srcArr_32.copyTo(targetArr_32, 0, 0, 32)
    }

    @Bench
    func BenchmarkArrayCopyD1_N256(): Unit {
        srcArr_256.copyTo(targetArr_256, 0, 0, 256)
    }

    @Bench
    func BenchmarkArrayCopyD1_N2048(): Unit {
        srcArr_2048.copyTo(targetArr_2048, 0, 0, 2048)
    }

    @Bench
    func BenchmarkArrayCopyD1_N16384(): Unit {
        srcArr_16384.copyTo(targetArr_16384, 0, 0, 16384)
    }

    @Bench
    func BenchmarkArrayCopyD1_N131072(): Unit {
        srcArr_131072.copyTo(targetArr_131072, 0, 0, 131072)
    }

    @Bench
    func BenchmarkArrayCopyD1_N1048576(): Unit {
        srcArr_1048576.copyTo(targetArr_1048576, 0, 0, 1048576)
    }

    @Bench
    func BenchmarkArrayCopyD1_N8388608(): Unit {
        srcArr_8388608.copyTo(targetArr_8388608, 0, 0, 8388608)
    }
}
