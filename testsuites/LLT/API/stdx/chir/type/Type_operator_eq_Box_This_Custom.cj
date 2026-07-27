/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Equatable：BoxType / ThisType / EnumType / StructType / CustomType 的 typed ==

/* SCAN
box eq: true
this eq: true
enumDef ok: true
enum eq: true
struct eq: true
custom eq: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let b1 = BoxType.get(i32)
    let b2 = BoxType.get(i32)
    println("box eq: ${b1 == b2}")
    println("this eq: ${ThisType.get() == ThisType.get()}")

    let pkg = Package("pkg.teq.typed", AccessLevel.Public)
    let en = pkg.addEnum("mColor", "Color", true)
    let et1 = EnumType.get(en, Array<Type>())
    let et2 = EnumType.get(en, Array<Type>())
    println("enumDef ok: ${et1.enumDef == en}")
    println("enum eq: ${et1 == et2}")

    let st = pkg.addStruct("mS", "S")
    println("struct eq: ${StructType.get(st, Array<Type>()) == StructType.get(st, Array<Type>())}")

    let cty1 = ClassLikeType.get(pkg.addClass("mCeq", "Ceq", true), Array<Type>())
    let cty2 = ClassLikeType.get(cty1.classLikeDef, Array<Type>())
    let cu1: CustomType = cty1
    let cu2: CustomType = cty2
    println("custom eq: ${cu1 == cu2}")
}
