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
// ASSERT: scan Unsupported operation, try PyString __rsub__ PyString
// ASSERT: scan Unsupported operation, try PyString __rmul__ PyString
// ASSERT: scan Unsupported operation, try PyString __rtruediv__ PyString
// ASSERT: scan Unsupported operation, try PyString __rmod__ PyString
// ASSERT: scan Unsupported operation, try PyString __rpow__ PyString

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var a = 'a'.toPyObj()
    println("${a}")
    // a + a
    a - a
    a * a
    a / a
    a % a
    a ** a
    Python.unload()
    return 0
}
