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

func dataInitN8D4(num: Int64, depth: Int64): A1N8D4 {
    var dataObjectN8D4: A1N8D4 = A1N8D4(0, 1, 2, 3, 4, 5, 6, 7)
    return dataObjectN8D4
}

func benchmarkDeserializableN8D4(datamodel: DataModel) {
    for (i in 0..reps) {
        A1N8D4.deserialize(datamodel)
    }
}

func benchmarkSerializableN8D4(origin: A1N8D4) {
    for (i in 0..reps) {
        origin.serialize()
    }
}

func timeBenchmarkSerializableN8D4(origin: A1N8D4, num: Int64, depth: Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN8D4(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkSerializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func timeBenchmarkDeserializableN8D4(origin: A1N8D4, num: Int64, depth: Int64) {
    var datamodelStr = origin.serialize().toJson().toString()
    var jsonStr = JsonValue.fromStr(datamodelStr)
    var datamodel = DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN8D4(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkDeserializable_${num}*${depth}: ${perTime.format(".2")} ns/op")
}

func mainSerializableN8D4(): Unit {
    var objectA1N8D4 = dataInitN8D4(8, 4)
    timeBenchmarkSerializableN8D4(objectA1N8D4, 8, 4)
}

func mainDeserializableN8D4(): Unit {
    var objectA1N8D4 = dataInitN8D4(8, 4)
    timeBenchmarkDeserializableN8D4(objectA1N8D4, 8, 4)
}
