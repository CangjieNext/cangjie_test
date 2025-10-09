// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan false

internal import ffi_python.*
internal import std.collection.*

main() {
    Python.load()
    var a = PySet<Int64>(HashSet<Int64>([1, 2, 3]))
    a.pop()
    a.pop()
    a.pop()
    println(a.pop().isAvailable())

    Python.unload()
}