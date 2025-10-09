/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_10002.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-2 cfoo called.
// ASSERT: scan -1, 0, -1, -1, -1, 1, 1, 1, 1, -0.100000, -0.100000, a, false
// ASSERT: scan 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.100000, 0.100000, 1, true

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a: Int8, a_: Int8, b: Int16, c: Int32, d: Int64, e: UInt8, f: UInt16, g: UInt32, h: UInt64, i: Float32,
    j: Float64, k: UInt32, l: Bool): CPointer<Unit> {
    print("cfoo called.\n")
    print("${a}, ${a_}, ${b}, ${c}, ${d}, ${e}, ${f}, ${g}, ${h}, ${i}, ${j}, ${Rune(k)}, ${l}\n")
    return CPointer<Unit>()
}

foreign func cast(
    f: CFunc<(Int8, Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, Float32, Float64, UInt32, Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(unsafe { cast(cfoo) },
        argsTy: [PyCByte, PyCChar, PyCShort, PyCInt, PyCLonglong, PyCUbyte, PyCUshort, PyCUint, PyCUlonglong, PyCFloat,
            PyCDouble, PyCWchar, PyCBool], retTy: PyCPointer)

    f1([-1, 0, -1, -1, -1, 1, 1, 1, 1, -0.1, -0.1, 'a', false])
    var cfunc01 = Python.Import("python_call_10002")
    cfunc01["foo"]([f1])
    return 0
}
