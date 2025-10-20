/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f

import std.ffi.python.*
import std.log.*
import std.collection.*
import std.math.*

var x = Python.load()

main(): Int64 {
    var res = PyList([0, 1, 2, 3, 4, 5, 6, 7])

    println(res.slice(-1, 8))
    println(res.slice(5, 4))
    println(res.slice(10, 15))
    println(res.slice(-10, -5))
    println(res.slice(-20, 20))
    println(res.slice(30, 29))
    println(res.slice(Int64.Min, Int64.Max))
    return 0
}

/* SCAN
[0, 1, 2, 3, 4, 5, 6, 7]
[]
[]
[]
[0, 1, 2, 3, 4, 5, 6, 7]
[]
[0, 1, 2, 3, 4, 5, 6, 7]
 */
