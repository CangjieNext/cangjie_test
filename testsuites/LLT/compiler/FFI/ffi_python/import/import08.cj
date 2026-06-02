// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PythonException: Index 1 is unavailable.

internal import ffi_python.*

main(): Int64 {
    Python.load()
    var a = Python.Eval("123")
    //get a PyObj is not available
    var b = PyLong(0) + PyString("")
    var c = Python.Eval("123")
    var type_s = Python["type"]([a, b, c]) // call `type` by a null ptr.
    Python["print"]([type_s])
    Python.unload()
    return 0
}