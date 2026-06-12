/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 无约束泛型：模板与自身、与具体实参、与异名形参

/* SCAN
g inst self: true
g inst i32: false
tuple i32 inst tuple T: true
tuple T inst tuple U: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let g = GenericType.get("gInstU", "T")
    let h = GenericType.get("gInstU2", "U")

    println("g inst self: ${g.isEqualOrInstantiatedTypeOf(g)}")
    println("g inst i32: ${g.isEqualOrInstantiatedTypeOf(i32)}")

    let tplT = TupleType.get(Array<Type>(1, { _ => g }))
    let tplI32 = TupleType.get(Array<Type>(1, { _ => i32 }))
    println("tuple i32 inst tuple T: ${tplI32.isEqualOrInstantiatedTypeOf(tplT)}")

    let tplH = TupleType.get(Array<Type>(1, { _ => h }))
    println("tuple T inst tuple U: ${tplT.isEqualOrInstantiatedTypeOf(tplH)}")
}
