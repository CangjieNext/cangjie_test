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

var x = Python.load()

main(): Int64 {
    var res = PyList([0, 1, 2, 3, 4, 5, 6, 7])

    println(res)

    println(res.slice(0, 7))
    println(res.slice(2, 6))
    println(res.slice(4, 5))
    println(res.slice(5, 5))

    println(res)
    Python.unload()
    return 0
}

/* SCAN
[0, 1, 2, 3, 4, 5, 6, 7]
[0, 1, 2, 3, 4, 5, 6]
[2, 3, 4, 5]
[4]
[]
[0, 1, 2, 3, 4, 5, 6, 7]
 */
