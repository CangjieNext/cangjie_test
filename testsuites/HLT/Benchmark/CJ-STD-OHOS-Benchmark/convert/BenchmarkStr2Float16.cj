/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.io.*
import std.time.*
import std.convert.*
import std.collection.*

let reps = 100000
let nums = [4096, 512, 64, 8]

func setUp(num: Int64): ArrayList<String> {
    var floatArr = ArrayList<String>()
    for (i in 0..num) {
        let str = i.toString() + "." + i.toString()
        floatArr.add(str)
    }
    return floatArr
}

func benchmarkStr2Float16(floatArr: ArrayList<String>) {
    for (n in 0..reps) {
        for (i in floatArr) {
            Float16.parse(i)
        }
    }
}

func timeBenchmarkJsonArray2JsonStr(num: Int64) {
    var floatArr = setUp(num)

    var startTime = DateTime.now()
    benchmarkStr2Float16(floatArr)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkStr2Float16" + "N" + num.toString() + ": ms = " + (perTime / Float64(1000000)).toString())
}

main(): Int64 {
    for (num in nums) {
        timeBenchmarkJsonArray2JsonStr(num)
    }
    return 0
}
