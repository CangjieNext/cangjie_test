/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 上界含另一形参 U：instMap 将 U 替换为 Base 后，判定 T 的实例 <: Base

/* SCAN
sat gen T sub U map ok: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.satg.xp", AccessLevel.Public)
    let base = pkg.addClass("bx", "Bx", true)
    let sub = pkg.addClass("sx", "Sx", true)
    sub.superClass = Some(base.classType)

    let gU = GenericType.get("gSatUx", "Ux")
    let gT = GenericType.get("gSatTx", "Tx")
    gT.upperBounds = Array<Type>(1, { _ => gU })

    var m = HashMap<GenericType, Type>()
    m.add(gU, base.classType)
    println("sat gen T sub U map ok: ${sub.ty.satisfyGenericConstraints(gT, m)}")
}
