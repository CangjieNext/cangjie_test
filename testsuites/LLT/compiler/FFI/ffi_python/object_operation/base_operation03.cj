// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -99
// ASSERT: scan -9.1
// ASSERT: scan WARN: Unsupported operation between PyBool and PyString, or operation is forbiden.
// ASSERT: scan 99
// ASSERT: scan 89.9
// ASSERT: scan WARN: Unsupported operation between PyLong and PyString, or operation is forbiden.
// ASSERT: scan 9.1
// ASSERT: scan -89.9
// ASSERT: scan WARN: Unsupported operation between PyFloat and PyString, or operation is forbiden.
// ASSERT: scan WARN: Unsupported operation between PyString and PyBool, or operation is forbiden.
// ASSERT: scan WARN: Unsupported operation between PyString and PyLong, or operation is forbiden.
// ASSERT: scan WARN: Unsupported operation between PyString and PyFloat, or operation is forbiden.


internal import ffi_python.*
 
main(): Int64 {
    Python.load()
    var a = PyBool(true)
    var b = PyLong(100)
    var c = PyFloat(10.1)
    var d = PyString("test")

    // -
    try { print("${a - b}\n") } catch(e: PythonException) {}
    try { print("${a - c}\n") } catch(e: PythonException) {}
    try { print("${a - d}\n") } catch(e: PythonException) {}
    try { print("${b - a}\n") } catch(e: PythonException) {}
    try { print("${b - c}\n") } catch(e: PythonException) {}
    try { print("${b - d}\n") } catch(e: PythonException) {}
    try { print("${c - a}\n") } catch(e: PythonException) {}
    try { print("${c - b}\n") } catch(e: PythonException) {}
    try { print("${c - d}\n") } catch(e: PythonException) {}
    try { print("${d - a}\n") } catch(e: PythonException) {}
    try { print("${d - b}\n") } catch(e: PythonException) {}
    try { print("${d - c}\n") } catch(e: PythonException) {}

    Python.unload()
    return 0
}