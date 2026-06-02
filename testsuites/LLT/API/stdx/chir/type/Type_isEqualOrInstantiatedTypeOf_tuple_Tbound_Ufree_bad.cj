/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// T 有类上界、U 无约束；首参不满足 T 上界时 (Plain, Bool) 不可实例化 (T,U)

/* SCAN
tuple P bool inst T Ufree: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.tpb", AccessLevel.Public)
    let b1 = pkg.addClass("b1fb", "B1fb", true)
    let plain = pkg.addClass("plfb", "Plfb", true)

    let gT = GenericType.get("gTbfb", "Tbfb")
    let gU = GenericType.get("gUffb", "Uffb")
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
            plain.ty
        } else {
            BoolType.get()
        }
    }))
    println("tuple P bool inst T Ufree: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
