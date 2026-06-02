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
// ASSERT: scan ValueError: Empty module name

import std.ffi.python.*
import std.log.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var a = Python.Import("")
    if (a.isAvailable()) {
        return 1
    }
    Python.unload()
    return 0
}
