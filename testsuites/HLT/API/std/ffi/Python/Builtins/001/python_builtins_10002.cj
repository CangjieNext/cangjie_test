/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: copy_py_so.py test_10002.cj
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 > test.log
// EXEC: %python copy_py_so.py test.log my.%test_suffix
// EXEC: %compiler %cmp_opt test_10002.cj %link-python -o test_10002.out
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt test_10002.out %run_args

import std.ffi.python.*
import std.log.*

main(): Int64 {
    Python.load(loglevel: LogLevel.INFO)
    Python.unload()
    return 0
}
