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

func dataInitN8D2(num: Int64, depth: Int64): A1N8D2 {
    var dataObjectN8D2: A1N8D2 = A1N8D2(0, 1, 2, 3, 4, 5, 6, 7)
    return dataObjectN8D2
}

func benchmarkDeserializableN8D2(datamodel: DataModel) {
    for (i in 0..reps) {
        A1N8D2.deserialize(datamodel)
    }
}

func benchmarkSerializableN8D2(origin: A1N8D2) {
    for (i in 0..reps) {
        origin.serialize()
    }
}

func timeBenchmarkSerializableN8D2(origin: A1N8D2, num: Int64, depth: Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN8D2(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkSerializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func timeBenchmarkDeserializableN8D2(origin: A1N8D2, num: Int64, depth: Int64) {
    var datamodelStr = origin.serialize().toJson().toString()
    var jsonStr = JsonValue.fromStr(datamodelStr)
    var datamodel = DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN8D2(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkDeserializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func mainSerializableN8D2(): Unit {
    var objectA1N8D2 = dataInitN8D2(8, 2)
    timeBenchmarkSerializableN8D2(objectA1N8D2, 8, 2)
}

func mainDeserializableN8D2(): Unit {
    var objectA1N8D2 = dataInitN8D2(8, 2)
    timeBenchmarkDeserializableN8D2(objectA1N8D2, 8, 2)
}
