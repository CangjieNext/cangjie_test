// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test `isLoad()`.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan false
// ASSERT: scan true
// ASSERT: scan false

internal import ffi_python.*

main(): Int64 {
    print("${Python.isLoad()}\n")
    Python.load()
    print("${Python.isLoad()}\n")    
    Python.unload()
    print("${Python.isLoad()}\n")  
    return 0
}