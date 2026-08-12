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
import stdx.crypto.crypto.*

var boolean = true

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Contains_Int64_NonExist {
    let capacity = [16, 128, 1024, 8192, 65536, 1048576]
    let loadfactor = 0.7
    var count = 0
    var hashmap = HashMap<Int64, Int64>()
    var keys = Array<Int64>()

    public override func beforeEach(): Unit {
        let m = SecureRandom()
        var map_size = capacity[count]
        var arr_size = Int64(Float64(map_size) * loadfactor)
        hashmap = HashMap<Int64, Int64>(map_size)
        keys = Array<Int64>(arr_size, repeat: 0)
        for (i in 0..arr_size) {
            let num = m.nextInt64()
            keys[i] = num
        }
        for (_ in 0..arr_size) {
            let num = m.nextInt64()
            hashmap.add(num, 0)
        }
        count += 1
    }

    public override func afterAll(): Unit {
        if (count != capacity.size) {
            println("error: illegal number of running benchmark cases")
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_16(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_128(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_1024(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_8192(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_65536(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Int64_NonExist_1048576(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }
}