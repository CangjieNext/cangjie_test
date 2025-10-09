// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan module 'sys'
// ASSERT: scan module 'os'

internal import ffi_python.*

/**
 * Test function, print the string with python print function.
 */
main(): Int64 {
    Python.load()
    /* Initialize python environment */
    var sys = Python.Import("sys")
    var os = Python.Import("os")
    var prt = Python["print"]
    var str = Python["str"]
    prt(str(sys))
    prt(str(os))
    /* unload python lib and clean environment */
    Python.unload()
    return 0
}