/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 返回值类型为父子类：函数类型在返回位置上协变，()->Leaf 应 <: ()->Base（Leaf <: Base）

/* SCAN
Leaf sub Mid: true
fn LeafRet sub fn MidRet: true
fn MidRet sub fn LeafRet: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sub.fn.ret", AccessLevel.Public)

    let mid = pkg.addClass("mMret", "Mret", true)
    let leaf = pkg.addClass("mLret", "Lret", true)
    leaf.superClass = Some(mid.classType)
    println("Leaf sub Mid: ${leaf.ty.isEqualOrSubTypeOf(mid.ty)}")

    let fLeaf = FuncType.get(Array<Type>(), leaf.ty)
    let fMid = FuncType.get(Array<Type>(), mid.ty)
    println("fn LeafRet sub fn MidRet: ${fLeaf.isEqualOrSubTypeOf(fMid)}")
    println("fn MidRet sub fn LeafRet: ${fMid.isEqualOrSubTypeOf(fLeaf)}")
}
