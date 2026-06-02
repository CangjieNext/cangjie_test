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

func dataInitN128D32(num: Int64, depth: Int64): A1N128D32 {
    var dataObjectN128D32: A1N128D32 = A1N128D32(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
        20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
        48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75,
        76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102,
        103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124,
        125, 126, 127)
    return dataObjectN128D32
}

func benchmarkDeserializableN128D32(datamodel: DataModel) {
    for (i in 0..reps) {
        A1N128D32.deserialize(datamodel)
    }
}

func benchmarkSerializableN128D32(origin: A1N128D32) {
    for (i in 0..reps) {
        origin.serialize()
    }
}

func timeBenchmarkSerializableN128D32(origin: A1N128D32, num: Int64, depth: Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN128D32(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkSerializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func timeBenchmarkDeserializableN128D32(origin: A1N128D32, num: Int64, depth: Int64) {
    var datamodelStr = origin.serialize().toJson().toString()
    var jsonStr = JsonValue.fromStr(datamodelStr)
    var datamodel = DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN128D32(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkDeserializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func mainSerializableN128D32(): Unit {
    var objectA1N128D32 = dataInitN128D32(128, 32)
    timeBenchmarkSerializableN128D32(objectA1N128D32, 128, 32)
}

func mainDeserializableN128D32(): Unit {
    var objectA1N128D32 = dataInitN128D32(128, 32)
    timeBenchmarkDeserializableN128D32(objectA1N128D32, 128, 32)
}
