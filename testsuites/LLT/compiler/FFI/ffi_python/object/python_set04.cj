// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test contains
// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a contains 1 true
// ASSERT: scan a contains 0 false
// ASSERT: scan b contains PySet true
// ASSERT: scan b contains python PySet true
// ASSERT: scan b contains python pySet false
// ASSERT: scan e contains Array true
// ASSERT: scan e contains array false

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    
    var a = PySet<Int64>(HashSet<Int64>([1, 2, 3]))

    var b = match (Python.Eval("{'PySet', 'HashSet', 1, 1.1, True}")) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }
   
    var test = Python.Import("test01")
    var e = match (test["pyset"]) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }

    print("a contains 1 ${a.contains(1)}\n")
    print("a contains 0 ${a.contains(0)}\n")

    print("b contains PySet ${b.contains("PySet".toPyObj())}\n")
    print("b contains python PySet ${b.contains(Python.Eval("'PySet'"))}\n")
    print("b contains python pySet ${b.contains(Python.Eval("'pySet'"))}\n")
    try { b.contains(Python.Eval("a = 1")) }catch(x: PythonException) {  }
    
    print("e contains Array ${e.contains("Array".toPyObj())}\n")
    print("e contains array ${e.contains("array".toPyObj())}\n")


    Python.unload()
}