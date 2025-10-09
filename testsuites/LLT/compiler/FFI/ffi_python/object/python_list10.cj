// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan size: 5
// ASSERT: scan 1 2 3 4.5 False

internal import ffi_python.*

func printPyList<T>(list: PyList<T>): Unit where T <: PyFFIType {
    print("size: ${list.size()}\n")
    for(i in 0..list.size()) {
        print("${list[i]} ")
    }
    print("\n")
}

main() {
    Python.load()

    var test = Python.Import("test01")
    var pylist = test["pylist"]
    var list = match (pylist) {
        case val: PyList<PyObj> => printPyList<PyObj>(val); val
        case _ => throw PythonException()
    }

    match (list[0]) {
        case val: PyString => val
        case _ => throw PythonException()
    }

    match (list[1]) {
        case val: PyString => val
        case _ => throw PythonException()
    }

    match (list[2]) {
        case val: PyLong => val
        case _ => throw PythonException()
    }

    match (list[3]) {
        case val: PyFloat => val
        case _ => throw PythonException()
    }

    match (list[4]) {
        case val: PyBool => val
        case _ => throw PythonException()
    }

    Python.unload()
}