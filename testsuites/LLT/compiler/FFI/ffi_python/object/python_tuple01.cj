// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a is cangjie True 10 10.5 
// ASSERT: scan b is cangjie True 10 10.5 
// ASSERT: scan WARN: Get item at -1 failed, return unavailable object.
// ASSERT: scan WARN: Get item at 4 failed, return unavailable object.

internal import ffi_python.*

func printTuple(tup: PyTuple): Unit {
    for (i in 0..tup.size()) {
        print("${tup[i]} ")
    }
    print("\n")
}

main() {
    Python.load()
    
    var a = PyTuple(["cangjie".toPyObj(), true.toPyObj(), 10.toPyObj(), 10.5.toPyObj()])
    print("a is ")
    printTuple(a)

    var b = match (Python.Eval("('cangjie', True, 10, 10.5)")) {
        case val: PyTuple => print("b is "); printTuple(val); val
        case _ => throw PythonException()
    }

    a[-1]
    a[4]

    Python.unload()
}