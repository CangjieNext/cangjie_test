// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC-PIPE: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args

internal import ffi_python.*
internal import std.collection.*

main(): Int64 {
    for (i in 0..100) {
        Python.load()
        var a = false.toPyObj()
        Python.unload()

        Python.load()
        if (a.toCjObj()) {
            throw Exception()
        }
        Python.unload()
    }
    
    return 0
}