// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a update to PyFloat
// ASSERT: scan b update to PyBool
// ASSERT: scan c update to PyString
// ASSERT: scan d is PyLong
// ASSERT: scan WARN: Set value is unavailable, attribute "d" will be delete.
// ASSERT: scan Get attribute "d" failed.
// ASSERT: scan AttributeError: module 'test01' has no attribute 'd'
// ASSERT: scan Get attribute "d" failed.
// ASSERT: scan AttributeError: module 'test01' has no attribute 'd'
// ASSERT: scan Get attribute "d" failed.
// ASSERT: scan AttributeError: module 'test01' has no attribute 'd'
// ASSERT: scan Get attribute "d" failed.
// ASSERT: scan AttributeError: module 'test01' has no attribute 'd'
internal import ffi_python.*

main() {
    Python.load()
    var test01 = Python.Import("test01")
    test01["a"] = 11.1.toPyObj()
    if (test01["a"] is PyFloat) {
        print("a update to PyFloat\n")
    }

    test01["b"] = true.toPyObj()
    if (test01["b"] is PyBool) {
        print("b update to PyBool\n")
    }

    test01["c"] = "false".toPyObj()
    if (test01["c"] is PyString) {
        print("c update to PyString\n")
    }

    test01["d"] = 16.toPyObj()
    if (test01["d"] is PyLong) {
        print("d is PyLong\n")
    }

    //get a PyObj is not available
    test01["d"] = PyLong(0) + PyString("")
    try { !test01["d"].isAvailable()} catch (e: PythonException) {println(e)}
    try {test01["d"]["__add__"]} catch(e: PythonException) {println(e)}
    try {println(test01["d"])} catch(e: PythonException) {println(e)}
    try {test01["d"]()} catch(e: PythonException) {println(e)}

    Python.unload()
}
