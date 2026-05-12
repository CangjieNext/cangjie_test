/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE-1: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan WARN: List elem at 2 is null.
// ASSERT: scan ERROR: Invailable value.

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var res = PyList([1])
    var i = res[2]
    var test = PyList([1.toPyObj(), true.toPyObj()])
    test.insert(0, i)
    return 0
}
