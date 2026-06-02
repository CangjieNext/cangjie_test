// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan success01
// ASSERT: scan success02
// ASSERT: scan success03
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var c1 = PyLong(0b0001_1000)
    if (c1.toCjObj() == 0b0001_1000) {
        print("success01\n")
    }

    var c2 = PyLong(0o30)
    if (c2.toCjObj() == 0o30) {
        print("success02\n")
    }

    var c3 = PyLong(0x18)
    if (c3.toCjObj() == 0x18) {
        print("success03\n")
    }

    Python.unload()
    return 0
}
