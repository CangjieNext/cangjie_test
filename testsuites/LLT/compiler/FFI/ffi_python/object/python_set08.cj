// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test del
// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan INFO: Found key 1 and del it success.
// ASSERT: scan WARN: Not find key 0 and do nothing.
// ASSERT: scan INFO: Found key PySet and del it success.
// ASSERT: scan WARN: Not find key pySet and do nothing.
// ASSERT: scan Get Invailable value.


internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load(loglevel: LogLevel.INFO)
    
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

    a.del(1)
    a.del(0)

    b.del("PySet".toPyObj())
    b.del("pySet".toPyObj())

    //get a PyObj is not available
    var unavaileObj = PyLong(0) + PyString("")
    try {b.del(unavaileObj)} catch(e: PythonException) {println(e)}

    Python.unload()
}