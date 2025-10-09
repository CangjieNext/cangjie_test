/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_10013.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-1 called.
// ASSERT: scan-1 allwords
// ASSERT: scan-1 f

import std.ffi.python.*
import std.log.*
import std.math.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a: CString, b: CString): CPointer<Unit> {
    print("called.\n")
    unsafe {
        print("${a.toString()}\n")
        print("${b.toString()}\n")
    }
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(CString, CString) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(
        unsafe { cast(cfoo) },
        argsTy: [PyCCpointer, PyCWcpointer],
        retTy: PyCPointer
    )

    // f1(["abc"])

    var cfunc01 = Python.Import("python_call_10013")
    cfunc01["foo"]([f1])
    Python.unload()
    return 0
}
