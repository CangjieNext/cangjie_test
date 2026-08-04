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

func timeBenchmarkDecimalInit() {
    var start = DateTime.now()
    for (i in 0..10000) {
        var dcm1: Decimal = Decimal("123456789.87654321")
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalAdd() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    let dcm2: Decimal = Decimal("98765.4321")
    for (i in 0..10000) {
        var dem3 = dcm1 + dcm2
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalSub() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    let dcm2: Decimal = Decimal("98765.4321")
    for (i in 0..10000) {
        var dem3 = dcm2 - dcm1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalMul() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    let dcm2: Decimal = Decimal("98765.4321")
    for (i in 0..10000) {
        var dem3 = dcm2 * dcm1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalDiv() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    let dcm2: Decimal = Decimal("98765.4321")
    for (i in 0..10000) {
        var dem3 = dcm2 / dcm1
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalNeg() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    for (i in 0..10000) {
        var dem2 = dcm1.neg()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalCompare() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    let dcm2: Decimal = Decimal("98765.4321")
    for (i in 0..10000) {
        var dcm3 = dcm2.compare(dcm1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalToString() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    for (i in 0..10000) {
        var dcm2 = dcm1.toString()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkDecimalToInt64() {
    var start = DateTime.now()
    let dcm1: Decimal = Decimal("12345.6789")
    for (i in 0..10000) {
        var dcm2 = dcm1.toInt64()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


class Benchmark {
    func runIterationTime() {
        timeBenchmarkDecimalInit() // warmup
        println("math-decimal-init: ms = ${(timeBenchmarkDecimalInit() / 10000.0 / 1000000.0)}")
        println("math-decimal-add: ms = ${(timeBenchmarkDecimalAdd() / 10000.0 / 1000000.0)}")
        println("math-decimal-sub: ms = ${(timeBenchmarkDecimalSub() / 10000.0 / 1000000.0)}")
        println("math-decimal-mul: ms = ${(timeBenchmarkDecimalMul() / 10000.0 / 1000000.0)}")
        println("math-decimal-div: ms = ${(timeBenchmarkDecimalDiv() / 10000.0 / 1000000.0)}")
        println("math-decimal-neg: ms = ${(timeBenchmarkDecimalNeg() / 10000.0 / 1000000.0)}")
        println("math-decimal-compare: ms = ${(timeBenchmarkDecimalCompare() / 10000.0 / 1000000.0)}")
        println("math-decimal-toString: ms = ${(timeBenchmarkDecimalToString() / 10000.0 / 1000000.0)}")
        println("math-decimal-toInt: ms = ${(timeBenchmarkDecimalToInt64() / 10000.0 / 1000000.0)}")
    }
}

main() {
    Benchmark().runIterationTime()
}
