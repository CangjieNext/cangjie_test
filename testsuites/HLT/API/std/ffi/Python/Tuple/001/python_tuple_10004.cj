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
// ASSERT: scan start is 1
// ASSERT: scan end is 1

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var i = 1.toPyObj()
    var a = PyTuple(Array<PyObj>(100, item: i))
    if (a.size() != 100) {
        return 1
    }
    println("start is ${a[0]}")
    println("end is ${a[99]}")
    Python.unload()
    return 0
}
