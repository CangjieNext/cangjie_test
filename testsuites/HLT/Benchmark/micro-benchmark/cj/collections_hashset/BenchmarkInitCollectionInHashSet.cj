/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: common_collection.cj
// EXEC: %compiler %cmp_opt %import-cangjie-stdx -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f common_collection.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color

import std.collection.*
import std.time.*
import stdx.crypto.crypto.*
import std.runtime.*

func GenerateArray(n: Int64): Array<Int64> {
    let m = SecureRandom()
    var _arr = ArrayList<Int64>()
    for (i in 0..n) {
        let num = m.nextInt64()
        _arr.add(num)
    }
    return _arr.toArray()
}

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Init_Collection_In_HashSet {

    @Strategy[len in [32, 256, 2048, 16384, 131072]]
    func initData(len: Int64): Array<Int64> {
        GenerateArray(len)
    }

    @Bench[data in initData]
    func BenchmarkInitCollectionInHashSet(data: Array<Int64>): Unit {
        blackBox(HashSet<Int64>(data))
    }
}