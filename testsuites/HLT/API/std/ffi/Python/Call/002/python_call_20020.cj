/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20020.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-10 cfoo!

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo_0(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_1(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_2(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_3(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_4(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_5(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_6(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_7(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_8(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

@C
func cfoo_9(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f0 = PyCFunc(
        unsafe { cast(cfoo_0) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f1 = PyCFunc(
        unsafe { cast(cfoo_1) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f2 = PyCFunc(
        unsafe { cast(cfoo_2) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f3 = PyCFunc(
        unsafe { cast(cfoo_3) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f4 = PyCFunc(
        unsafe { cast(cfoo_4) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f5 = PyCFunc(
        unsafe { cast(cfoo_5) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f6 = PyCFunc(
        unsafe { cast(cfoo_6) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f7 = PyCFunc(
        unsafe { cast(cfoo_7) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f8 = PyCFunc(
        unsafe { cast(cfoo_8) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )
    var f9 = PyCFunc(
        unsafe { cast(cfoo_9) },
        argsTy: [PyCBool],
        retTy: PyCPointer
    )

    var cfunc01 = Python.Import("python_call_20020")
    cfunc01["foo"]([f0, f1, f2, f3, f4, f5, f6, f7, f8, f9])
    Python.unload()
    return 0
}
