// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// test toCjObj()
// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a size pass
// ASSERT: scan 1 2 3 
// ASSERT: scan b size pass
// ASSERT: scan c size pass
// ASSERT: scan 1 2 3 
// ASSERT: scan e size pass
// ASSERT: scan f size pass

internal import ffi_python.*
internal import std.collection.*

func testCjObj<T>(set: PySet<T>): Unit where T <: Hashable & Equatable<T> & PyFFIType {
    var setsize = set.size()
    var cjset = set.toCjObj()
    if (cjset.size == setsize) {
        print("size pass\n")
    }
    for (elem in cjset) {
        print("${elem} ")
    }
    print("\n")
}

main() {
    Python.load()
    
    var a = PySet<Int64>(HashSet<Int64>([1, 2, 3]))

    var b = match (Python.Eval("{'PySet', 'HashSet', 1, 1.1, True}")) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }

    var c = HashSet<Int64>([1, 2, 3]).toPyObj()
    
    var test = Python.Import("test01")
    var e = match (test["pyset"]) {
        case val: PySet<PyObj> => val
        case _ => throw PythonException()
    }

    var f = PySet<Int64>(HashSet<Int64>())

    print("a ")
    testCjObj(a)
    print("b ")
    testCjObj(b)
    print("c ")
    testCjObj(c)
    print("e ")
    testCjObj(e)
    print("f ")
    testCjObj(f)

    Python.unload()
}