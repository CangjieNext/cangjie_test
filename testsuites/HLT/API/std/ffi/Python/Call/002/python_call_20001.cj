/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20001.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-2 cfoo called.

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo(
    a1: Bool,
    a2: Bool,
    a3: Bool,
    a4: Bool,
    a5: Bool,
    a6: Bool,
    a7: Bool,
    a8: Bool,
    a9: Bool,
    a0: Bool,
    b1: Bool,
    b2: Bool,
    b3: Bool,
    b4: Bool,
    b5: Bool,
    b6: Bool,
    b7: Bool,
    b8: Bool,
    b9: Bool,
    b0: Bool,
    c1: Bool,
    c2: Bool,
    c3: Bool,
    c4: Bool,
    c5: Bool,
    c6: Bool,
    c7: Bool,
    c8: Bool,
    c9: Bool,
    c0: Bool,
    d1: Bool,
    d2: Bool,
    d3: Bool,
    d4: Bool,
    d5: Bool,
    d6: Bool,
    d7: Bool,
    d8: Bool,
    d9: Bool,
    d0: Bool,
    e1: Bool,
    e2: Bool,
    e3: Bool,
    e4: Bool,
    e5: Bool,
    e6: Bool,
    e7: Bool,
    e8: Bool,
    e9: Bool,
    e0: Bool,
    f1: Bool,
    f2: Bool,
    f3: Bool,
    f4: Bool,
    f5: Bool,
    f6: Bool,
    f7: Bool,
    f8: Bool,
    f9: Bool,
    f0: Bool,
    g1: Bool,
    g2: Bool,
    g3: Bool,
    g4: Bool,
    g5: Bool,
    g6: Bool,
    g7: Bool,
    g8: Bool,
    g9: Bool,
    g0: Bool,
    h1: Bool,
    h2: Bool,
    h3: Bool,
    h4: Bool,
    h5: Bool,
    h6: Bool,
    h7: Bool,
    h8: Bool,
    h9: Bool,
    h0: Bool,
    i1: Bool,
    i2: Bool,
    i3: Bool,
    i4: Bool,
    i5: Bool,
    i6: Bool,
    i7: Bool,
    i8: Bool,
    i9: Bool,
    i0: Bool,
    j1: Bool,
    j2: Bool,
    j3: Bool,
    j4: Bool,
    j5: Bool,
    j6: Bool,
    j7: Bool,
    j8: Bool,
    j9: Bool,
    j0: Bool
): CPointer<Unit> {
    print("cfoo called.\n")
    return CPointer<Unit>()
}

foreign func cast(
    f: CFunc<(Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool,
        Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool,
        Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool,
        Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool,
        Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool,
        Bool, Bool, Bool, Bool, Bool, Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(
        unsafe { cast(cfoo) },
        argsTy: [PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool, PyCBool,
            PyCBool, PyCBool, PyCBool, PyCBool, PyCBool],
        retTy: PyCPointer
    )

    f1(
        [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
            true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
            true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
            true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
            true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
            true, true, true, true, true, true, true, true, true, true])
    var cfunc01 = Python.Import("python_call_20001")
    cfunc01["foo"]([f1])
    Python.unload()
    return 0
}
