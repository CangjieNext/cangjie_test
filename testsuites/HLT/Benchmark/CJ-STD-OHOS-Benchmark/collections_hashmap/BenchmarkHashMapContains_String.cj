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

func randomString(size: Int32) {
    return unsafe {String.fromUtf8Unchecked(SecureRandom(priv: true).nextBytes(size))}
}

@Test
@Configure[minDuration: Duration.second * 3, measurement: TimeNow(TimeUnit.Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Contains_String {
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
    public func BenchmarkHashMapContains_String_16(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_128(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_1024(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_8192(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

    @Bench
    public func BenchmarkHashMapContains_String_65536(): Unit {
        for (v in keys) {
            boolean = hashmap.contains(v)
        }
    }

}

main(){
    let testInfo = Test_HashMap_Contains_String().asTestSuite().runBenchmarks().reportTo(RawStatsReporter())
    for(cases in testInfo) {
        println("${cases[0]}: ms = ${cases[1][0]/1000000.0}")
    }
}
