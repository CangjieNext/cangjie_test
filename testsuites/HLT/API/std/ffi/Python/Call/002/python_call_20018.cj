/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20018.py
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// ERRCHECK: %compiler %cmp_opt %f -lcast -L./ -o %output

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

@C
func cfoo(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

main(): Int64 {
    var f1 = PyCFunc(unsafe { cast(cfoo) }, argsTy: [PyCBool], retTy: PyCPointer)
    var x = PySet<PyCFunc>()
    x.add(f1)
    var cfunc01 = Python.Import("python_call_20018")
    cfunc01["foo"]([x.pop()])
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_no_match_operator_function_call
