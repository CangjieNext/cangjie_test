/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: copy_py_so.py test_10012.cj
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 > test.log
// EXEC: %python copy_py_so.py test.log my.%test_suffix
// EXEC: %compiler %cmp_opt test_10012.cj %link-python -o test_10012.out
// EXEC-PIPE: %export PYTHON_DYNLIB="./my.%test_suffix" && %export cjStackSize=1MB && %run %run_opt test_10012.out %run_args | compare %f
// (MAC) ASSERT: scan INFO: Found PYTHON_DYNLIB value: ./my.dylib
// (not MAC) ASSERT: scan INFO: Found PYTHON_DYNLIB value: ./my.so
// (MAC) ASSERT: scan INFO: Load dylib "./my.dylib" success.
// (not MAC) ASSERT: scan INFO: Load so "./my.so" success.
// ASSERT: scan INFO: Read symbols success.
// ASSERT: scan INFO: Python interpreter init success.

import std.ffi.python.*
import std.log.*

main(): Int64 {
    Python.load(loglevel: LogLevel.INFO)
    Python.unload()
    return 0
}
