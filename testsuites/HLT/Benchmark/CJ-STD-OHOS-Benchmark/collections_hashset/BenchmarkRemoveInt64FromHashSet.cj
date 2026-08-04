/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*
import std.convert.*

func addElementToHashset(counts: Int64, targetHashset: HashSet<Int64>) {
    for (num in 0..counts) {
        targetHashset.put(Int64(num))
    }
}

func generateHashset(counts: Int64, flag: Int64): ArrayList<HashSet<Int64>> {
    var container = ArrayList<HashSet<Int64>>()
    for (i in 0..counts) {
        container.add(HashSet<Int64>())
    }
    return container
}

func generatHashSetTarget(counts: Int64, times: Int64, flag: Int64): ArrayList<HashSet<Int64>> {
    var ArrayListSets = generateHashset(times, flag)
    for (ArrayListSet in ArrayListSets) {
        addElementToHashset(counts, ArrayListSet)
    }
    return ArrayListSets
}

let reps = 10
var counts: ArrayList<Int64> = ArrayList<Int64>([2 * 1024, 16 * 1024, 128 * 1024])
func benchmarkRemoveFromHashset(ArrayListSets: ArrayList<HashSet<Int64>>, nums: Int64) {
    for (ArrayListSet in ArrayListSets) {
        for (i in 0..nums) {
            ArrayListSet.remove(i)
        }
    }
}

func timeBenchmarkRemoveFromHashset(num: Int64) {
    var containers = generatHashSetTarget(num, reps, 1)
    var startTime = DateTime.now()
    benchmarkRemoveFromHashset(containers, num)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toMilliseconds()) / Float64(reps)
    println("BenchmarkRemoveFromHashset_Int64_${num.toString()}: ms = ${perTime}")
}

main(): Int64 {
    for (count in counts) {
        timeBenchmarkRemoveFromHashset(count)
    }
    return 0
}
