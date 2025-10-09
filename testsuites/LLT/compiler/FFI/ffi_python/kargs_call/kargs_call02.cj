// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan TypeError: function02() missing 1 required positional argument: 'b'
// ASSERT: scan Index 0 is unavailable.
// ASSERT: scan Get Invailable value.
// ASSERT: scan function02 call.
// ASSERT: scan TypeError: function02() got an unexpected keyword argument 'd'
// ASSERT: scan function02 call.
// ASSERT: scan TypeError: function02() got multiple values for argument 'b'

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    Python.load()

    var test = Python.Import("test")

    // Without b.
    try {
        test["function02"](HashMap<String, PyObj>([("c", 2.toPyObj())]))
    } catch (e: PythonException) {println(e)}

    // With unavailable b.
    try {
        //get a PyObj is not available
        var unavaileObj = PyLong(0) + PyString("")
        test["function02"]([unavaileObj], HashMap<String, PyObj>([("c", 2.toPyObj())]))
    } catch(e: PythonException) {println(e)}

    // With unavailable c.
    try {
        //get a PyObj is not available
        var unavaileObj = PyLong(0) + PyString("")
        test["function02"]([1], HashMap<String, PyObj>([("c", unavaileObj)]))
    } catch(e: PythonException) {println(e)}

    // Without c.
    test["function02"]([1])

    // With nonexistent d.
    try {
        test["function02"]([1], HashMap<String, PyObj>([("d", Python.Eval("1"))]))
    } catch(e: PythonException) {println(e)}

    // b and c are named argument.
    test["function02"](HashMap<String, PyObj>([("b", Python.Eval("1")), ("c", Python.Eval("2"))]))

    // b assigned twice.
    try {
        test["function02"]([0], HashMap<String, PyObj>([("b", Python.Eval("1")), ("c", Python.Eval("2"))]))
    } catch(e: PythonException) {println(e)}

    0
}