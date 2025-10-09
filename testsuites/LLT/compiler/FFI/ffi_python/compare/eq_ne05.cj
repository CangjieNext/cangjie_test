// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan The left PyObj to be compared is unavailable.
// ASSERT: scan The right PyObj to be compared is unavailable.

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    Python.load()
    //get a PyObj is not available
    var unavaileObj = PyLong(0) + PyString("")
    var a = Python.Eval("1")
    try { a == unavaileObj } catch (e: PythonException) {println(e)}
    try { unavaileObj == a } catch (e: PythonException) {println(e)}

    Python.unload()
    return 0
}