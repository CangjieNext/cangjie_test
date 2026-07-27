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

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_HashMap_Put_Int64 {
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
    @Strategy[len in [16, 128, 1024, 8192, 65536, 1048576]]
    func hashMapStrategy(len: Int64): GenerateEachInputProvider<HashMap<Int64, Int64>> {
        keys = randomInt64(len)
        GenerateEachInputProvider { => 
            HashMap<Int64, Int64>(len)    
        }
    }

    @Bench[x in hashMapStrategy]
    func BenchmarkHashMapPut_Operator_Int64_(x: HashMap<Int64, Int64>): Unit {
        for (v in keys) {
            x[v] = 0
        }
    }
}