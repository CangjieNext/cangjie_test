// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1
// ASSERT: scan 1.0
// ASSERT: scan WARN: Unsupported operation between PyBool and PyString, or operation is forbiden.
// ASSERT: scan 0
// ASSERT: scan 9.1
// ASSERT: scan WARN: Unsupported operation between PyLong and PyString, or operation is forbiden.
// ASSERT: scan 0.1
// ASSERT: scan 10.1
// ASSERT: scan WARN: Unsupported operation between PyFloat and PyString, or operation is forbiden.
// ASSERT: scan TypeError: not all arguments converted during string formatting
// ASSERT: scan TypeError: not all arguments converted during string formatting
// ASSERT: scan TypeError: not all arguments converted during string formatting

internal import ffi_python.*
 
main(): Int64 {
    Python.load()
    var a = PyBool(true)
    var b = PyLong(100)
    var c = PyFloat(10.1)
    var d = PyString("test")

    // %
    try { print("${a % b}\n") } catch(e: PythonException) {println(e)}
    try { print("${a % c}\n") } catch(e: PythonException) {println(e)}
    try { print("${a % d}\n") } catch(e: PythonException) {println(e)}
    try { print("${b % a}\n") } catch(e: PythonException) {println(e)}
    try { print("${b % c}\n") } catch(e: PythonException) {println(e)}
    try { print("${b % d}\n") } catch(e: PythonException) {println(e)}
    try { print("${c % a}\n") } catch(e: PythonException) {println(e)}
    try { print("${c % b}\n") } catch(e: PythonException) {println(e)}
    try { print("${c % d}\n") } catch(e: PythonException) {println(e)}
    try { print("${d % a}\n") } catch(e: PythonException) {println(e)}
    try { print("${d % b}\n") } catch(e: PythonException) {println(e)}
    try { print("${d % c}\n") } catch(e: PythonException) {println(e)}

    Python.unload()
    return 0
}