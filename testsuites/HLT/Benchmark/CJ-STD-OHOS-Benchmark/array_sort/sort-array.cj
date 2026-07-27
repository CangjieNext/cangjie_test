/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.sort.*
import std.math.*
import std.random.Random

let TIMEOUT = Duration.millisecond * 50

func randomize(arr: Array<Int64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextInt64()
    }
}


func timeBenchmarkArraySort(stable: Bool) {
    var totalCostTime = Duration.Zero
    var srcArr = Array<Int64>(1048576, repeat: 0)
    var (i, reps, step) = (0, 1, 1)
    while (i < reps) {
        randomize(srcArr)
        var startTime = DateTime.now()
        srcArr.sort(stable: stable)
        totalCostTime += DateTime.now() - startTime

        i++
        if (i == reps && totalCostTime < TIMEOUT) {
            reps += step
            step *= 2
        }
    }

    return Float64(totalCostTime.toNanoseconds()) / Float64(reps)
}


func timeBenchmarkArraySortBy(stable: Bool) {
    var comparator = {l: Int64, r: Int64 => r.compare(l)}
    var totalCostTime = Duration.Zero
    var srcArr = Array<Int64>(1048576, repeat: 0)

    var (i, reps, step) = (0, 1, 1)
    while (i < reps) {
        randomize(srcArr)
        var startTime = DateTime.now()
        srcArr.sortBy(stable: true, comparator: comparator)
        totalCostTime += DateTime.now() - startTime
        i++
        if (i == reps && totalCostTime < TIMEOUT) {
            reps += step
            step *= 2
        }
    }

    return Float64(totalCostTime.toNanoseconds()) / Float64(reps)
}


class Benchmark {
    /*
        All cases use Array<Int64> which size is 1M
    */
    func runIterationTime() {
        println("sort-unstable-int-1M: ms = ${timeBenchmarkArraySort(false) / 1000000.0}")
        println("sort-stable-int-1M: ms = ${timeBenchmarkArraySort(true) / 1000000.0}")
        println("sortBy-unstable-int-1M: ms = ${timeBenchmarkArraySortBy(false) / 1000000.0}")
        println("sortBy-stable-int-1M: ms = ${timeBenchmarkArraySortBy(true) / 1000000.0}")
    }
}


main() {
    Benchmark().runIterationTime()
}
