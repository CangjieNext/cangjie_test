// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan success01
// ASSERT: scan success02
// ASSERT: scan success03
// ASSERT: scan success04
// ASSERT: scan success05
// ASSERT: scan success06
// ASSERT: scan success07
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var c1 = PyBool(true)
    if (c1.toCjObj()) {
        print("success01\n")
    }

    var c2 = PyBool(false)
    if (!c2.toCjObj()) {
        print("success02\n")
    }

    var c3 = match (Python.Eval("True")) {
        case val: PyBool => val
        case _ => throw Exception()
    }
    if (c3.toCjObj()) {
        print("success03\n")
    }

    var c4 = match (Python.Eval("False")) {
        case val: PyBool => val
        case _ => throw Exception()
    }
    if (!c4.toCjObj()) {
        print("success04\n")
    }

    var c5 = true.toPyObj()
    if (c5.toCjObj()) {
        print("success05\n")
    }

    if (c1.toString() == "True") {
        print("success06\n")
    }

    if (c2.toString() == "False") {
        print("success07\n")
    }

    Python.unload()
    return 0
}
