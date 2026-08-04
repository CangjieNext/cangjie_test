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
// TIMEOUT: 1800

import std.time.*
import std.collection.*
import stdx.crypto.crypto.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Remove {
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
    @Strategy[len in [16, 128, 1024, 8192, 65536, 1048576]]
    func hashMapStrategy(len: Int64): GenerateEachInputProvider<HashMap<String, Int64>> {
        keys = randomString(len)
        GenerateEachInputProvider { => 
            let hashmap = HashMap<String, Int64>(len)
            for (v in keys) {
                hashmap.add(v, 0)
            }       
            hashmap
        }
    }

    @Bench[x in hashMapStrategy]
    func BenchmarkHashMapRemove_(x: HashMap<String, Int64>): Unit {
        for (v in keys) {
            x.remove(v)
        }
    }
}