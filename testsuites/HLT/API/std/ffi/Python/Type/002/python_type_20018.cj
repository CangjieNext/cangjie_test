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
// ASSERT: scan OverflowError: can't convert negative int to unsigned

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load()

main(): Int64 {
    var a = (-1).toPyObj()
    var b = a.toUInt64()
    println("test")
    Python.unload()
    return 0
}
