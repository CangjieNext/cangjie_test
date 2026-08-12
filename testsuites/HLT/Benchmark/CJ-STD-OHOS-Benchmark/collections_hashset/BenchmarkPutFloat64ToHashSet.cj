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

func addElementToHashset(counts: Int64, targetHashset: HashSet<Float64>) {
    for (num in 0..counts) {
        targetHashset.put(Float64(num))
    }
}

func generateHashset(counts: Int64, flag: Float64): ArrayList<HashSet<Float64>> {
    var container = ArrayList<HashSet<Float64>>()
    for (i in 0..counts) {
        container.add(HashSet<Float64>())
    }
    return container
}

func generatHashSetTarget(counts: Int64, times: Int64, flag: Float64): ArrayList<HashSet<Float64>> {
    var ArrayListSets = generateHashset(times, flag)
    for (ArrayListSet in ArrayListSets) {
        addElementToHashset(counts, ArrayListSet)
    }
    return ArrayListSets
}

let reps = 10
var counts: ArrayList<Int64> = ArrayList<Int64>([32, 256, 2 * 1024, 16 * 1024])
func timeBenchmarkAddToHashset(num: Int64) {
    var startTime = DateTime.now()
    generatHashSetTarget(num, reps, Float64(1))
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toMilliseconds()) / Float64(reps)
    println("BenchmarkAddToHashset_Float64_${num.toString()}: ms = ${perTime}")
}

main(): Int64 {
    for (count in counts) {
        timeBenchmarkAddToHashset(count)
    }
    return 0
}
