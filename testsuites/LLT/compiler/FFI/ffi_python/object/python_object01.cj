// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test01.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a is PyLong
// ASSERT: scan a update to 11
// ASSERT: scan b is PyFloat
// ASSERT: scan b update to 21.2
// ASSERT: scan c is PyBool
// ASSERT: scan c update to False
// ASSERT: scan d is PyString
// ASSERT: scan d update to cangjie string
// ASSERT: scan AttributeError: module 'test01' has no attribute 'e'
internal import ffi_python.*

main() {
    Python.load()
    var test01 = Python.Import("test01")
    if (test01["a"] is PyLong) {
        print("a is PyLong\n")
    }

    test01["a"] = 11.toPyObj()
    print("a update to ${test01["a"]}\n")

    if (test01["b"] is PyFloat) {
        print("b is PyFloat\n")
    }

    test01["b"] = 21.2.toPyObj()
    print("b update to ${test01["b"]}\n")

    if (test01["c"] is PyBool) {
        print("c is PyBool\n")
    }

    test01["c"] = false.toPyObj()
    print("c update to ${test01["c"]}\n")

    if (test01["d"] is PyString) {
        print("d is PyString\n")
    }
    test01["d"] = "cangjie string".toPyObj()
    print("d update to ${test01["d"]}\n")

    test01["e"]

    Python.unload()
}
