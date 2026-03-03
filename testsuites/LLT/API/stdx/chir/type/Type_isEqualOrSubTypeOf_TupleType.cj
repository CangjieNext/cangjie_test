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
tuple same shape: true
tuple arity diff: false
tuple elt diff: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let b = BoolType.get()

    let t1 = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            i32
        } else {
            b
        }
    }))
    let t2 = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            i32
        } else {
            b
        }
    }))
    println("tuple same shape: ${t1.isEqualOrSubTypeOf(t2)}")

    let tshort = TupleType.get(Array<Type>(1, { _ => i32 }))
    println("tuple arity diff: ${t1.isEqualOrSubTypeOf(tshort)}")

    let tdiff = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            b
        } else {
            i32
        }
    }))
    println("tuple elt diff: ${t1.isEqualOrSubTypeOf(tdiff)}")
}
