// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 3.140000: true
// ASSERT: scan 2000.000000: true
// ASSERT: scan 0.240000: true
// ASSERT: scan 12.300000: true
// ASSERT: scan 1.062500: true
// ASSERT: scan 4.000000: true
// ASSERT: scan 2.000000: true
// ASSERT: scan 3.140000: true
// ASSERT: scan 2000.000000: true
// ASSERT: scan 0.240000: true
// ASSERT: scan 12.300000: true
internal import ffi_python.*

main(): Int64 {
    Python.load()

    var f1 = PyFloat(3.14)
    var f2 = PyFloat(2e3)
    var f3 = PyFloat(2.4e-1)
    var f4 = PyFloat(.123e2)
    var f5 = PyFloat(0x1.1p0)
    var f6 = PyFloat(0x1p2)
    var f7 = PyFloat(0x.2p4)
    var f8 = PyFloat(3.14f32)
    var f9 = PyFloat(2e3f32)
    var f10 = PyFloat(2.4e-1f64)
    var f11 = PyFloat(.123e2f64)

    print("${f1.toCjObj()}: ${f1.toCjObj() == 3.14}\n")
    print("${f2.toCjObj()}: ${f2.toCjObj() == 2e3}\n")
    print("${f3.toCjObj()}: ${f3.toCjObj() == 2.4e-1}\n")
    print("${f4.toCjObj()}: ${f4.toCjObj() == .123e2}\n")
    print("${f5.toCjObj()}: ${f5.toCjObj() == 0x1.1p0}\n")
    print("${f6.toCjObj()}: ${f6.toCjObj() == 0x1p2}\n")
    print("${f7.toCjObj()}: ${f7.toCjObj() == 0x.2p4}\n")
    print("${f8.toCjObj()}: ${Float32(f8.toCjObj()) == 3.14f32}\n")
    print("${f9.toCjObj()}: ${Float32(f9.toCjObj()) == 2e3f32}\n")
    print("${f10.toCjObj()}: ${f10.toCjObj() == 2.4e-1f64}\n")
    print("${f11.toCjObj()}: ${f11.toCjObj() ==.123e2f64}\n")

    Python.unload()
    return 0
}
