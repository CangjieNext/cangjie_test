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

let reps = 10000000

func BenchmarkStr2Int8(str:String) {
    for (n in 0..reps) {
        Int8.parse(str)
    }
}

func BenchmarkStr2Int16(str:String) {
    for (n in 0..reps) {
        Int16.parse(str)
    }
}

func BenchmarkStr2Int32(str:String) {
    for (n in 0..reps) {
        Int32.parse(str)
    }
}

func BenchmarkStr2Int64(str:String) {
    for (n in 0..reps) {
        Int64.parse(str)
    }
}


func BenchmarkStr2UInt8(str:String) {
    for (n in 0..reps) {
        UInt8.parse(str)
    }
}

func BenchmarkStr2UInt16(str:String) {
    for (n in 0..reps) {
        UInt16.parse(str)
    }
}

func BenchmarkStr2UInt32(str:String) {
    for (n in 0..reps) {
        UInt32.parse(str)
    }
}

func BenchmarkStr2UInt64(str:String) {
    for (n in 0..reps) {
        UInt64.parse(str)
    }
}

func BenchmarkStr2Float16(str:String) {
    for (n in 0..reps) {
        Float16.parse(str)
    }
}
func BenchmarkStr2Float32(str:String) {
    for (n in 0..reps) {
        Float32.parse(str)
    }
}
func BenchmarkStr2Float64(str:String) {
    for (n in 0..reps) {
        Float64.parse(str)
    }
}

func BenchmarkStr2Bool(str:String) {
    for (n in 0..reps) {
        Bool.parse(str)
    }
}
func BenchmarkStr2Char(str:String) {
    for (n in 0..reps) {
          Char.parse(str)
    }
}

func timeBenchmarkBenchmarkStr2Int(funCase:HashMap<String,(str:String)->Unit>,caseStrs:HashMap<String,String>) {
    for ((k,v) in funCase){
        var params=caseStrs.get(k).getOrThrow()
        var startTime = DateTime.now()
        v(params)
        var endTime = DateTime.now()
        var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
        println(k + ": ms =" + (perTime / Float64(1000000)).toString())
    }
}

main(): Int64 {
    timeBenchmarkBenchmarkStr2Int(HashMap<String,(str:String)->Unit>([("BenchmarkStr2Int8",BenchmarkStr2Int8),
        ("BenchmarkStr2Int16",BenchmarkStr2Int16),
        ("BenchmarkStr2Int32",BenchmarkStr2Int32),
        ("BenchmarkStr2Int64",BenchmarkStr2Int64),
        ("BenchmarkStr2UInt8",BenchmarkStr2UInt8),
        ("BenchmarkStr2UInt16",BenchmarkStr2UInt16),
        ("BenchmarkStr2UInt32",BenchmarkStr2UInt32),
        ("BenchmarkStr2UInt64",BenchmarkStr2UInt64),
        ("BenchmarkStr2Float16",BenchmarkStr2Float16),
        ("BenchmarkStr2Float32",BenchmarkStr2Float32),
        ("BenchmarkStr2Float64",BenchmarkStr2Float64),
        ("BenchmarkStr2Bool_true",BenchmarkStr2Bool),
        ("BenchmarkStr2Bool_false",BenchmarkStr2Bool),
        ("BenchmarkStr2Char",BenchmarkStr2Char)]),HashMap<String,String>([("BenchmarkStr2Int8", "100"),
        ("BenchmarkStr2Int16","100"),
        ("BenchmarkStr2Int32","100"),
        ("BenchmarkStr2Int64","100"),
        ("BenchmarkStr2UInt8","100"),
        ("BenchmarkStr2UInt16","100"),
        ("BenchmarkStr2UInt32","100"),
        ("BenchmarkStr2UInt64","100"),
        ("BenchmarkStr2Float16","100.100"),
        ("BenchmarkStr2Float32","100.100"),
        ("BenchmarkStr2Float64","100.100"),
        ("BenchmarkStr2Bool_true","true"),
        ("BenchmarkStr2Bool_false","false"),
        ("BenchmarkStr2Char","'a'")]))
    return 0
}
