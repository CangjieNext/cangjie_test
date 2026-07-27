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
// TIMEOUT: 1800

import std.collection.*
import std.time.*
import std.convert.*

var counts: ArrayList<Int64> = ArrayList<Int64>([32, 256, 2 * 1024, 16 * 1024, 128 * 1024])

func benchmarkRemoveFromHashset(hashSet: HashSet<String>, keys: ArrayList<String>) {
    var tmpSet = HashSet<String> (hashSet)
    for (key in keys) {
        tmpSet.remove(key)
    }
}

func timeBenchmarkRemoveFromHashset(num: Int64) {
    var (hashSet, keys) = generatHashSetTarget(num, "1")
    let N = 100000000 / num;
    let startTime = DateTime.now()
    for (i in 0..N) {
        benchmarkRemoveFromHashset(hashSet, keys)
    }
    let endTime = DateTime.now()
    let perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(N)
    println("BenchmarkRemoveFromHashset_${types[0]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (count in counts) {
        timeBenchmarkRemoveFromHashset(count)
    }
    return 0
}
