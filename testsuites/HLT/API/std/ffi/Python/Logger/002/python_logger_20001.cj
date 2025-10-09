/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE-1: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan OFF: off
// ASSERT: scan-not trace
// ASSERT: scan-not debug
// ASSERT: scan-not info
// ASSERT: scan-not warn
// ASSERT: scan-not all
// ASSERT: scan-not error

// Only print OFF: off in stdout and throw PythonException: off

import std.ffi.python.*
import std.log.*

var x = Python.load()

main(): Int64 {
    PYLOG.level = OFF
    if (PYLOG.level.level() != 1) {
        return 1
    }
    PYLOG.log(TRACE, "trace")
    PYLOG.log(DEBUG, "debug")
    PYLOG.log(INFO, "info")
    PYLOG.log(WARN, "warn")
    PYLOG.log(OFF, "off")
    PYLOG.log(ALL, "all")
    PYLOG.log(ERROR, "error")
    return 0
}
