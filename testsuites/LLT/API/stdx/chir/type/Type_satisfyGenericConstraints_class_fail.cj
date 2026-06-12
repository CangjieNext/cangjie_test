/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 单类上界 T <: Base；无继承关系不满足

/* SCAN
sat gen class plain fail: false
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.satg.clsf", AccessLevel.Public)
    let base = pkg.addClass("bf", "Bf", true)
    let plain = pkg.addClass("pf", "Pf", true)

    let g = GenericType.get("gSatClf", "Tcf")
    g.upperBounds = Array<Type>(1, { _ => base.classType })
    var m = HashMap<GenericType, Type>()
    println("sat gen class plain fail: ${plain.ty.satisfyGenericConstraints(g, m)}")
}
