/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan WARN: [unload] Python is not initialized. Please load it first.

import std.ffi.python.*

main(): Int64 {
    var res = 1
    Python.load()
    Python.unload()
    if (Python.isLoad()) {
        res = -2
        return res
    } else {
        res = 0
    }
    Python.unload()
    if (Python.isLoad()) {
        res = -2
        return res
    } else {
        res = 0
    }
    return res
}
