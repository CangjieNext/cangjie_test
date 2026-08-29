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
    var str1 = "r" * 1
    var str1k = "r" * 1024
    var str1k_mid = "H" * 512 + "r" + "H" * 511
    var str1k_end = "H" * 1023 +"r" 
    var str1m = "r" * 1024 * 1024
    var str1m_mid = "H" * 1024 * 512 + "r" + "H" * (1024 *512 -1)
    var str1m_end = "H" * (1024 * 1024 - 1) + "r"

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1(): Unit {
        blackBox(str1.indexOf(UInt8(114), 0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_start_start(): Unit {
        blackBox(str1k.indexOf(UInt8(114),0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_start_mid(): Unit {
        blackBox(str1k.indexOf(UInt8(114),512))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_start_end(): Unit {
        blackBox(str1k.indexOf(UInt8(114),1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_mid_start(): Unit {
        blackBox(str1k_mid.indexOf(UInt8(114),0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_mid_mid(): Unit {
        blackBox(str1k_mid.indexOf(UInt8(114),512))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_mid_end(): Unit {
        blackBox(str1k_mid.indexOf(UInt8(114),1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_end_start(): Unit {
        blackBox(str1k_end.indexOf(UInt8(114),0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_end_mid(): Unit {
        blackBox(str1k_end.indexOf(UInt8(114),512))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1k_end_end(): Unit {
        blackBox(str1k_end.indexOf(UInt8(114),1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_start_start(): Unit {
        blackBox(str1m.indexOf(UInt8(114),0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_start_mid(): Unit {
        blackBox(str1m.indexOf(UInt8(114),512*1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_start_end(): Unit {
        blackBox(str1m.indexOf(UInt8(114),1024*1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_mid_start(): Unit {
        blackBox(str1m_mid.indexOf(UInt8(114),0))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_mid_mid(): Unit {
        blackBox(str1m_mid.indexOf(UInt8(114),512*1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_mid_end(): Unit {
        blackBox(str1m_mid.indexOf(UInt8(114),1024*1024))
    }

    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_end_start(): Unit {
        blackBox(str1m_end.indexOf(UInt8(114),0))
    }
    
    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_end_mid(): Unit {
        blackBox(str1m_end.indexOf(UInt8(114),512*1024))
    }
    
    @Bench
    func BenchmarkStringIndexOfByteIndex_N1m_end_end(): Unit {
        blackBox(str1m_end.indexOf(UInt8(114),1024*1024))
    }
}
