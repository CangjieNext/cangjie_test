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
func same sig: true
func diff ret: false
func diff params: false
func vararg vs plain: false
func not tuple: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let b = BoolType.get()

    let fa = FuncType.get(Array<Type>(1, { _ => i32 }), b)
    let fb = FuncType.get(Array<Type>(1, { _ => i32 }), b)
    println("func same sig: ${fa.isEqualOrSubTypeOf(fb)}")

    let fdRet = FuncType.get(Array<Type>(1, { _ => i32 }), i32)
    println("func diff ret: ${fa.isEqualOrSubTypeOf(fdRet)}")

    let fdParam = FuncType.get(Array<Type>(), b)
    println("func diff params: ${fa.isEqualOrSubTypeOf(fdParam)}")

    let fv = FuncType.get(Array<Type>(1, { _ => i32 }), b, varArg: true)
    println("func vararg vs plain: ${fa.isEqualOrSubTypeOf(fv)}")

    let tup = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            i32
        } else {
            b
        }
    }))
    println("func not tuple: ${fa.isEqualOrSubTypeOf(tup)}")
}
