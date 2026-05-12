/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
macro package define

import std.ffi.python.*
import std.log.*
import std.ast.*

var x = Python.load()

@C
func cfoo(a: Bool): CPointer<Unit> {
    println("cfoo!")
    return CPointer<Unit>()
}

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

public macro CallPy(input: Tokens) {
    var f1 = PyCFunc(unsafe { cast(cfoo) }, argsTy: [PyCBool], retTy: PyCPointer)
    var cfunc01 = Python.Import("python_call_20027")
    cfunc01["foo"]([f1])
    return input
}
