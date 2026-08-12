/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: common_collection.cj
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f common_collection.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import std.collection.*
import std.time.*
import std.convert.*

var counts: ArrayList<Int64> = ArrayList<Int64>([32, 256, 2 * 1024, 16 * 1024, 128 * 1024])

func timeBenchmarkAddToHashset(num: Int64) {
    let N = 100000000 / num;
    var startTime = DateTime.now()
    for (i in 0..N) {
        generatHashSet(num, 1)
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(N)
    println("BenchmarkAddToHashset_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}


main(): Int64 {
    for (count in counts) {
        timeBenchmarkAddToHashset(count)
    }
    return 0
}
