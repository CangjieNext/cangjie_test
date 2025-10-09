// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ZeroDivisionError: division by zero
// ASSERT: regex ZeroDivisionError: integer( division or)? modulo by zero

internal import ffi_python.*
 
main(): Int64 {
    Python.load()
    var a = PyLong(10)
    var b = PyLong(0)
    
    try { a/b }catch (e: PythonException) {println(e)}
    try { a%b }catch (e: PythonException) {println(e)}

    Python.unload()
    return 0
}