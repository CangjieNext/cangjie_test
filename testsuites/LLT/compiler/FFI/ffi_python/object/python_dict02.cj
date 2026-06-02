// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a is 1
// ASSERT: scan b is 2
// ASSERT: scan c is 3
// ASSERT: scan WARN: Dict key "d" not found!
// ASSERT: scan b is 10
// ASSERT: scan d is 20
// ASSERT: scan a exist: true
// ASSERT: scan d exist: true
// ASSERT: scan e exist: false
// ASSERT: scan b.a is 1
// ASSERT: scan b.b is 2
// ASSERT: scan b.c is 3
// ASSERT: scan WARN: Dict key "d" not found!
// ASSERT: scan KeyError: ('e',)
// ASSERT: scan WARN: An error happend in dict del key "e".
// ASSERT: scan a size is 2
// ASSERT: scan b size is 3

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var a = match (Python.Eval("{'a': 1, 'b': 2, 'c': 3}")) {
        case val: PyDict<PyObj, PyObj> => val
        case _ => throw PythonException()
    }

    var b = a.copy()

    // getItem
    print("a is ${a.getItem("a".toPyObj())}\n")
    print("b is ${a.getItem("b".toPyObj())}\n")
    print("c is ${a.getItem("c".toPyObj())}\n")
    a.getItem("d".toPyObj())

    // setItem
    a.setItem("b".toPyObj(), 10.toPyObj())
    print("b is ${a.getItem("b".toPyObj())}\n")
    a.setItem("d".toPyObj(), 20.toPyObj())
    print("d is ${a.getItem("d".toPyObj())}\n")

    // contains
    print("a exist: ${a.contains("a".toPyObj())}\n")
    print("d exist: ${a.contains("d".toPyObj())}\n")
    print("e exist: ${a.contains("e".toPyObj())}\n")

    // copy
    print("b.a is ${b.getItem("a".toPyObj())}\n")
    print("b.b is ${b.getItem("b".toPyObj())}\n")
    print("b.c is ${b.getItem("c".toPyObj())}\n")
    b.getItem("d".toPyObj())

    // del
    a.del("a".toPyObj())
    a.del("c".toPyObj())
    a.del("e".toPyObj())

    // size
    print("a size is ${a.size()}\n")
    print("b size is ${b.size()}\n")

    Python.unload()
}