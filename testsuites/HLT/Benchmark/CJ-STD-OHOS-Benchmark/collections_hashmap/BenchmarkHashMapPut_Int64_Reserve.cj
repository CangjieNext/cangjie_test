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
public class Test_HashMap_Put_Int64_Reserve {
    static func randomInt64(capacity: Int64): Array<Int64> {
        let loadfactor = 0.7
        var keys = Array<Int64>(Int64(Float64(capacity) * loadfactor), repeat: 0)
        let m = SecureRandom()
        var size = keys.size
        for (i in 0..size) {
            let num = m.nextInt64()
            keys[i] = num
        }
        return keys
    }

    static var keys: Array<Int64> = []

    @Strategy[capacity in [16, 128, 1024, 8096, 65536, 1048576]]
    static func hashmapStrategy(capacity: Int64): GenerateEachInputProvider<HashMap<Int64, Int64>> {
        keys = randomInt64(capacity)
        GenerateEachInputProvider { => HashMap<Int64, Int64>(capacity) }
    }

    @Bench[x in hashmapStrategy]
    func BenchmarkHashMapPut_Int64_Reserve_(x: HashMap<Int64, Int64>): Unit {
        for (v in keys) {
            x.add(v, 0)
        }
    }

}

main(){
    let testInfo = Test_HashMap_Put_Int64_Reserve().asTestSuite().runBenchmarks().reportTo(RawStatsReporter())
    for(cases in testInfo) {
        println("${cases[0]}: ms = ${cases[1][0]/1000000.0}")
    }
}
