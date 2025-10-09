// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: importTest.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan x = 3, y = 4

internal import ffi_python.*
/**
 * Test class.
 */
main(): Int64 {
    /* Initialize python environment */
    Python.load()
    var test = Python.Import("importTest")
    /* call class, pass two argument. */
    var point = test["Point"](0, 0)
    point["set"](3, 4)
    point["print"]()

    Python.unload()
    return 0
}