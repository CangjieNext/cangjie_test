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
// ASSERT: scan WARN: Set pop elem failed, return unavailable object.
// ASSERT: scan KeyError: 'pop from an empty set'

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
    var res = PySet<PyObj>(HashSet<PyObj>([i]))

    if (res.size() != 1) {
        throw Exception()
    }
    res.pop()

    if (res.size() != 0) {
        throw Exception()
    }

    res.pop()

    if (res.size() != 0) {
        throw Exception()
    }

    return 0
}
