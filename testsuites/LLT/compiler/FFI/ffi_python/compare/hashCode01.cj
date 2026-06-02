// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan TypeError: unhashable type: 'dict'
// ASSERT: scan TypeError: unhashable type: 'set'
// ASSERT: scan-not TypeError: unhashable type: 'tuple'
// ASSERT: scan TypeError: unhashable type: 'list'

internal import ffi_python.*
internal import std.collection.*

var x = Python.load()

main(): Int64 {
    Python.load()

    var dict = match (Python.Eval("{'name': 'xxx', 'likes': 123, 'url': 'xxx'}")) {
        case val: PyDict<PyObj, PyObj> => val
        case _ => throw PythonException()
    }
    println(dict.hashCode())

    var set = match (Python.Eval("{'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}")) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }
    println(set.hashCode())

    var tuple = match (Python.Eval("('Google', 'Runoob', 1997, 2000)")) {
        case val: PyTuple => val
        case _ => throw PythonException()
    }
    println(tuple.hashCode())

    var list = match (Python.Eval("['Google', 'Runoob', 1997, 2000]")) {
        case val: PyList<PyObj> => val
        case _ => throw PythonException()
    }
    println(list.hashCode())

    Python.unload()    
    return 0
}