/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 参数类型为父子类：函数类型在参数位置上逆变，(Base)->R 应 <: (Sub)->R（Sub <: Base）

/* SCAN
Sub sub Base: true
fn Base sub fn Sub: true
fn Sub sub fn Base: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sub.fn.param", AccessLevel.Public)
    let u = UnitType.get()

    let base = pkg.addClass("mBpar", "Bpar", true)
    let sub = pkg.addClass("mSpar", "Spar", true)
    sub.superClass = Some(base.classType)
    println("Sub sub Base: ${sub.ty.isEqualOrSubTypeOf(base.ty)}")

    let fBase = FuncType.get(Array<Type>(1, { _ => base.ty }), u)
    let fSub = FuncType.get(Array<Type>(1, { _ => sub.ty }), u)
    println("fn Base sub fn Sub: ${fBase.isEqualOrSubTypeOf(fSub)}")
    println("fn Sub sub fn Base: ${fSub.isEqualOrSubTypeOf(fBase)}")
}
