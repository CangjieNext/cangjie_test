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
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan still run
// ASSERT: scan TypeError: foo() takes 0 positional arguments but 1 was given
import std.ffi.python.*
import std.log.*

var i = Python.load()

main(): Int64 {
    var test = Python.Import("test")
    test["foo"]([1])
    println("still run")
    return 0
}
