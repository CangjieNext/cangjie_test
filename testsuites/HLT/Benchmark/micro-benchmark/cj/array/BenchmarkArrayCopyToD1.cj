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

var targetArr_Int64_32 = Array<Int64>(32, repeat: 0)
var targetArr_Int64_2048 = Array<Int64>(2048, repeat: 0)
var targetArr_Int64_131072 = Array<Int64>(131072, repeat: 0)
var targetArr_Int64_8388608 = Array<Int64>(8388608, repeat: 0)
var targetArr_String_32 = Array<String>(32, repeat: "")
var targetArr_String_2048 = Array<String>(2048, repeat: "")
var targetArr_String_131072 = Array<String>(131072, repeat: "")
var targetArr_String_8388608 = Array<String>(8388608, repeat: "")

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Array_CopyTo { 
    static var srcArr_Int64_32 = Array<Int64>(32, {index: Int64 => index})
    static var srcArr_Int64_2048 = Array<Int64>(2048, {index: Int64 => index})
    static var srcArr_Int64_131072 = Array<Int64>(131072, {index: Int64 => index})
    static var srcArr_Int64_8388608 = Array<Int64>(8388608, {index: Int64 => index})

    static var srcArr_String_32 = Array<String>(32, {index: Int64 => index.toString()})
    static var srcArr_String_2048 = Array<String>(2048, {index: Int64 => index.toString()})
    static var srcArr_String_131072 = Array<String>(131072, {index: Int64 => index.toString()})
    static var srcArr_String_8388608 = Array<String>(8388608, {index: Int64 => index.toString()})

    @Bench
    func BenchmarkArrayCopyTo_Int64_D1_N32(): Unit {
        srcArr_Int64_32.copyTo(targetArr_Int64_32)
    }

    @Bench
    func BenchmarkArrayCopyTo_Int64_D1_N2048(): Unit {
        srcArr_Int64_2048.copyTo(targetArr_Int64_2048)
    }

    @Bench
    func BenchmarkArrayCopyTo_Int64_D1_N131072(): Unit {
        srcArr_Int64_131072.copyTo(targetArr_Int64_131072)
    }

    @Bench
    func BenchmarkArrayCopyTo_Int64_D1_N8388608(): Unit {
        srcArr_Int64_8388608.copyTo(targetArr_Int64_8388608)
    }

    @Bench
    func BenchmarkArrayCopyTo_String_D1_N32(): Unit {
        srcArr_String_32.copyTo(targetArr_String_32)
    }

    @Bench
    func BenchmarkArrayCopyTo_String_D1_N2048(): Unit {
        srcArr_String_2048.copyTo(targetArr_String_2048)
    }

    @Bench
    func BenchmarkArrayCopyTo_String_D1_N131072(): Unit {
        srcArr_String_131072.copyTo(targetArr_String_131072)
    }

    @Bench
    func BenchmarkArrayCopyTo_String_D1_N8388608(): Unit {
        srcArr_String_8388608.copyTo(targetArr_String_8388608)
    }
}
