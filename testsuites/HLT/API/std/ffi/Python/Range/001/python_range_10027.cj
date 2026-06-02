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
// ASSERT: scan [0, 1, 2, 3, 4]

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var a = PySlice(-10..-5)
    var b = PyList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    var x = b["__getitem__"]([a])
    var temp = match (x) {
        case i: PyList<PyObj> => i
        case _ => throw Exception()
    }
    print(temp)
    return 0
}
