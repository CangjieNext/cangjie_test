// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cangjie True 10 10.5 
// ASSERT: scan 0 is PyString
// ASSERT: scan 1 is PyBool
// ASSERT: scan 2 is PyLong
// ASSERT: scan 3 is PyFloat

internal import ffi_python.*

func printTuple(tup: PyTuple): Unit {
    for (i in 0..tup.size()) {
        print("${tup[i]} ")
    }
    print("\n")
}

main() {
    Python.load()

    var b = Python.Eval("('cangjie', True, 10, 10.5)")
    var tup = match (b) {
        case val: PyTuple => printTuple(val); val
        case _ => throw PythonException()
    }

    match (tup[0]) {
        case val: PyString => print("0 is PyString\n")
        case _ => throw PythonException()
    }

    match (tup[1]) {
        case val: PyBool => print("1 is PyBool\n")
        case _ => throw PythonException()
    }

    match (tup[2]) {
        case val: PyLong => print("2 is PyLong\n")
        case _ => throw PythonException()
    }

    match (tup[3]) {
        case val: PyFloat => print("3 is PyFloat\n")
        case _ => throw PythonException()
    }
    
    Python.unload()
}