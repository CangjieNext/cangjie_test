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
tuple elt0 Int32: true
tuple eq copy: true
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
    println("tuple elt0 Int32: ${t1.elementTypes[0] == i32}")
    println("tuple eq copy: ${t1 == t2}")
}
