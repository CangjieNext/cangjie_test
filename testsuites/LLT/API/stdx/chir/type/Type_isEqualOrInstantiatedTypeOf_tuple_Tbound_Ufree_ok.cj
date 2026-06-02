/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// T 有类上界、U 无约束；(S, Bool) 可实例化 (T,U)

/* SCAN
tuple S bool inst T Ufree: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.tsb", AccessLevel.Public)
    let b1 = pkg.addClass("b1f", "B1f", true)
    let s1 = pkg.addClass("s1f", "S1f", true)
    s1.superClass = Some(b1.classType)

    let gT = GenericType.get("gTbf", "Tbf")
    let gU = GenericType.get("gUff", "Uff")
    gT.upperBounds = Array<Type>(1, { _ => b1.classType })
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
            BoolType.get()
        }
    }))
    println("tuple S bool inst T Ufree: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
