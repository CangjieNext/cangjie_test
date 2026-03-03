/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// B2×A0：泛型参数 T 有上界 T <: Bound（上界用 Bound 的 ClassLikeType，勿用 Ref(Bound)，否则约束检查会按 Ref 路径判定）。
// 不挂 extend：getSuperTypesRecusively 均为 0；用 isEqualOrInstantiatedTypeOf(CPointer<T>) 区分「元素满足上界」与「不满足」。

/* SCAN
B2_A0 upper size: 1
B2_A0 super satisfy: 0
B2_A0 super not satisfy: 0
B2_A0 inst CPTR T SubOk: true
B2_A0 inst CPTR T struct: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.m.B2A0", AccessLevel.Public)
    let bound = pkg.addClass("mBd", "Bound", true)
    let subOk = pkg.addClass("mSubOk", "SubOk", true)
    subOk.superClass = Some(bound.classType)
    let st = pkg.addStruct("mSt", "St")

    let gT = GenericType.get("idB2A0", "U")
    gT.upperBounds = Array<Type>(1, { _ => bound.classType })
    println("B2_A0 upper size: ${gT.upperBounds.size}")

    let cpT = CPointerType.get(gT)
    let cpSatisfy = CPointerType.get(subOk.ty)
    let cpNot = CPointerType.get(st.ty)

    println("B2_A0 super satisfy: ${cpSatisfy.getSuperTypesRecusively().size}")
    println("B2_A0 super not satisfy: ${cpNot.getSuperTypesRecusively().size}")
    println("B2_A0 inst CPTR T SubOk: ${cpSatisfy.isEqualOrInstantiatedTypeOf(cpT)}")
    println("B2_A0 inst CPTR T struct: ${cpNot.isEqualOrInstantiatedTypeOf(cpT)}")
}
