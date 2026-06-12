/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// T 同时上界为类与接口；(Good) 满足双上界时可实例化 (T)

/* SCAN
2ub good inst T: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.2ubg", AccessLevel.Public)
    let cBase = pkg.addClass("cBase", "CBase", true)
    let cIF = pkg.addClass("cIF", "CIF", false)
    let cGood = pkg.addClass("cGood", "CGood", true)
    cGood.superClass = Some(cBase.classType)
    cGood.implementedInterfaceTypes = [cIF.classType]

    let gT = GenericType.get("g2ubGood", "T2g")
    let ifRef = RefType.get(cIF.classType)
    gT.upperBounds = Array<Type>(2, { i =>
        if (i == 0) {
            cBase.classType
        } else {
            ifRef
        }
    })
    let tmpl = TupleType.get(Array<Type>(1, { _ => gT }))
    let inst = TupleType.get(Array<Type>(1, { _ => cGood.ty }))
    println("2ub good inst T: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
