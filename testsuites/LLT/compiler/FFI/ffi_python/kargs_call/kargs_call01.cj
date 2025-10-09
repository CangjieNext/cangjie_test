// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan a is 2
// ASSERT: scan b is 1
// ASSERT: scan c is 2
// ASSERT: scan b is 1
// ASSERT: scan c is 2
// ASSERT: scan d is 1
// ASSERT: scan e is 2
// ASSERT: scan f is 3
// ASSERT: scan g is 4

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    Python.load()

    var test = Python.Import("test")
    test["function01"](HashMap<String, PyObj>([("a", 2.toPyObj())]))

    test["function02"]([1], HashMap<String, PyObj>([("c", 2.toPyObj())]))
    test["function02"]([Python.Eval("1")], HashMap<String, PyObj>([("c", 2.toPyObj())]))

    test["function03"]([1, 2], HashMap<String, PyObj>([("f", 3.toPyObj()), ("g", 4.toPyObj())]))

    0
}