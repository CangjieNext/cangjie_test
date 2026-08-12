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
import std.math.numeric.*
import std.overflow.*
import std.convert.*

func timeBenchmarkBigIntInit() {
    var start = DateTime.now()
    for (i in 0..10000) {
        var int1: BigInt = BigInt("12345678987654321")
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntAdd() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int1 + int2
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntSub() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int2 - int1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntMul() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int1 * int2
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntDiv() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int2 / int1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntMod() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int2 % int1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntCompare() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    let int2: BigInt = BigInt("987654321")
    for (i in 0..10000) {
        var int3 = int2.compare(int1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntToString() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    for (i in 0..10000) {
        var int2 = int1.toString(10)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkBigIntToInt64() {
    var start = DateTime.now()
    let int1: BigInt = BigInt("123456789")
    for (i in 0..10000) {
        var int2 = int1.toInt64()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


class Benchmark {
    func runIterationTime() {
        timeBenchmarkBigIntInit() // warmup
        println("math-bigint-init: ms = ${(timeBenchmarkBigIntInit() / 10000.0 / 1000000.0)}")
        println("math-bigint-add: ms = ${(timeBenchmarkBigIntAdd() / 10000.0 / 1000000.0)}")
        println("math-bigint-sub: ms = ${(timeBenchmarkBigIntSub() / 10000.0 / 1000000.0)}")
        println("math-bigint-mul: ms = ${(timeBenchmarkBigIntMul() / 10000.0 / 1000000.0)}")
        println("math-bigint-div: ms = ${(timeBenchmarkBigIntDiv() / 10000.0 / 1000000.0)}")
        println("math-bigint-mod: ms = ${(timeBenchmarkBigIntMod() / 10000.0 / 1000000.0)}")
        println("math-bigint-compare: ms = ${(timeBenchmarkBigIntCompare() / 10000.0 / 1000000.0)}")
        println("math-bigint-toString: ms = ${(timeBenchmarkBigIntToString() / 10000.0 / 1000000.0)}")
        println("math-bigint-toInt: ms = ${(timeBenchmarkBigIntToInt64() / 10000.0 / 1000000.0)}")
    }
}

main() {
    Benchmark().runIterationTime()
}
