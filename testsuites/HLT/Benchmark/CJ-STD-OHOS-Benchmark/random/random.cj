/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.math.*
import std.random.Random

func randomizeInt(arr: Array<Int64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextInt64()
    }
}

func randomizeUInt(arr: Array<UInt64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextUInt64()
    }
}

func randomizeFloat(arr: Array<Float64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextFloat64()
    }
}

func randomizeGaussianFloat(arr: Array<Float64>) {
    let r: Random = Random()
    for (i in 0..arr.size) {
        arr[i] = r.nextGaussianFloat64()
    }
}

func timeBenchmarkRandomInt() {
    var arr = Array<Int64>(100000, repeat: 0)
    var start = DateTime.now()
    for (i in 0..100) {
        randomizeInt(arr)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds() / (100 * 100000))
}

func timeBenchmarkRandomUInt() {
    var arr = Array<UInt64>(100000, repeat: 0)
    var start = DateTime.now()
    for (i in 0..100) {
        randomizeUInt(arr)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds() / (100 * 100000))
}

func timeBenchmarkRandomFloat() {
    var arr = Array<Float64>(100000, repeat: 0.0)
    var start = DateTime.now()
    for (i in 0..100) {
        randomizeFloat(arr)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds() / (100 * 100000))
}

func timeBenchmarkRandomGaussianFloat() {
    var arr = Array<Float64>(100000, repeat: 0.0)
    var start = DateTime.now()
    for (i in 0..100) {
        randomizeGaussianFloat(arr)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds() / (100 * 100000))
}


class Benchmark {
    func runIterationTime() {
        println("random-nextInt: ms = ${timeBenchmarkRandomInt() / 1000000.0}")
        println("random-nextUint: ms = ${timeBenchmarkRandomUInt() / 1000000.0}")
        println("random-nextFloat: ms = ${timeBenchmarkRandomFloat() / 1000000.0}")
        println("random-nextGaussianFloat: ms = ${timeBenchmarkRandomGaussianFloat() / 1000000.0}")
    }
}

main() {
    Benchmark().runIterationTime()
}
