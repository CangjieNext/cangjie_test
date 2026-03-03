/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双形参各有类上界；(S1,S2) 均满足时可实例化 (T,U)

/* SCAN
tuple SS inst bounded TU: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.tss", AccessLevel.Public)
    let b1 = pkg.addClass("b1", "B1", true)
    let b2 = pkg.addClass("b2", "B2", true)
    let s1 = pkg.addClass("s1", "S1", true)
    let s2 = pkg.addClass("s2", "S2", true)
    s1.superClass = Some(b1.classType)
    s2.superClass = Some(b2.classType)

    let gT = GenericType.get("gTbSS", "Tb")
    let gU = GenericType.get("gUbSS", "Ub")
    gT.upperBounds = Array<Type>(1, { _ => b1.classType })
    gU.upperBounds = Array<Type>(1, { _ => b2.classType })
    let tmpl = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            gT
        } else {
            gU
        }
    }))
    let inst = TupleType.get(Array<Type>(2, { i =>
        if (i == 0) {
            s1.ty
        } else {
            s2.ty
        }
    }))
    println("tuple SS inst bounded TU: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
