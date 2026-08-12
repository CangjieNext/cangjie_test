/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*
import std.math.*
import std.overflow.*
import std.convert.*

var arr = Array<Bool>(100000, repeat: false)

func timeBenchmarkisInf() {
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = Float64.Inf.isInf()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkisNaN() {
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = Float64.NaN.isNaN()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkisNormal() {
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = Float64(0.1).isNormal()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

class Benchmark {
    func runIterationTime() {
        timeBenchmarkisInf() //warmup
        println("math-extension-inf: ms = ${(timeBenchmarkisInf() / 100000.0 / 1000000.0).format(".8")}")
        println("math-extension-nan: ms = ${(timeBenchmarkisNaN() / 100000.0 / 1000000.0).format(".8")}")
        println("math-extension-nomal: ms = ${(timeBenchmarkisNormal() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
