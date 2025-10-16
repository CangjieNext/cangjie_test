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
// ASSERT: scan WARN: Get item at 9223372036854775807 failed, return unavailable object.

import std.ffi.python.*
import std.log.*
import std.collection.*
import std.math.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var a = PyTuple(Array<PyObj>(100) {i => (i * 2).toPyObj()})
    a[Int64.Max]
    Python.unload()
    return 0
}
