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
struct same: true
struct diff: false
gen struct same args: true
class not struct: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sub.struct", AccessLevel.Public)

    let c1 = pkg.addClass("mC1", "C1", true)
    let cl1 = ClassLikeType.get(c1, Array<Type>())

    let s1 = pkg.addStruct("mS1", "S1")
    let s2 = pkg.addStruct("mS2", "S2")
    let st1 = StructType.get(s1, Array<Type>())
    let st1b = StructType.get(s1, Array<Type>())
    let st2 = StructType.get(s2, Array<Type>())
    println("struct same: ${st1.isEqualOrSubTypeOf(st1b)}")
    println("struct diff: ${st1.isEqualOrSubTypeOf(st2)}")

    let gS = GenericType.get("gSubST", "T")
    let gpS = Array<GenericType>(1, { _ => gS })
    let sgen = pkg.addStruct("gSk", "GSk", genericTypeParams: gpS)
    let sgt1 = StructType.get(sgen, Array<Type>(1, { _ => gS }))
    let sgt2 = StructType.get(sgen, Array<Type>(1, { _ => gS }))
    println("gen struct same args: ${sgt1.isEqualOrSubTypeOf(sgt2)}")

    println("class not struct: ${cl1.isEqualOrSubTypeOf(st1)}")
}
