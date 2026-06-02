// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success01
// ASSERT: scan success02
// ASSERT: scan success03
// ASSERT: scan success04
// ASSERT: scan success05
// ASSERT: scan success06
// ASSERT: scan success07
// ASSERT: scan OverflowError: can't convert negative int to unsigned
// ASSERT: scan success08
// ASSERT: scan success09
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var c1 = PyLong(10)
    if (c1.toCjObj() == 10) {
        print("success01\n")
    }

    var c2 = PyLong(-10)
    if (c2.toCjObj() == -10) {
        print("success02\n")
    }

    var c3 = 10.toPyObj()
    if (c3.toCjObj() == 10) {
        print("success03\n")
    }

    var c4 = (-10).toPyObj()
    if (c4.toCjObj() == -10) {
        print("success04\n")
    }

    var c5 = match (Python.Eval("10")) {
        case val: PyLong => val
        case _ => throw Exception()
    }
    if (c5.toCjObj() == 10) {
        print("success05\n")
    }

    var c6 = match (Python.Eval("-10")) {
        case val: PyLong => val
        case _ => throw Exception()
    }
    if (c6.toCjObj() == -10) {
        print("success06\n")
    }

    if (c1.toUInt64() == 10) {
        print("success07\n")
    }

    try { c2.toUInt64() } catch (e: PythonException) { println(e) }

    if (c1.toString() == "10") {
        print("success08\n")
    }

    if (c2.toString() == "-10") {
        print("success09\n")
    }

    Python.unload()
    return 0
}
