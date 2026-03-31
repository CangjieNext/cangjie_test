/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双形参 T,U 均无约束：(Int32, Bool) 实例化 (T,U)

/* SCAN
tuple TU uncon i32 bool: true
*/

import stdx.chir.*

main() {
    let gT = GenericType.get("gTuUn", "Tu")
    let gU = GenericType.get("gUuUn", "Uu")
    let tmpl = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            gT
        } else {
            gU
        }
    }))
    let inst = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            IntType.getInt32()
        } else {
            BoolType.get()
        }
    }))
    println("tuple TU uncon i32 bool: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
