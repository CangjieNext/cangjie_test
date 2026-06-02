// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: importTest.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 10
// ASSERT: scan xxxx

internal import ffi_python.*

main(): Int64 {
    Python.load()
    var test = Python.Import("importTest")
    // value
    var a = test["a"]
    Python["print"]([a])
    // function
    test["func"]()
    Python.unload()
    return 0
}