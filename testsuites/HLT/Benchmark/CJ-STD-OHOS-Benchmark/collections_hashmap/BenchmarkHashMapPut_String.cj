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

@Test
@Configure[minDuration: Duration.second * 3, measurement: TimeNow(TimeUnit.Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Put_String {
    static func makeString(size: Int32) {
        return unsafe {String.fromUtf8Unchecked(SecureRandom(priv: true).nextBytes(size))}
    }

    static func randomString(capacity: Int64): Array<String> {
        let loadfactor = 0.7
        var keys = Array<String>(Int64(Float64(capacity) * loadfactor), repeat: "")
        var size = keys.size
        for (i in 0..size) {
            let str = makeString(100)
            keys[i] = str
        }
        return keys
    }

    static var keys: Array<String> = []

    @Strategy[capacity in [16, 128, 1024, 8096, 65536]]
    static func hashmapStrategy(capacity: Int64): GenerateEachInputProvider<HashMap<String, Int64>> {
        keys = randomString(capacity)
        GenerateEachInputProvider { => HashMap<String, Int64>() }
    }

    @Bench[x in hashmapStrategy]
    func BenchmarkHashMapPut_String_(x: HashMap<String, Int64>): Unit {
        for (v in keys) {
            x.add(v, 0)
        }
    }

}

main(){
    let testInfo = Test_HashMap_Put_String().asTestSuite().runBenchmarks().reportTo(RawStatsReporter())
    for(cases in testInfo) {
        println("${cases[0]}: ms = ${cases[1][0]/1000000.0}")
    }
}
