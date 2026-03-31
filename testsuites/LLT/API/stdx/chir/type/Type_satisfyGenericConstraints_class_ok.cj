/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 单类上界 T <: Base；子类满足

/* SCAN
sat gen class sub ok: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.satg.clsok", AccessLevel.Public)
    let base = pkg.addClass("b", "B", true)
    let sub = pkg.addClass("s", "S", true)
    sub.superClass = Some(base.classType)

    let g = GenericType.get("gSatCls", "Tc")
    g.upperBounds = Array<Type>(1, { _ => base.classType })
    var m = HashMap<GenericType, Type>()
    println("sat gen class sub ok: ${sub.ty.satisfyGenericConstraints(g, m)}")
}
