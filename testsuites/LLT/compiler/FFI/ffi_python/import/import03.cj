// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ModuleNotFoundError: No module named 'xxxx'
// ASSERT: scan PythonException: Obj is unavailable.

internal import ffi_python.*

main(): Int64 {
    Python.load()
    var x: Option<PyObj> = try {
        Python.Import("xxxx")
    } catch (e: PythonException) {
        println(e)
        Option<PyObj>.None
    }
    var xx = match (x) {
        case Some(v) => v
        //get a PyObj is not available
        case None => PyLong(0) + PyString("")
    }
    xx["yyyy"]
    Python.unload()
    return 0
}