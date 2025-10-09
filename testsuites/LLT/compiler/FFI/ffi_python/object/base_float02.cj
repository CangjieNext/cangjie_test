// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 10.0
// ASSERT: scan -10.0
// ASSERT: scan 10.0
// ASSERT: scan -10.0
// ASSERT: scan true
// ASSERT: scan true
// ASSERT: scan true
// ASSERT: scan true
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var f1 = PyFloat(Float32(10.0))
    var f2 = PyFloat(Float32(-10.0))
    var f5 = Float32(10.0).toPyObj()
    var f6 = Float32(-10.0).toPyObj()

    print("${f1}\n")
    print("${f2}\n")
    print("${f5}\n")
    print("${f6}\n")

    print("${f1.toCjObj() == 10.0}\n")
    print("${f2.toCjObj() == -10.0}\n")
    print("${f5.toCjObj() == 10.0}\n")
    print("${f6.toCjObj() == -10.0}\n")

    Python.unload()
    return 0
}
