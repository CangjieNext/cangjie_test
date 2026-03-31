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
upper bound count: 1
ub0 is iface ref: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.gub", AccessLevel.Public)
    let iface = pkg.addClass("mI", "I", false)
    let g = GenericType.get("gUB", "U")
    g.upperBounds = Array<Type>(1, { _ => RefType.get(iface.classType) })
    println("upper bound count: ${g.upperBounds.size}")
    println("ub0 is iface ref: ${g.upperBounds[0] == RefType.get(iface.classType)}")
}
