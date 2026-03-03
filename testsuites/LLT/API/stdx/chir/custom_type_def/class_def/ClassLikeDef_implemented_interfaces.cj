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
iface default impl: 0
class default impl: 0
class impl count: 2
impl0 is iface ty: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.impl", AccessLevel.Public)
    let i1 = pkg.addClass("I1", "I1", false)
    let i2 = pkg.addClass("I2", "I2", false)
    let cls = pkg.addClass("mC", "C", true)

    println("iface default impl: ${i1.implementedInterfaceTypes.size}")
    println("class default impl: ${cls.implementedInterfaceTypes.size}")

    cls.implementedInterfaceTypes = Array<ClassLikeType>(2, { i =>
        if (i == 0) {
            i1.classType
        } else {
            i2.classType
        }
    })
    println("class impl count: ${cls.implementedInterfaceTypes.size}")
    println("impl0 is iface ty: ${cls.implementedInterfaceTypes[0] == i1.classType}")
}
