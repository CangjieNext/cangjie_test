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
// ASSERT: regex-not [a-zA-Z0-9]
// Print nothing in stdout.

import std.ffi.python.*
import std.log.*

var x = Python.load()

main(): Int64 {
    PYLOG.level = OFF
    if (PYLOG.level.level() != 1) {
        return 1
    }
    PYLOG.trace("trace")
    PYLOG.debug("debug")
    PYLOG.info("info")
    PYLOG.warn("warn")
    PYLOG.error("error")
    return 0
}
