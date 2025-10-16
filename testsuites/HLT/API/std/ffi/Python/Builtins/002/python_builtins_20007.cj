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
// ASSERT: scan Libpython has loaded.

import std.ffi.python.*
import std.log.*

main(): Int64 {
    var res = 1
    Python.load(loglevel: INFO)
    Python.load()
    if (Python.isLoad()) {
        res = 0
    } else {
        res = -1
        return res
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
