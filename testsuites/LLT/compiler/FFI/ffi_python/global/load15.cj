// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: unset PYTHON_DYNLIB && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: regex INFO: Can't find "libpythonX\.Y\.(so)?(dylib)?" from environment PYTHON_DYNLIB, try to find it from executable file path.
// ASSERT: regex INFO: Exec cmd: "(ldd)?(otool -L)? \$\(which python3\)":
// ASSERT: regex INFO: Found lib:

internal import ffi_python.*

main(): Int64 {
    Python.load(loglevel: LogLevel.INFO)
    Python.unload()
    return 0
}