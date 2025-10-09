// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 9
// ASSERT: scan 3
// ASSERT: scan true
// ASSERT: scan 5
// ASSERT: scan 1, 2, 3, 4, 5, 6, 7,

internal import ffi_python.*

main() {
    Python.load()
    var a = [1, 2, 9, 4, 6]
    var pylist = PyList<Int64>(a)
    println(pylist[2])
    pylist[2] = 3
    println(pylist[2])

    var cjlist = pylist.toCjObj()
    match (cjlist[3]) {
        case val: PyLong => println(val.toCjObj() == 4)
        case _ => throw PythonException()
    }

    println(pylist.size())

    pylist.insert(4, 5)

    pylist.append(7)

    for(i in 0..pylist.size()) {
        print("${pylist[i]}, ")
    }
    print("\n")

    Python.unload()
}