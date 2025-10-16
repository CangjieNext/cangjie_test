// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test pop
// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success01
// ASSERT: scan success02

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    
    var a = PySet<Int64>(HashSet<Int64>([1, 2, 3]))

    var b = match (Python.Eval("{1, 2, 3, 4}")) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }

    var a1 = PySet<Int64>(HashSet<Int64>([2, 3, 1]))
    if (a.pop() == a1.pop()) {
        print("success01\n")
    }

    var b1 = match (Python.Eval("{3, 2, 4, 1}")) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }
    if (b.pop() == b1.pop()) {
        print("success02\n")
    }

    Python.unload()
}