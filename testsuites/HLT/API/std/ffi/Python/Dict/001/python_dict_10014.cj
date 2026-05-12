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
// ASSERT: scan (1, 2, 3)
// ASSERT: scan 1
// ASSERT: scan 0.1
// ASSERT: scan abc
// ASSERT: scan False

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var i = PyTuple([1.toPyObj(), 2.toPyObj(), 3.toPyObj()])
    var pyi = 1.toPyObj()
    var pyf = 0.1.toPyObj()
    var pys = "abc".toPyObj()
    var pyb = false.toPyObj()

    var res = PyDict(
        HashMap<PyObj, PyObj>(
            [
                (pyb, pyb),
                (i, i),
                (pyf, pyf),
                (pys, pys),
                (pyi, pyi)
            ]
        )
    )
    if (res.size() != 5) {
        throw Exception()
    }

    println(res.getItem(i))
    println(res.getItem(pyi))
    println(res.getItem(pyf))
    println(res.getItem(pys))
    println(res.getItem(pyb))

    return 0
}
