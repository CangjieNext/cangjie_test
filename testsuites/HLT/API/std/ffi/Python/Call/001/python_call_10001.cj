/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_10001.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_opt %f -lcast -L./ -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-2 cfoo called.
// ASSERT: scan true, 1, 2
// ASSERT: scan true, 10, 40

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a: Bool, b: Int32, c: Int64): CPointer<Unit> {
    print("cfoo called.\n")
    print("${a}, ${b}, ${c}\n")
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool, Int32, Int64) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(
        unsafe { cast(cfoo) },
        argsTy: [PyCBool, PyCInt, PyCLonglong],
        retTy: PyCPointer
    )

    f1([true, 1, 2])
    var cfunc01 = Python.Import("python_call_10001")
    cfunc01["foo"]([f1])
    Python.unload()
    return 0
}
