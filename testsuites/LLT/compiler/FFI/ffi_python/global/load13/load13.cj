// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test unavailable so, dlopen sucess but dlsym failed.

// DEPENDENCE: testso.c
// EXEC: clang -fPIC -shared -o libtest.so testso.c
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PythonException: get Py_Initialize failed!

internal import ffi_python.*

main(): Int64 {
    Python.load("./libtest.so")
    
    Python.unload()
    return 0
}