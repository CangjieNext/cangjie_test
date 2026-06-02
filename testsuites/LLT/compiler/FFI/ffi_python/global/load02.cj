// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test set library path by user.

// DEPENDENCE: common.cj
// EXEC: %compiler %pyffi-link common.cj %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args

internal import ffi_python.*

main(): Int64 {
    var path = getPythonPathBySysLib(directories)
    print("path: ${path}\n")
    Python.load(path)
    print("${Python.getVersion()}\n")
    Python.unload()
    return 0
}