// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan b size: 1
// ASSERT: scan True 
// ASSERT: scan c size: 0
// ASSERT: scan d size: 0
// ASSERT: scan e size: 0

internal import ffi_python.*

func printTuple(tup: PyTuple): Unit {
    print("size: ${tup.size()}\n")
    for (i in 0..tup.size()) {
        print("${tup[i]} ")
    }
    print("\n")
}

main() {
    Python.load()

    var a = PyTuple(["cangjie".toPyObj(), true.toPyObj(), 10.toPyObj(), 10.5.toPyObj()])

    var b = a.slice(1, 2)
    print("b ")
    printTuple(b)

    var c = a.slice(2, 1)
    print("c ")
    printTuple(c)

    var d = a.slice(-3, -1)
    print("d ")
    printTuple(d)

    var e = a.slice(2, 2)
    print("e ")
    printTuple(e)
    
    Python.unload()
}