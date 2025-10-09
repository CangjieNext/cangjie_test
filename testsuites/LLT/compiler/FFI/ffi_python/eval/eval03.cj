// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: evalTest.py
// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 123
// ASSERT: scan 456
// ASSERT: scan 30

internal import ffi_python.*

main(): Int64 {
    Python.load()
    let a = Python.Eval("123")
    println((a as PyLong).getOrThrow().toCjObj())
    let b = Python.Eval("456", module: "__main__")
    println((b as PyLong).getOrThrow().toCjObj())
    let c = Python.Eval("a+b", module: "evalTest")
    println((c as PyLong).getOrThrow().toCjObj())
    Python.unload()
    return 0
}