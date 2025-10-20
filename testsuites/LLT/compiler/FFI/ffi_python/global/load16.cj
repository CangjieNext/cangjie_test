// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PyBool PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyLong Signed PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyLong Unsigned PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyFloat PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyString PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyTuple PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyList PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PyDict PythonException: Python is not initialized. Please load it first.
// ASSERT: scan PySet PythonException: Python is not initialized. Please load it first.

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    try {
        print("PyBool ")
        var a = true.toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) { println(e) }

    try {
        print("PyLong Signed ")
        var a = 1.toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyLong Unsigned ")
        var a = UInt64(1).toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyFloat ")
        var a = 1.1.toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyString ")
        var a = "true".toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyTuple ")
        var a = PyTuple([])
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyList ")
        var a = [1, 2, 3].toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PyDict ")
        var a = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]).toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}

    try {
        print("PySet ")
        var a = HashSet<Int64>([1, 2, 3]).toPyObj()
        if (a.isAvailable()){return 1}
    } catch (e: PythonException) {println(e)}
    
    return 0
}