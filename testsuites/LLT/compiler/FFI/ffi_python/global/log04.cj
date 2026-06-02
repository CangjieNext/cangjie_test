// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan WARN
// ASSERT: scan-not INFO: 0trace print
// ASSERT: scan-not DEBUG: 0debug print
// ASSERT: scan INFO: 1trace print
// ASSERT: scan DEBUG: 1debug print

internal import ffi_python.*

main(): Int64 {
    print("${PYLOG.level}\n")
    PYLOG.info("0trace print")
    PYLOG.debug("0debug print")
    PYLOG.level = LogLevel.DEBUG
    PYLOG.info("1trace print")
    PYLOG.debug("1debug print")
    return 0
}