// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PythonException: Invailable value.

internal import ffi_python.*

main() {
    Python.load()
    var elem1 = Python.Eval("1")
    var elem2 = Python.Eval("2")
    //get a PyObj is not available
    var elem3 = PyLong(0) + PyString("")
    var a = [elem1, elem2, elem3]
    var pylist = PyList<PyObj>(a)

    Python.unload()
}