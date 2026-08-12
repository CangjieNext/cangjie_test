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


func timeBenchmarkSaturatingAdd() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingAdd(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkSaturatingSub() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingSub(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingMul() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingMul(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkSaturatingDiv() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingDiv(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingMod() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingMod(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingInc() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingInc()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingDec() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingDec()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingNeg() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingNeg()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSaturatingPow() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].saturatingPow(UInt64(2))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


class Benchmark {
    func runIterationTime() {
        timeBenchmarkSaturatingAdd() // warmup
        println("overflow-saturating-add: ms = ${(timeBenchmarkSaturatingAdd() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-sub: ms = ${(timeBenchmarkSaturatingSub() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-mul: ms = ${(timeBenchmarkSaturatingMul() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-div: ms = ${(timeBenchmarkSaturatingDiv() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-mod: ms = ${(timeBenchmarkSaturatingMod() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-inc: ms = ${(timeBenchmarkSaturatingInc() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-dec: ms = ${(timeBenchmarkSaturatingDec() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-neg: ms = ${(timeBenchmarkSaturatingNeg() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-saturating-pow: ms = ${(timeBenchmarkSaturatingPow() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
