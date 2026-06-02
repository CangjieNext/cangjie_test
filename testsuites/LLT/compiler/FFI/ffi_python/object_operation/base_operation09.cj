// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan MyIntegral add
// ASSERT: scan WARN: Unsupported operation between external-type and PyLong, or operation is forbiden.
// ASSERT: scan WARN: Unsupported operation between PyLong and external-type, or operation is forbiden.

internal import ffi_python.*
 
main(): Int64 {
    Python.load()
    let test = Python.Import("test")
    let myint = test["MyIntegral"]()
    myint + myint
    myint + PyLong(1)
    PyLong(1) + myint
    return 0
}