/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*
import crypto.crypto.*

import std.unittest.*
import std.unittest.testmacro.*

var boolean = true

@Test
@Configure[minDuration: Duration.second * 3, measurement: TimeNow(TimeUnit.Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Contains_Float64 {
    let capacity = [16, 128, 1024, 8192, 65536, 1048576]
    let loadfactor = 0.7
    var count = 0
    var hashmap = HashMap<Float64, Int64>()
    var keys = Array<Float64>()

    public override func beforeEach(): Unit {
        let m = SecureRandom()
        var map_size = capacity[count]
        var arr_size = Int64(Float64(map_size) * loadfactor)
        hashmap = HashMap<Float64, Int64>(map_size)
        keys = Array<Float64>(arr_size, repeat: 1.0)
        for (i in 0..arr_size) {
            let num = m.nextFloat64()
            keys[i] = num
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
    public func BenchmarkHashMapContains_Float64_16(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Float64_128(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Float64_1024(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Float64_8192(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Float64_65536(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_Float64_1048576(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }
}

main(){
    let testInfo = Test_HashMap_Contains_Float64().asTestSuite().runBenchmarks().reportTo(RawStatsReporter())
    for(cases in testInfo) {
        println("${cases[0]}: ms = ${cases[1][0]/1000000.0}")
    }
}
