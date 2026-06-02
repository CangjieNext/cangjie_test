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
enum same: true
enum diff: false
gen enum same args: true
enum not func: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sub.enum", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let b = BoolType.get()

    let e1 = pkg.addEnum("mE1", "E1", true)
    let e2 = pkg.addEnum("mE2", "E2", true)
    let et1 = EnumType.get(e1, Array<Type>())
    let et1b = EnumType.get(e1, Array<Type>())
    let et2 = EnumType.get(e2, Array<Type>())
    println("enum same: ${et1.isEqualOrSubTypeOf(et1b)}")
    println("enum diff: ${et1.isEqualOrSubTypeOf(et2)}")

    let gE = GenericType.get("gSubEU", "U")
    let gpE = Array<GenericType>(1, { _ => gE })
    let genEnum = pkg.addEnum("GenEK", "GenEK", true, genericTypeParams: gpE)
    let get1 = EnumType.get(genEnum, Array<Type>(1, { _ => gE }))
    let get2 = EnumType.get(genEnum, Array<Type>(1, { _ => gE }))
    println("gen enum same args: ${get1.isEqualOrSubTypeOf(get2)}")

    let fa = FuncType.get(Array<Type>(1, { _ => i32 }), b)
    println("enum not func: ${et1.isEqualOrSubTypeOf(fa)}")
}
