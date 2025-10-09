/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20010.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// (not O2)EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args
// (O2) EXEC-3: %export cjStackSize=1MB && %run %run_opt %output %run_args

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a1: Bool): CPointer<Unit> {
    unsafe { cfoo(a1) }
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(
        unsafe { cast(cfoo) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )

    try {
        f1([true])
    } catch (e: PythonException) {
        println("Catch PythonException: ${e}")
        Python.unload()
        return 0
    }
    return 1
}
