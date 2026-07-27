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


func timeBenchmarkWrappingAdd() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingAdd(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkWrappingSub() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingSub(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingMul() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingMul(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkWrappingDiv() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingDiv(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingMod() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingMod(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingInc() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingInc()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingDec() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingDec()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingNeg() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingNeg()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkWrappingPow() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].wrappingPow(UInt64(2))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


class Benchmark {
    func runIterationTime() {
        /* Warmup */
        timeBenchmarkWrappingAdd()
        println("overflow-wrapping-add: ms = ${(timeBenchmarkWrappingAdd() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-sub: ms = ${(timeBenchmarkWrappingSub() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-mul: ms = ${(timeBenchmarkWrappingMul() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-div: ms = ${(timeBenchmarkWrappingDiv() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-mod: ms = ${(timeBenchmarkWrappingMod() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-inc: ms = ${(timeBenchmarkWrappingInc() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-dec: ms = ${(timeBenchmarkWrappingDec() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-neg: ms = ${(timeBenchmarkWrappingNeg() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-wrapping-pow: ms = ${(timeBenchmarkWrappingPow() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
