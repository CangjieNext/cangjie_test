// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not INFO: log info
// ASSERT: scan-not WARN: log warn
// ASSERT: scan ERROR: log error
// ASSERT: scan-not INFO: loglevel info
// ASSERT: scan-not WARN: loglevel warn
// ASSERT: scan ERROR: loglevel error

internal import ffi_python.*

main(): Int64 {
    PYLOG.level = LogLevel.ERROR
    PYLOG.info("log info")
    PYLOG.warn("log warn")
    try {
        PYLOG.error("log error")
    } catch(e: PythonException) {}

    PYLOG.log(LogLevel.INFO, "loglevel info")
    PYLOG.log(LogLevel.WARN, "loglevel warn")
    try {
        PYLOG.log(LogLevel.ERROR, "loglevel error")
    } catch(e: PythonException) {}
    return 0
}