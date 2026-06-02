/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双上界：仅满足类、未实现接口则不满足

/* SCAN
sat gen 2ub miss iface: false
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.satg.2fl", AccessLevel.Public)
    let base = pkg.addClass("b2f", "B2f", true)
    let iface = pkg.addClass("i2f", "I2f", false)
    let miss = pkg.addClass("m2f", "M2f", true)
    miss.superClass = Some(base.classType)

    let g = GenericType.get("gSat2f", "T2f")
    let ifRef = RefType.get(iface.classType)
    g.upperBounds = Array<Type>(2, { i =>
        if (i == 0) {
            base.classType
        } else {
            ifRef
        }
    })
    var m = HashMap<GenericType, Type>()
    println("sat gen 2ub miss iface: ${miss.ty.satisfyGenericConstraints(g, m)}")
}
