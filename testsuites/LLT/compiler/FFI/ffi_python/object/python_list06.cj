// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan A class
// ASSERT: scan B class

internal import ffi_python.*

main() {
    Python.load()

    var test = Python.Import("test01")
    var a = test["A"]()
    var b = test["B"]()

    var pylist = PyList<PyObj>([a, b])

    println(pylist[0])
    println(pylist[1])
    
    Python.unload()
}