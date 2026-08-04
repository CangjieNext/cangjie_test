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
import std.collection.*

let reps = 100000
let nums = [4096, 512, 64, 8]

let formatParam = HashMap<String, String>()
let formatedType = ArrayList<String>(["Char", "Int8", "Int16", "Int32", "Int64",
                                      "UInt8", "UInt16", "UInt32", "UInt64",
                                      "Float16", "Float32", "Float64"])
let formatedIntValue = -1234567890123456
let formatedUIntValue = 1234567890123456
let formatedFloatValue = 1234567890.1234567899
let formatedCharValue = '仓'
var res = ""

func setUp(): Unit {
    formatParam.put("left", "-10")
    formatParam.put("right", "+10")
    formatParam.put("base", "#10")
    formatParam.put("zero", "010")
    formatParam.put("precision", "10.2")
    formatParam.put("b", "b")
    formatParam.put("o", "o")
    formatParam.put("x", "x")
    formatParam.put("e", "10.2e")
    formatParam.put("g", "10G")
}

func benchmarkOneCase<T>(paramName: String, paramValue: String, formatedType: String, formatedValue: T): Unit where T <: Formatter {
    let startTime = DateTime.now()

    for (_ in 0..reps) {
        res = formatedValue.format(paramValue)
    }

    let endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("Benchmark_${paramName}_${formatedType}: ms = " + (perTime / Float64(1000000)).toString())
}

@OverflowWrapping
func benchmarkFormat(): Unit {
    // Char
    benchmarkOneCase<Char>("left", formatParam["left"], "Char", formatedCharValue)
    // Int8
    benchmarkOneCase<Int8>("left", formatParam["left"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("right", formatParam["right"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("base", formatParam["base"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("zero", formatParam["zero"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("precision", formatParam["precision"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("b", formatParam["b"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("o", formatParam["o"], "Int8", Int8(formatedIntValue))
    benchmarkOneCase<Int8>("x", formatParam["x"], "Int8", Int8(formatedIntValue))
    // Int16
    benchmarkOneCase<Int16>("left", formatParam["left"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("right", formatParam["right"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("base", formatParam["base"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("zero", formatParam["zero"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("precision", formatParam["precision"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("b", formatParam["b"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("o", formatParam["o"], "Int16", Int16(formatedIntValue))
    benchmarkOneCase<Int16>("x", formatParam["x"], "Int16", Int16(formatedIntValue))
    // Int32
    benchmarkOneCase<Int32>("left", formatParam["left"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("right", formatParam["right"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("base", formatParam["base"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("zero", formatParam["zero"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("precision", formatParam["precision"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("b", formatParam["b"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("o", formatParam["o"], "Int32", Int32(formatedIntValue))
    benchmarkOneCase<Int32>("x", formatParam["x"], "Int32", Int32(formatedIntValue))
    // Int64
    benchmarkOneCase<Int64>("left", formatParam["left"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("right", formatParam["right"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("base", formatParam["base"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("zero", formatParam["zero"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("precision", formatParam["precision"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("b", formatParam["b"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("o", formatParam["o"], "Int64", Int64(formatedIntValue))
    benchmarkOneCase<Int64>("x", formatParam["x"], "Int64", Int64(formatedIntValue))
    // UInt8
    benchmarkOneCase<UInt8>("left", formatParam["left"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("right", formatParam["right"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("base", formatParam["base"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("zero", formatParam["zero"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("precision", formatParam["precision"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("b", formatParam["b"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("o", formatParam["o"], "UInt8", UInt8(formatedUIntValue))
    benchmarkOneCase<UInt8>("x", formatParam["x"], "UInt8", UInt8(formatedUIntValue))
    // UInt16
    benchmarkOneCase<UInt16>("left", formatParam["left"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("right", formatParam["right"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("base", formatParam["base"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("zero", formatParam["zero"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("precision", formatParam["precision"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("b", formatParam["b"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("o", formatParam["o"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("x", formatParam["x"], "UInt16", UInt16(formatedUIntValue))
    // UInt32
    benchmarkOneCase<UInt16>("left", formatParam["left"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("right", formatParam["right"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("base", formatParam["base"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("zero", formatParam["zero"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("precision", formatParam["precision"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("b", formatParam["b"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("o", formatParam["o"], "UInt16", UInt16(formatedUIntValue))
    benchmarkOneCase<UInt16>("x", formatParam["x"], "UInt16", UInt16(formatedUIntValue))
    // UInt64
    benchmarkOneCase<UInt64>("left", formatParam["left"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("right", formatParam["right"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("base", formatParam["base"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("zero", formatParam["zero"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("precision", formatParam["precision"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("b", formatParam["b"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("o", formatParam["o"], "UInt64", UInt64(formatedUIntValue))
    benchmarkOneCase<UInt64>("x", formatParam["x"], "UInt64", UInt64(formatedUIntValue))
    // Float16
    benchmarkOneCase<Float16>("left", formatParam["left"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("right", formatParam["right"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("base", formatParam["base"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("zero", formatParam["zero"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("precision", formatParam["precision"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("e", formatParam["e"], "Float16", Float16(formatedFloatValue))
    benchmarkOneCase<Float16>("g", formatParam["g"], "Float16", Float16(formatedFloatValue))
    // Float32
    benchmarkOneCase<Float32>("left", formatParam["left"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("right", formatParam["right"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("base", formatParam["base"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("zero", formatParam["zero"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("precision", formatParam["precision"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("e", formatParam["e"], "Float32", Float32(formatedFloatValue))
    benchmarkOneCase<Float32>("g", formatParam["g"], "Float32", Float32(formatedFloatValue))
    // Float64
    benchmarkOneCase<Float64>("left", formatParam["left"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("right", formatParam["right"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("base", formatParam["base"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("zero", formatParam["zero"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("precision", formatParam["precision"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("e", formatParam["e"], "Float64", Float64(formatedFloatValue))
    benchmarkOneCase<Float64>("g", formatParam["g"], "Float64", Float64(formatedFloatValue))
}

main(): Unit {
    setUp()
    benchmarkFormat()
}
