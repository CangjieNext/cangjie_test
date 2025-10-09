/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load()

main(): Int64 {
    var a = Float64.Max.toPyObj()
    var b = Float64.Max.toPyObj()

    var c = (a + b)
    var d = match (c) {
        case i: PyFloat =>
            println("${i.toCjObj()}");
            i.toCjObj()
        case _ => throw Exception()
    }
    println("${d is Float64}")
    println("${d == Float64.Inf}")
    println("still run")
    println("${Float64.Inf}")
    return 0
}

/* SCAN
inf
true
true
still run
inf
 */
