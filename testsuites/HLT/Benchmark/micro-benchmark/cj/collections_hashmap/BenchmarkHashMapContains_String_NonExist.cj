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

func randomString(size: Int32) {
    return unsafe {String.fromUtf8Unchecked(SecureRandom(priv: true).nextBytes(size))}
}

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Contains_String_NonExist {
    let capacity = [16, 128, 1024, 8192, 65536]
    let loadfactor = 0.7
    var count = 0
    var hashmap = HashMap<String, Int64>()
    var keys = Array<String>()

    @BeforeEach
    public func beforeEach(): Unit {
        var map_size = capacity[count]
        var arr_size = Int64(Float64(map_size) * loadfactor)
        hashmap = HashMap<String, Int64>(map_size)
        keys = Array<String>(arr_size, repeat: "")
        for (i in 0..arr_size) {
            let str = randomString(100)
            keys[i] = str
        }
        for (_ in 0..arr_size) {
            let str = randomString(100)
            hashmap.add(str, 0)
        }
        count += 1
    }

    @AfterAll
    public func afterAll(): Unit {
        if (count != capacity.size) {
            println("error: illegal number of running benchmark cases")
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_NonExist_16(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_NonExist_128(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_NonExist_1024(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_NonExist_8192(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_NonExist_65536(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }
}