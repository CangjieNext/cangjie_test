// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan WARN: List elem at 3 is null.
// ASSERT: scan WARN: List elem at -1 is null.

internal import ffi_python.*

main() {
    Python.load()
    var pylist = PyList<Int64>([1, 2, 3])
    pylist[3]
    pylist[-1]
    Python.unload()
}