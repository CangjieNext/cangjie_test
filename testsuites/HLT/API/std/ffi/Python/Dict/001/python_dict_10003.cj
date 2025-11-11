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
// ASSERT: scan-3 {}

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var j = [1, 2, 3].toPyObj()
    var k = PySet<Int64>(HashSet<Int64>([1, 2, 3]))
    var l = PyDict(HashMap<Int64, Int64>([(1, 1), (2, 2)]))
    println(PyDict(HashMap<PyObj, PyObj>([(j, j)])))
    println(PyDict(HashMap<PyObj, PyObj>([(k, k)])))
    println(PyDict(HashMap<PyObj, PyObj>([(l, l)])))

    return 0
}
