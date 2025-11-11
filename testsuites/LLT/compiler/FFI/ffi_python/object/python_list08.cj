// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan true
// ASSERT: scan size: 0
// ASSERT: scan size: 1
// ASSERT: scan 1 
// ASSERT: scan size: 2
// ASSERT: scan 1 2 
// ASSERT: scan size: 3
// ASSERT: scan 3 1 2 
// ASSERT: scan size: 1
// ASSERT: scan 30

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

    var pylist = PyList<Int64>([])
    var cjlist = pylist.toCjObj()
    println(cjlist.size == pylist.size())
    printPyList(pylist)
    pylist.insert(0, 1)
    printPyList(pylist)
    pylist.insert(10, 2)
    printPyList(pylist)
    pylist.insert(-2, 3)
    printPyList(pylist)

    var pylist2 = PyList<PyObj>([])

    pylist2.insert(0, Python.Eval("30"))
    printPyList<PyObj>(pylist2)

    Python.unload()
}