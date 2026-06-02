// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan List set elem at 3 failed.
// ASSERT: scan IndexError: list assignment index out of range
// ASSERT: scan Invailable value.
// ASSERT: scan 3

internal import ffi_python.*

main() {
    Python.load()
    var pylist = PyList<PyObj>([PyLong(1), PyLong(2), PyLong(3)])
    try { pylist[3] = 4.toPyObj() } catch (e: PythonException) { println(e) }
    //get a PyObj is not available
    var unavaileObj = PyLong(0) + PyString("")
    try {pylist[2] = unavaileObj }catch(e: PythonException){println(e)}
    println(pylist[2])
    Python.unload()
}