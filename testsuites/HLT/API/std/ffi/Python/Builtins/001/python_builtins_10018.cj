/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: echo "test" > test.%test_suffix
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-ERRCHECK: %export cjStackSize=1MB && %run %run_opt %output %run_args
// ASSERT: scan "" does not exist or the file path is invalid.

// should find default so.

import std.ffi.python.*
import std.log.*

main(): Int64 {
    Python.load("", loglevel: LogLevel.ALL)
    Python.unload()
    return 0
}
