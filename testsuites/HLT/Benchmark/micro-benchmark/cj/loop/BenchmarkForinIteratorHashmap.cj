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
import stdx.crypto.crypto.*
import std.collection.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Forin_Hashmap {
    var sum = 0
    var _count = 0
    var _map = HashMap<Int64,Int64>()
    let _range = [32, 256, 2048]


    @BeforeEach
    public func GenerateArray(): Unit {
        let size = _range[_count]
        let m = SecureRandom()
        for(_ in 0..size)
        {
            let num = m.nextInt64()
            _map.add(num, 0)
        }
        _count += 1
    }

    @AfterEach
    public func Reset(): Unit {
        sum = 0
    }

    @Bench
    func BenchmarkForinIteratorHashmap_N_32(): Unit {
        for (j in _map) {
            sum += j[0]
        }
    }

    @Bench
    func BenchmarkForinIteratorHashmap_N_256(): Unit {
        for (j in _map) {
            sum += j[0]
        }
    }

    @Bench
    func BenchmarkForinIteratorHashmap_N_2048(): Unit {
        for (j in _map) {
            sum += j[0]
        }
    }
}