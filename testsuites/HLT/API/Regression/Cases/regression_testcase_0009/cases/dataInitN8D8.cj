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

func dataInitN8D8(num: Int64, depth: Int64): A1N8D8 {
    var dataObjectN8D8: A1N8D8 = A1N8D8(0, 1, 2, 3, 4, 5, 6, 7)
    return dataObjectN8D8
}

func benchmarkDeserializableN8D8(datamodel: DataModel) {
    for (i in 0..reps) {
        A1N8D8.deserialize(datamodel)
    }
}

func benchmarkSerializableN8D8(origin: A1N8D8) {
    for (i in 0..reps) {
        origin.serialize()
    }
}

func timeBenchmarkSerializableN8D8(origin: A1N8D8, num: Int64, depth: Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN8D8(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkSerializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func timeBenchmarkDeserializableN8D8(origin: A1N8D8, num: Int64, depth: Int64) {
    var datamodelStr = origin.serialize().toJson().toString()
    var jsonStr = JsonValue.fromStr(datamodelStr)
    var datamodel = DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN8D8(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkDeserializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func mainSerializableN8D8(): Unit {
    var objectA1N8D8 = dataInitN8D8(8, 8)
    timeBenchmarkSerializableN8D8(objectA1N8D8, 8, 8)
}

func mainDeserializableN8D8(): Unit {
    var objectA1N8D8 = dataInitN8D8(8, 8)
    timeBenchmarkDeserializableN8D8(objectA1N8D8, 8, 8)
}
