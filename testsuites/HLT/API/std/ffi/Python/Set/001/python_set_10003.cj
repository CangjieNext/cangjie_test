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
// ASSERT: scan-3 set()

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var j = [1, 2, 3].toPyObj()
    println(PySet<PyObj>(HashSet<PyObj>([j])))
    var k = PySet<Int64>(HashSet<Int64>([1, 2, 3]))
    println(PySet<PyObj>(HashSet<PyObj>([k])))
    var l = PyDict(HashMap<Int64, Int64>([(1, 1), (2, 2)]))
    println(PySet<PyObj>(HashSet<PyObj>([l])))

    Python.unload()
    return 0
}
