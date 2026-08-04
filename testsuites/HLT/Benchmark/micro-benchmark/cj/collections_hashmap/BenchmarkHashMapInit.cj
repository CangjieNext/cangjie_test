/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color

import std.time.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Init_Capacity { 
    static var arr = HashMap<Int64, Int64>()
    static var arr0 = HashMap<String, Int64>()

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_16(): Unit {
        arr = HashMap<Int64, Int64>()
    }

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_128(): Unit {
        arr = HashMap<Int64, Int64>(128)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_1024(): Unit {
        arr = HashMap<Int64, Int64>(1024)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_8192(): Unit {
        arr = HashMap<Int64, Int64>(8192)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_65536(): Unit {
        arr = HashMap<Int64, Int64>(65536)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_Int64_N_1048576(): Unit {
        arr = HashMap<Int64, Int64>(1048576)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_16(): Unit {
        arr0 = HashMap<String, Int64>()
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_128(): Unit {
        arr0 = HashMap<String, Int64>(128)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_1024(): Unit {
        arr0 = HashMap<String, Int64>(1024)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_8192(): Unit {
        arr0 = HashMap<String, Int64>(8192)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_65536(): Unit {
        arr0 = HashMap<String, Int64>(65536)
    }

    @Bench
    func BenchmarkHashMapInitCapacity_String_N_1048576(): Unit {
        arr0 = HashMap<String, Int64>(1048576)
    }

    @AfterAll
    func teardown() {
        println(arr.size)
        println(arr0.size)
    }
}
