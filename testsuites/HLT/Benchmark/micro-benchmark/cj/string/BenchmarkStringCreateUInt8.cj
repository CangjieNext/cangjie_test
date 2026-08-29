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
    var arr1 = Array<Byte>(8, repeat:79)
    var arr1_32 = Array<Byte>(32, repeat:79)
    var arr1_256 = Array<Byte>(256, repeat:79)
    var arr2 = Array<Byte>(1024, repeat:79)
    var arr3 = Array<Byte>(1024 * 1024, repeat:79)

    @Bench
    func BenchmarkStringCreateUInt8_N8(): Unit {
        unsafe {
            blackBox(String.fromUtf8Unchecked(arr1))
        }
    }

    @Bench
    func BenchmarkStringCreateUInt8_N32(): Unit {
        unsafe {
            blackBox(String.fromUtf8Unchecked(arr1_32))
        }
    }

    @Bench
    func BenchmarkStringCreateUInt8_N256(): Unit {
        unsafe {
            blackBox(String.fromUtf8Unchecked(arr1_256))
        }
    }

    @Bench
    func BenchmarkStringCreateUInt8_N1K(): Unit {
        unsafe {
            blackBox(String.fromUtf8Unchecked(arr2))
        }
    }

    @Bench
    func BenchmarkStringCreateUInt8_N1M(): Unit {
        unsafe {
            blackBox(String.fromUtf8Unchecked(arr3))
        }
    }
}
