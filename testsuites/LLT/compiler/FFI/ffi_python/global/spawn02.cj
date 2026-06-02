// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex true

internal import ffi_python.*

main(): Int64 {
    var x = Python.load()
    let fut = spawn {
        println(Python.isLoad())
        try {Python.Import("test")} catch(e: PythonException) {}
        try {println(Python.getVersion())} catch(e: PythonException) {}
        try {Python.Eval("123")} catch(e: PythonException) {}
        try {Python["print"];()} catch(e: PythonException) {}
    }

    fut.get()
    Python.unload()
    return 0
}