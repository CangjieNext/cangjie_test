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
import std.collection.*

var x = Python.load()

main(): Int64 {
    var i = PyTuple([1.toPyObj(), 2.toPyObj(), 3.toPyObj()])
    var pyi = 1.toPyObj()
    var pyf = 0.1.toPyObj()
    var pys = "abc".toPyObj()
    var pyb = false.toPyObj()
    var res = PySet<PyObj>(HashSet<PyObj>([pyi, i, pyf, pys, pyb]))

    if (res.size() != 5) {
        throw Exception()
    }
    res.del(i)

    if (res.size() != 4) {
        throw Exception()
    }
    res.del(pyi)

    if (res.size() != 3) {
        throw Exception()
    }
    res.del(pyf)

    if (res.size() != 2) {
        throw Exception()
    }
    res.del(pys)

    if (res.size() != 1) {
        throw Exception()
    }
    res.del(pyb)
    if (res.size() != 0) {
        throw Exception()
    }
    Python.unload()
    return 0
}
