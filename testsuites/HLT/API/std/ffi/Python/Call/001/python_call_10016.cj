/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_10016.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-1 hello world

import std.ffi.python.*
import std.log.*
import std.math.*
import std.collection.*

var x = Python.load()

foreign func cast(f: CFunc<(CPointer<Int8>) -> CPointer<Unit>>): CPointer<Unit>

foreign func hello(f: CPointer<Int8>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(unsafe { cast(hello) }, argsTy: [PyCPointer], retTy: PyCPointer)

    // f1([0,0,0,0,0,0,0,0,0,0.0,0.0,'a',false])

    var cfunc01 = Python.Import("python_call_10016")
    cfunc01["foo"]([f1])
    return 0
}
