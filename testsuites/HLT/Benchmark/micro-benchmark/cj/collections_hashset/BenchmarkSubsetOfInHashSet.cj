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
// TIMEOUT: 2400

import std.collection.*
import std.time.*
import stdx.crypto.crypto.*
import std.runtime.*
import std.unittest.*

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
public class Test_SubsetOf_In_HashSet {

    @Strategy[len in [32, 256, 2048]]
    func existData(len: Int64): GenerateEachInputProvider<(HashSet<Int64>, HashSet<Int64>)> {
        GenerateEachInputProvider {
            let arr = GenerateArray(len)
            let arr_2 = arr[0..len / 2]
            (HashSet<Int64>(arr), HashSet<Int64>(arr_2))
        }
    }

    @Bench[data in existData]
    func BenchmarkSubsetOf_Exist(data: (HashSet<Int64>, HashSet<Int64>)): Unit {
        blackBox(data[1].subsetOf(data[0]))
    }

    @Strategy[len in [32, 256, 2048]]
    func nonexistData(len: Int64): GenerateEachInputProvider<(HashSet<Int64>, HashSet<Int64>)> {
        GenerateEachInputProvider {
            let arr = GenerateArray(len)
            let arr_2 = GenerateArray(len / 2)
            (HashSet<Int64>(arr), HashSet<Int64>(arr_2))
        }
    }

    @Bench[data in nonexistData]
    func BenchmarkSubsetOf_Nonexist(data: (HashSet<Int64>, HashSet<Int64>)): Unit {
        blackBox(data[1].subsetOf(data[0]))
    }
}
