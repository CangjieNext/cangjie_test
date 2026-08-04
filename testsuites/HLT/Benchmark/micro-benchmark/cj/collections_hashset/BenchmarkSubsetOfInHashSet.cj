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
var _set_1 = HashSet<Int64>()
var _set_2 = HashSet<Int64>()
var res = false

func GenerateArray(n: Int64): Array<Int64> {
    let m = SecureRandom()
    var _arr = ArrayList<Int64>()
    for (i in 0..n) {
        let num = m.nextInt64()
        _arr.add(num)
    }

    return _arr.toArray()
}

func Exist(num: Int64) {
    var totaltime = 0.0

    let arr = GenerateArray(num)
    let arr_2 = arr[0..num / 2]
    let N = 100000000 / num

    for (_ in 0..N) {
        _set_1 = HashSet<Int64>(arr)
        _set_2 = HashSet<Int64>(arr_2)
        var startTime = MonoTime.now()

        res = _set_2.subsetOf(_set_1)

        var endTime = MonoTime.now()
        totaltime += Float64((endTime - startTime).toNanoseconds()) 
        _set_1.clear()
        _set_2.clear()
        GC()
    }
    
    var perTime = totaltime / Float64(N)
    println("BenchmarkSubsetOfInHashset_Exist_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

func Nonexist(num: Int64) {
    var totaltime = 0.0
    let arr = GenerateArray(num)
    let arr_2 = GenerateArray(num / 2)

    let N = 100000000 / num;
    for (_ in 0..N) {
        _set_1 = HashSet<Int64>(arr)
        _set_2 = HashSet<Int64>(arr_2)
        var startTime = MonoTime.now()
    
        res = _set_2.subsetOf(_set_1)
    
        var endTime = MonoTime.now()
        totaltime += Float64((endTime - startTime).toNanoseconds())
        _set_1.clear()
        _set_2.clear()
        GC()
    }

    var perTime = totaltime / Float64(N)
    println("BenchmarkSubsetOfInHashset_Nonexist_${types[1]}_${num.toString()}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (count in counts) {
        Exist(count)
    }

    for (count in counts) {
        Nonexist(count)
    }

    return 0
}