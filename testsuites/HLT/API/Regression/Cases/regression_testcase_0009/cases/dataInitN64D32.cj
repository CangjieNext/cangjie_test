/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*
import std.convert.*

func dataInitN64D32(num: Int64, depth: Int64): A1N64D32 {
    var dataObjectN64D32: A1N64D32 = A1N64D32(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
        49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
    return dataObjectN64D32
}

func benchmarkDeserializableN64D32(datamodel: DataModel) {
    for (i in 0..reps) {
        A1N64D32.deserialize(datamodel)
    }
}

func benchmarkSerializableN64D32(origin: A1N64D32) {
    for (i in 0..reps) {
        origin.serialize()
    }
}

func timeBenchmarkSerializableN64D32(origin: A1N64D32, num: Int64, depth: Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN64D32(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkSerializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func timeBenchmarkDeserializableN64D32(origin: A1N64D32, num: Int64, depth: Int64) {
    var datamodelStr = origin.serialize().toJson().toString()
    var jsonStr = JsonValue.fromStr(datamodelStr)
    var datamodel = DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN64D32(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkDeserializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func mainSerializableN64D32(): Unit {
    var objectA1N64D32 = dataInitN64D32(64, 32)
    timeBenchmarkSerializableN64D32(objectA1N64D32, 64, 32)
}

func mainDeserializableN64D32(): Unit {
    var objectA1N64D32 = dataInitN64D32(64, 32)
    timeBenchmarkDeserializableN64D32(objectA1N64D32, 64, 32)
}
