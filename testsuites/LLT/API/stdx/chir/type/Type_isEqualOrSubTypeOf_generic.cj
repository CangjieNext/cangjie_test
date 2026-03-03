/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 无约束泛型形参：自反、与另一形参区分、与具体类型不可比（非子类型关系）

/* SCAN
g self sub: true
g1 g2 distinct: false
g sub i32: false
i32 sub g: false
tuple g sub tuple g: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let g = GenericType.get("idSubGen", "T")
    let h = GenericType.get("idSubGenH", "U")

    println("g self sub: ${g.isEqualOrSubTypeOf(g)}")
    println("g1 g2 distinct: ${g.isEqualOrSubTypeOf(h)}")
    println("g sub i32: ${g.isEqualOrSubTypeOf(i32)}")
    println("i32 sub g: ${i32.isEqualOrSubTypeOf(g)}")

    let tg = TupleType.get(Array<Type>(1, { _ => g }))
    let tg2 = TupleType.get(Array<Type>(1, { _ => g }))
    println("tuple g sub tuple g: ${tg.isEqualOrSubTypeOf(tg2)}")
}
