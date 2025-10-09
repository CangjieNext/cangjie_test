// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success01
// ASSERT: scan success02

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    Python.load()
    var d = match (Python.Eval("{'name': 'xxx', 'likes': 123, 'url': 'xxx'}")) {
        case val: PyDict<PyObj, PyObj> => val
        case _ => throw PythonException()
    }

    var e = d.copy()
    if (!(e != d)) {
        print("success01\n")
    }

    if (e == d) {
        print("success02\n")
    }
    Python.unload()
    return 0
}
