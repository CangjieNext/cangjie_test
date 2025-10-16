// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test load multiple times.

// DEPENDENCE: common.cj
// EXEC: %compiler %pyffi-link common.cj %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan INFO: Libpython has loaded.
// ASSERT: regex version: 3\..*\..*

internal import ffi_python.*

main(): Int64 {
    var path = getPythonPathBySysLib(directories)
    print("path: ${path}\n")
    Python.load(path, loglevel: LogLevel.INFO)
    Python.load(loglevel: LogLevel.INFO)
    print("version: ${Python.getVersion()}\n")
    Python.unload()
    return 0
}