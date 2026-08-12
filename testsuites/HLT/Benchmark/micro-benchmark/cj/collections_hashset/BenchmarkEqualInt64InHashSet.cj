/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: common_collection.cj
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f common_collection.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args
// TIMEOUT: 2400

import std.collection.*
import std.time.*
import std.convert.*
import stdx.crypto.crypto.*
import std.runtime.*

var counts: ArrayList<Int64> = ArrayList<Int64>([32, 256, 2 * 1024])
var _res = false

func GenerateArray(n: Int64): Array<Int64> {
    let m = SecureRandom()
    var _arr = ArrayList<Int64>()
    for (_ in 0..n) {
        let num = m.nextInt64()
        _arr.add(num)
    }

    return _arr.toArray()
}

func DifferentSize(num: Int64) {
    var total_time: Float64 = 0.0
    let N = 10000

    let arr = GenerateArray(num)
    let arr_2 = GenerateArray(num / 2)
    
    for (_ in 0..N){
        var _set_1 = HashSet<Int64>(arr)
        var _set_2 = HashSet<Int64>(arr_2)
        var start_time = MonoTime.now()

        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        
        var end_time = MonoTime.now()
        total_time += Float64((end_time - start_time).toNanoseconds())

        _set_2.clear()
        _set_1.clear()
        GC()
    }
    var perTime = total_time / Float64(N) / 10.0
    println("BenchmarkEqualInt64InHashSet_DiffSize_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

func AllEqual(num: Int64) {
    var total_time: Float64 = 0.0
    let N = 10000

    let arr = GenerateArray(num)
    
    for (_ in 0..N){
        var _set_1 = HashSet<Int64>(arr)
        var _set_2 = HashSet<Int64>(arr)
        var start_time = MonoTime.now()

        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        
        var end_time = MonoTime.now()
        total_time += Float64((end_time - start_time).toNanoseconds())

        _set_2.clear()
        _set_1.clear()
        GC()
    }
    var perTime = total_time / Float64(N) / 10.0
      println("BenchmarkEqualInt64InHashSet_AllEqual_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

func UnEqual(num: Int64) {
    var total_time: Float64 = 0.0
    let N = 10000

    let arr = GenerateArray(num)
    let arr_2 = GenerateArray(num)
    
    for (_ in 0..N){
        var _set_1 = HashSet<Int64>(arr)
        var _set_2 = HashSet<Int64>(arr_2)
        var start_time = MonoTime.now()

        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        
        var end_time = MonoTime.now()
        total_time += Float64((end_time - start_time).toNanoseconds())

        _set_2.clear()
        _set_1.clear()
        GC()
    }
    var perTime = total_time / Float64(N) / 10.0
    println("BenchmarkEqualInt64InHashSet_UnEqual_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

func PartEqual(num: Int64) {
    var total_time: Float64 = 0.0
    let N = 10000

    let arr = GenerateArray(2*num)
    let arr_1 = arr[(num / 2)..(num + num / 2)]
    let arr_2 = arr[num..(num * 2)]
    
    for (_ in 0..N){
        var _set_1 = HashSet<Int64>(arr_1)
        var _set_2 = HashSet<Int64>(arr_2)
        var start_time = MonoTime.now()

        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        _res = _set_1 == _set_2
        
        var end_time = MonoTime.now()
        total_time += Float64((end_time - start_time).toNanoseconds())

        _set_2.clear()
        _set_1.clear()
        GC()
    }
    var perTime = total_time / Float64(N) / 10.0
    println("BenchmarkEqualInt64InHashSet_PartEqual_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (count in counts) {
        PartEqual(count)
    }
 
    for (count in counts) {
        DifferentSize(count)
    }
 
    for (count in counts) {
        UnEqual(count)
    }

    for (count in counts) {
        AllEqual(count)
    }
    return 0
}