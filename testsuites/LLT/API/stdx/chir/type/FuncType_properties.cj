/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
plain isFunc: true isCFunc: false
cfunc isFunc: true isCFunc: true
ret is Bool: true
param count: 1
vararg has: true
cfunc str has CFunc: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let plain: Type = FuncType.get(Array<Type>(1, { _ => i32 }), BoolType.get())
    let cft: Type = FuncType.get(Array<Type>(), i32, cFunc: true)
    println("plain isFunc: ${plain.isFuncType()} isCFunc: ${plain.isCFuncType()}")
    println("cfunc isFunc: ${cft.isFuncType()} isCFunc: ${cft.isCFuncType()}")

    let f = FuncType.get(Array<Type>(1, { _ => i32 }), BoolType.get())
    println("ret is Bool: ${f.returnType == BoolType.get()}")
    println("param count: ${f.paramTypes.size}")

    let fv = FuncType.get(Array<Type>(1, { _ => i32 }), BoolType.get(), varArg: true)
    println("vararg has: ${fv.hasVarArg}")

    let fc = FuncType.get(Array<Type>(), i32, cFunc: true)
    println("cfunc str has CFunc: ${fc.toString().contains("CFunc")}")
}
