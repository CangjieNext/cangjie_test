/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双上界：类 + Ref(接口)；同时满足

/* SCAN
sat gen 2ub good: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.satg.2ok", AccessLevel.Public)
    let base = pkg.addClass("b2", "B2", true)
    let iface = pkg.addClass("i2", "I2", false)
    let good = pkg.addClass("g2", "G2", true)
    good.superClass = Some(base.classType)
    good.implementedInterfaceTypes = [iface.classType]

    let g = GenericType.get("gSat2ub", "T2")
    let ifRef = RefType.get(iface.classType)
    g.upperBounds = Array<Type>(2, { i =>
        if (i == 0) {
            base.classType
        } else {
            ifRef
        }
    })
    var m = HashMap<GenericType, Type>()
    println("sat gen 2ub good: ${good.ty.satisfyGenericConstraints(g, m)}")
}
