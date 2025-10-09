/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_10011.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE-1: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-1 cfoo called.
// ASSERT: scan Try to read a null CPointer!

import std.ffi.python.*
import std.log.*
import std.math.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a: CPointer<Unit>): CPointer<Unit> {
    print("cfoo called.\n")
    unsafe {
        if (a.isNull()) {
            throw Exception("Try to read a null CPointer!")
        }
        print("${a.read()}\n") // null PyCPointer to read will case coredump here.
    }
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(CPointer<Unit>) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(unsafe { cast(cfoo) }, argsTy: [PyCPointer], retTy: PyCPointer)

    // f1([()])

    var cfunc01 = Python.Import("python_call_10011")
    cfunc01["foo"]([f1])
    return 0
}
