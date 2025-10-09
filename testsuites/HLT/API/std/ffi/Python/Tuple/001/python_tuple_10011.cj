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
    var a = PyTuple(Array<PyObj>(10) {
        i => i.toPyObj()
    })
    var x = a.slice(0, 10)
    println("${x}")
    x = a.slice(-1, 11)
    println("${x}")
    x = a.slice(1, 5)
    println("${x}")
    x = a.slice(4, 5)
    println("${x}")
    x = a.slice(7, 7)
    println("${x}")
    return 0
}
/* SCAN
(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
(1, 2, 3, 4)
(4,)
()
 */
