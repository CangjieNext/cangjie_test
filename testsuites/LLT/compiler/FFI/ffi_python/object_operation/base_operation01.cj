// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 4
// ASSERT: scan 0
// ASSERT: scan 4
// ASSERT: scan 1.0
// ASSERT: scan 4
// ASSERT: scan 0
// ASSERT: scan 5.0
// ASSERT: scan 0.0
// ASSERT: scan 6.25
// ASSERT: scan 1.0
// ASSERT: scan 9.882117688026186
// ASSERT: scan 0.0
// ASSERT: scan 4.5
// ASSERT: scan 0.5
// ASSERT: scan 5.0
// ASSERT: scan 1.25
// ASSERT: scan 6.25
// ASSERT: scan 0.5
// ASSERT: scan 4.5
// ASSERT: scan -0.5
// ASSERT: scan 5.0
// ASSERT: scan 0.8
// ASSERT: scan 5.656854249492381
// ASSERT: scan 2.0

internal import ffi_python.*
 
main(): Int64 {
    Python.load()
    var a = Python.Eval("2")
    var b = Python.Eval("2.5")

    // int + int
    print("${a + a}\n")
    print("${a - a}\n")
    print("${a * a}\n")
    print("${a / a}\n")
    print("${a ** a}\n")
    print("${a % a}\n")

    // float + float
    print("${b + b}\n")
    print("${b - b}\n")
    print("${b * b}\n")
    print("${b / b}\n")
    print("${b ** b}\n")
    print("${b % b}\n")

    // float + int
    print("${b + a}\n")
    print("${b - a}\n")
    print("${b * a}\n")
    print("${b / a}\n")
    print("${b ** a}\n")
    print("${b % a}\n")

    // int + float
    print("${a + b}\n")
    print("${a - b}\n")
    print("${a * b}\n")
    print("${a / b}\n")
    print("${a ** b}\n")
    print("${a % b}\n")
    Python.unload()
    return 0
}