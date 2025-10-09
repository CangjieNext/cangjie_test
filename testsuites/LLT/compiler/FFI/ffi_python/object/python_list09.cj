// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan size: 1
// ASSERT: scan 10 
// ASSERT: scan size: 2
// ASSERT: scan 10 [11, 12] 
// ASSERT: scan size: 1
// ASSERT: scan 10 
// ASSERT: scan size: 2
// ASSERT: scan 10 [11, 12]

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

    var pylist = PyList<CjObj>([])
    pylist.append(10)
    printPyList(pylist)

    pylist.append([11, 12])
    printPyList(pylist)


    var pylist2 = PyList<PyObj>([])
    pylist2.append(10.toPyObj())
    printPyList(pylist2)

    pylist2.append(PyList([11, 12]))
    printPyList(pylist2)

    Python.unload()
}