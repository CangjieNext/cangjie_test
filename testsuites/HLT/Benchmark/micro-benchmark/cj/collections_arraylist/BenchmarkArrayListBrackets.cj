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
@Configure[explicitGC: Disabled]
public class Test_ArrayList_Brackets { 
    static var arr_16 = ArrayList<String>()
    static var arr_128 = ArrayList<String>()
    static var arr_1024 = ArrayList<String>()
    static var arr_1048576 = ArrayList<String>()

    static var int_16 = ArrayList<Int64>(16, {index: Int64 => index})
    static var int_128 = ArrayList<Int64>(128, {index: Int64 => index})
    static var int_1024 = ArrayList<Int64>(1024, {index: Int64 => index})
    static var int_1048576 = ArrayList<Int64>(1048576, {index: Int64 => index})

    static var str = ""
    static var int = 1

    @BeforeAll
    public func beforeAll(): Unit {
        for (_ in 0..16) {
            arr_16.add("cj")
        }
        for (_ in 0..128) {
            arr_128.add("cj")
        }
        for (_ in 0..1024) {
            arr_1024.add("cj")
        }
        for (_ in 0..1048576) {
            arr_1048576.add("cj")
        }
    }

    @Bench
    func BenchmarkArrayListBrackets_N16(): Unit {
        str = arr_16[8]
    }

    @Bench
    func BenchmarkArrayListBrackets_N128(): Unit {
        str = arr_128[64]
    }

    @Bench
    func BenchmarkArrayListBrackets_N1024(): Unit {
        str = arr_1024[512]
    }

    @Bench
    func BenchmarkArrayListBrackets_N1048576(): Unit {
        str = arr_1048576[500000]
    }
    
    @Bench
    func BenchmarkArrayListBrackets_Int64_N16(): Unit {
        int = int_16[8]
    }

    @Bench
    func BenchmarkArrayListBrackets_Int64_N128(): Unit {
        int = int_128[64]
    }

    @Bench
    func BenchmarkArrayListBrackets_Int64_N1024(): Unit {
        int = int_1024[512]
    }

    @Bench
    func BenchmarkArrayListBrackets_Int64_N1048576(): Unit {
        int = int_1048576[500000]
    }
}
