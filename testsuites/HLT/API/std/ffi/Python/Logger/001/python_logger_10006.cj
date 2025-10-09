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
// ASSERT: scan warn
// ASSERT: scan trace
// ASSERT: scan debug
// ASSERT: scan info

import std.ffi.python.*
import std.log.*

var x = Python.load()

main(): Int64 {
    PYLOG.level = TRACE
    if (PYLOG.level.level() != 6) {
        Python.unload()
        return 1
    }
    PYLOG.trace("trace")
    PYLOG.debug("debug")
    PYLOG.info("info")
    PYLOG.warn("warn")
    Python.unload()
    return 0
}
