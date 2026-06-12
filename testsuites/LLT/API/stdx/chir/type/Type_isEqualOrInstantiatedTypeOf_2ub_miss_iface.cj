/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// T 双上界类+接口；仅满足类、未实现接口则不可实例化 (T)

/* SCAN
2ub miss iface inst T: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.2ubm", AccessLevel.Public)
    let cBase = pkg.addClass("cBaseM", "CBaseM", true)
    let cIF = pkg.addClass("cIFM", "CIFM", false)
    let cMiss = pkg.addClass("cMiss", "CMiss", true)
    cMiss.superClass = Some(cBase.classType)

    let gT = GenericType.get("g2ubMiss", "T2m")
    let ifRef = RefType.get(cIF.classType)
    gT.upperBounds = Array<Type>(2, { i =>
        if (i == 0) {
            cBase.classType
        } else {
            ifRef
        }
    })
    let tmpl = TupleType.get(Array<Type>(1, { _ => gT }))
    let inst = TupleType.get(Array<Type>(1, { _ => cMiss.ty }))
    println("2ub miss iface inst T: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
