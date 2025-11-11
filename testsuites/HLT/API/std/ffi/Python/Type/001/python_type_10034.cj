/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: test.py
// EXEC: %compiler %cmp_opt %link-python %f -o %output
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args

import std.ffi.python.*
import std.log.*

var i = Python.load()

main(): Int64 {
    var test = Python.Import("test")
    test["A"]["i"] = 0.toPyObj()
    var res = match (test["A"]["i"]) {
        case i: PyLong => i.toCjObj()
        case _ =>
            Python.unload();
            throw Exception()
    }
    Python.unload()
    return res
}
