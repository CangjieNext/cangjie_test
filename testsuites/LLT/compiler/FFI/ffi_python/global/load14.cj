// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test try catch `PythonException`.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PythonException: "/usr/lib/" cannot be loaded.

internal import ffi_python.*

main(): Int64 {
    try {
        Python.load("/usr/lib/", loglevel: LogLevel.INFO)
        print("${Python.getVersion()}\n")
        Python.unload()
    } catch(e: PythonException) {
        print("${e}")
    }
    return 0
}