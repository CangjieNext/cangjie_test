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
// ASSERT: scan trace
// ASSERT: scan debug
// ASSERT: scan info
// ASSERT: scan warn
// ASSERT: scan-not all

import std.ffi.python.*
import std.log.*

var x = Python.load()

main(): Int64 {
    PYLOG.level = TRACE
    if (PYLOG.level.level() != 6) {
        return 1
    }
    PYLOG.log(TRACE, "trace")
    PYLOG.log(DEBUG, "debug")
    PYLOG.log(INFO, "info")
    PYLOG.log(WARN, "warn")
    PYLOG.log(ALL, "all")
    Python.unload()
    return 0
}
