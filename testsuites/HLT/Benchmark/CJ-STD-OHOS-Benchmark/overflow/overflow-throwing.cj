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


let I64_MAX = 9223372036854775807
let I64_MIN = -9223372036854775808

var arrTmp = Array<Int64>(100000, repeat: 0)


func timeBenchmarkThrowingAdd() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingAdd(i)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkThrowingSub() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingSub(i)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingMul() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingMul(i)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkThrowingDiv() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingDiv(i + 1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingMod() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingMod(2)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingInc() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingInc()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingDec() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingDec()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingNeg() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingNeg()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkThrowingPow() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].throwingPow(UInt64(1))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

class Benchmark {
    func runIterationTime() {
        timeBenchmarkThrowingAdd() // warmup
        println("overflow-throwing-add: ms = ${(timeBenchmarkThrowingAdd() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-sub: ms = ${(timeBenchmarkThrowingSub() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-mul: ms = ${(timeBenchmarkThrowingMul() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-div: ms = ${(timeBenchmarkThrowingDiv() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-mod: ms = ${(timeBenchmarkThrowingMod() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-inc: ms = ${(timeBenchmarkThrowingInc() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-dec: ms = ${(timeBenchmarkThrowingDec() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-neg: ms = ${(timeBenchmarkThrowingNeg() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-throwing-pow: ms = ${(timeBenchmarkThrowingPow() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
