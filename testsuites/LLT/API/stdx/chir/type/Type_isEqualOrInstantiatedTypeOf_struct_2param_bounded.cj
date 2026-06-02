/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 双形参泛型 struct，T、U 各有类上界；(S1,S2) 实例化 GPair<T,U>

/* SCAN
struct SS inst 2param tmpl: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.st2", AccessLevel.Public)
    let b1 = pkg.addClass("b1st", "B1st", true)
    let b2 = pkg.addClass("b2st", "B2st", true)
    let s1 = pkg.addClass("s1st", "S1st", true)
    let s2 = pkg.addClass("s2st", "S2st", true)
    s1.superClass = Some(b1.classType)
    s2.superClass = Some(b2.classType)

    let gT = GenericType.get("gTbSt", "Tbst")
    let gU = GenericType.get("gUbSt", "Ubst")
    gT.upperBounds = Array<Type>(1, { _ => b1.classType })
    gU.upperBounds = Array<Type>(1, { _ => b2.classType })
    let gp = Array<GenericType>(2, { i =>
        if (i == 0) {
            gT
        } else {
            gU
        }
    })
    let stDef = pkg.addStruct("stGPair", "GPair", genericTypeParams: gp)
    let tmpl = StructType.get(stDef, Array<Type>(2, { i =>
        if (i == 0) {
            gT
        } else {
            gU
        }
    }))
    let inst = StructType.get(stDef, Array<Type>(2, { i =>
        if (i == 0) {
            s1.ty
        } else {
            s2.ty
        }
    }))
    println("struct SS inst 2param tmpl: ${inst.isEqualOrInstantiatedTypeOf(tmpl)}")
}
