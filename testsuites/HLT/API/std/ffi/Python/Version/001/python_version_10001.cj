/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan WARN: [getVersion] Python is not initialized. Please load it first.
// ASSERT: scan 0.0.0

import std.ffi.python.*
import std.log.*

main(): Int64 {
    var a = Version(1, 2, 3)
    if (a.getMajor() != 1) {
        return 1
    }
    if (a.getMinor() != 2) {
        return 1
    }
    if (a.getMicro() != 3) {
        return 1
    }
    println("${Python.getVersion()}")
    return 0
}
