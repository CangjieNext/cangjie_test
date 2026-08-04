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
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_ArrayList_Equal {
    static var int_32 = ArrayList<Int64>(32, {index: Int64 => index})
    static var int_256 = ArrayList<Int64>(256, {index: Int64 => index})
    static var int_2048 = ArrayList<Int64>(2048, {index: Int64 => index})

    static var int_32_equal = ArrayList<Int64>(32, {index: Int64 => index})
    static var int_256_equal = ArrayList<Int64>(256, {index: Int64 => index})
    static var int_2048_equal = ArrayList<Int64>(2048, {index: Int64 => index})

    static var int_32_partequal = ArrayList<Int64>(32, {index: Int64 => index % 16})
    static var int_256_partequal = ArrayList<Int64>(256, {index: Int64 => index % 128})
    static var int_2048_partequal = ArrayList<Int64>(2048, {index: Int64 => index % 1024})

    static var int_32_unequal = ArrayList<Int64>(32, {index: Int64 => index + 16})

    var res = false

    @Bench
    func BenchmarkArrayListEqual_Int64_N32(): Unit {
        res = int_32 == int_32_equal
    }

    @Bench
    func BenchmarkArrayListEqual_Int64_N128(): Unit {
        res = int_256 == int_256_equal
    }

    @Bench
    func BenchmarkArrayListEqual_Int64_N2048(): Unit {
        res = int_2048 == int_2048_equal
    }

    @Bench
    func BenchmarkArrayListEqual_PartEqual_Int64_N32(): Unit {
        res = int_32 == int_32_partequal
    }

    @Bench
    func BenchmarkArrayListEqual_PartEqual_Int64_N128(): Unit {
        res = int_256 == int_256_partequal
    }

    @Bench
    func BenchmarkArrayListEqual_PartEqual_Int64_N2048(): Unit {
        res = int_2048 == int_2048_partequal
    }

    @Bench
    func BenchmarkArrayListEqual_Unequal_Int64_N32(): Unit {
        res = int_32 == int_32_unequal
    }
}
