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

var arrTmp = Array<Option<Int64>>(100000, repeat: Some(0))

func timeBenchmarkCheckedAdd() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedAdd(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkCheckedSub() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedSub(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedMul() {
    var arr = Array<Int64>(100000, {i => i + 1})
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedMul(I64_MAX)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}


func timeBenchmarkCheckedDiv() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedDiv(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedMod() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedMod(-1)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedInc() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedInc()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedDec() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedDec()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedNeg() {
    var arr = Array<Int64>(100000, repeat: I64_MIN)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedNeg()
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedPow() {
    var arr = Array<Int64>(100000, repeat: I64_MAX)
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = arr[i].checkedPow(UInt64(2))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

class Benchmark {
    func runIterationTime() {
        timeBenchmarkCheckedAdd() // warmup
        println("overflow-checked-add: ms = ${(timeBenchmarkCheckedAdd() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-sub: ms = ${(timeBenchmarkCheckedSub() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-mul: ms = ${(timeBenchmarkCheckedMul() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-div: ms = ${(timeBenchmarkCheckedDiv() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-mod: ms = ${(timeBenchmarkCheckedMod() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-inc: ms = ${(timeBenchmarkCheckedInc() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-dec: ms = ${(timeBenchmarkCheckedDec() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-neg: ms = ${(timeBenchmarkCheckedNeg() / 100000.0 / 1000000.0).format(".8")}")
        println("overflow-checked-pow: ms = ${(timeBenchmarkCheckedPow() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
