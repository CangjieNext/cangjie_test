/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20025.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan end_in_cj

import std.ffi.python.*
import std.log.*
import std.collection.*
import std.math.*

var x = Python.load()

@C
@OverflowSaturating
func cfoo(a: Bool): CPointer<Unit> {
    println("cfoo!")
    var x = Int64.Max
    var y = x + x
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(unsafe { cast(cfoo) }, argsTy: [PyCBool], retTy: PyCPointer)
    var cfunc01 = Python.Import("python_call_20025")
    cfunc01["foo"]([f1])
    print("end_in_cj")
    return 0
}
