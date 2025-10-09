// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output -g
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1
// ASSERT: scan 2
// ASSERT: scan 3
// ASSERT: scan True

internal import ffi_python.*

main() {
    Python.load()

    var pylist = PyList<CjObj>([1, '2', "3", true])

    println(pylist[0])
    println(pylist[1])
    println(pylist[2])
    println(pylist[3])
    
    Python.unload()
}