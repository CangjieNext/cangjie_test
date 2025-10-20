// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 024

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var slice = match (Python["slice"]([0, 6, 2])) {
        case val: PySlice<Int64> => val
        case _ => throw PythonException()
    }

    var a = ""
    for (i in slice.toCjObj()) {
        a += i.toString()
    }
    println(a)

    0
}