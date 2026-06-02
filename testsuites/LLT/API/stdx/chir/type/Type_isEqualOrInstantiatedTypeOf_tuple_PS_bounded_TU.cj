/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双形参各有类上界；首参不满足 T 上界时不可实例化 (T,U)

/* SCAN
tuple PS inst bounded TU: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.tps", AccessLevel.Public)
    let b1 = pkg.addClass("b1p", "B1p", true)
    let b2 = pkg.addClass("b2p", "B2p", true)
    let s2 = pkg.addClass("s2p", "S2p", true)
    let plain = pkg.addClass("plp", "Plp", true)
    s2.superClass = Some(b2.classType)

    let gT = GenericType.get("gTbPS", "Tbp")
    let gU = GenericType.get("gUbPS", "Ubp")
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
            plain.ty
        } else {
            s2.ty
        }
    }))
    println("tuple PS inst bounded TU: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
