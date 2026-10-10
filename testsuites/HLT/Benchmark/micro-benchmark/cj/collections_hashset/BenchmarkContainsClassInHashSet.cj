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
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Contains_Class_In_HashSet {

    @Strategy[len in [32, 256, 2048, 16384, 131072]]
    func hashSetData(len: Int64): (HashSet<A>, ArrayList<A>) {
        generatHashSetTarget(len, A("", 1))
    }

    @Bench[data in hashSetData]
    func BenchmarkContainsInHashset(data: (HashSet<A>, ArrayList<A>)): Unit {
        for (key in data[1]) {
            blackBox(data[0].contains(key))
        }
    }
}