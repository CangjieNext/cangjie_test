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
// ASSERT: scan "bad_so" does not exist or the file path is invalid.

import std.ffi.python.*

main(): Int64 {
    try {
        Python.load("bad_so")
    } catch (e: PythonException) {}
    if (Python.isLoad()) {
        return 1
    } else {
        return 0
    }
}
