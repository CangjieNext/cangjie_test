// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PyBool PyLong PythonException: Python is not initialized. Please load it first.
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
        Python.load()
        var a = true.toPyObj()
        Python.unload()
        a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyLong ")
        Python.load()
        var a = 1.toPyObj()
        Python.unload()
        a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyFloat ")
        Python.load()
        var a = 1.1.toPyObj()
        Python.unload()
        var b = a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyString ")
        Python.load()
        var a = "true".toPyObj()
        Python.unload()
        var b = a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyTuple ")
        Python.load()
        var a = PyTuple([])
        Python.unload()
        var b = a.size()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyList ")
        Python.load()
        var a = [1, 2, 3].toPyObj()
        Python.unload()
        var b = a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PyDict ")
        Python.load()
        var a = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]).toPyObj()
        Python.unload()
        var b = a.toCjObj()
    } catch (e: PythonException) { println(e) }

    try {
        print("PySet ")
        Python.load()
        var a = HashSet<Int64>([1, 2, 3]).toPyObj()
        Python.unload()
        var b = a.toCjObj()
    } catch (e: PythonException) { println(e) }
    
    return 0
}