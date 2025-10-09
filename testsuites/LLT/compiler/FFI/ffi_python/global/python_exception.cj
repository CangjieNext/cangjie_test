// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catched PythonException
// ASSERT: scan catched Exception PythonException: test PythonException

internal import ffi_python.*

main(): Int64 {
    try {
        throw PythonException()
    } catch(e: PythonException) {
        println("catched ${e}")
    }
    try {
        throw PythonException("test PythonException")
    } catch(e: Exception) {
        println("catched Exception ${e}")
    }
    return 0
}