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
public class Test_HashMap_Init_Collection {
    static var _map = HashMap<Int64,Int64>()
    var arr = Array<(Int64,Int64)>()
    let _range = [32, 256, 2048]
    var count = 0

    @BeforeEach
    public func GenerateArray(): Unit {
        let m = SecureRandom()
        let size = _range[count]
        var _arr = ArrayList<(Int64,Int64)>()
        for (i in 0..size) {
            let num = m.nextInt64()
            _arr.add((i, num))
        }

        arr = _arr.toArray()
        count += 1
    }

    @Bench
    func BenchmarkHashMapInitCollection_N_32(): Unit {
        _map = HashMap<Int64,Int64>(arr)
    }

    @Bench
    func BenchmarkHashMapInitCollection_N_256(): Unit {
        _map = HashMap<Int64,Int64>(arr)
    }

    @Bench
    func BenchmarkHashMapInitCollection_N_2048(): Unit {
        _map = HashMap<Int64,Int64>(arr)
    }

    @AfterAll
    func teardown() {
        println(_map.size)
    }
}
