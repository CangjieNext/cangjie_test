/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// EXEC-PIPE: %export cjProcessorNum=1 && %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

import std.ffi.python.*

main(): Int64 {
    var res = 1
    for (i in 1..100) {
        Python.load()
        Python.unload()
    }
    if (Python.isLoad()) {
        res = -2
        return res
    } else {
        res = 0
    }
    println("success")
    return res
}
