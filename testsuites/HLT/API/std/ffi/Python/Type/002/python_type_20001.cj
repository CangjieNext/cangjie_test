/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var i8 = [Int8.Min, Int8.Max]
    var i16 = [0i16, Int16.Min, Int16.Max]
    var i32 = [0i32, Int32.Min, Int32.Max]
    var i64 = [0i64, Int64.Min, Int64.Max]
    var u8 = [0u8, UInt8.Min, UInt8.Max]
    var u16 = [0u16, UInt16.Min, UInt16.Max]
    var u32 = [0u32, UInt32.Min, UInt32.Max]
    var u64 = [0u64, UInt64.Min, UInt64.Max]
    var f32 = [0.0f32, Float32.Min, Float32.Max]
    var f64 = [0.0f64, Float64.Min, Float64.Max]
    var b = [true, false]
    var c = ['a', '\u{00000001}']
    var s = ["a", """
    b""", #"
    c"#, "${1}"]
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() - j.toPyObj()
            println("${i} + ${j} = ${temp}")
        }
    }
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() - j.toPyObj()
            println("${i} - ${j} = ${temp}")
        }
    }
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() / j.toPyObj()
            println("${i} / ${j} = ${temp}")
        }
    }
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() * j.toPyObj()
            println("${i} * ${j} = ${temp}")
        }
    }
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() ** j.toPyObj()
            println("${i} ** ${j} = ${temp}")
        }
    }
    for (i in i8) {
        for (j in i8) {
            var temp = i.toPyObj() % j.toPyObj()
            println("${i} % ${j} = ${temp}")
        }
    }
    return 0
}
