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
    var pyi = 1.toPyObj()
    var pyf = 0.1.toPyObj()
    var pyb = false.toPyObj()
    var pys = 123.toPyObj()
    var res = PySet<PyObj>(HashSet<PyObj>([pyi, pyf, pys, pyb]))

    res["clear"]()
    if (res.size() != 0) {
        throw Exception()
    }
    Python.unload()
    return 0
}
