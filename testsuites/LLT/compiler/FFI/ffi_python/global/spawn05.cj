// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-5 find type
// ASSERT: regex-5 cant find mytype

internal import ffi_python.*

main(): Int64 {
    Python.load()
    let futArr = Array<Future<Unit>>(5) { _ => 
        spawn { =>
            if (Python["type"].isAvailable()) {
                println("find type\n")
            }
            if (!Python["mytype"].isAvailable()) {
                println("cant find mytype\n")
            }
            println("Current thread id: ${Thread.currentThread.id}")
        }
    }
    for (i in 0..5) {
        futArr[i].get()
    }
    Python.unload()
    return 0
}