/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 矩阵：B1 泛型无约束 × A1 extend<T> + HG2 <: HG1 递归

/* SCAN
B1_A1 super count: 2
B1_A1 recursive HG2 HG1: true
*/

import stdx.chir.*

func chainOk(hay: Array<ClassLikeType>, child: ClassLikeType, parent: ClassLikeType): Bool {
    var hasC = false
    var hasP = false
    for (x in hay) {
        if (x == child) {
            hasC = true
        }
        if (x == parent) {
            hasP = true
        }
    }
    return hasC && hasP
}

main() {
    let pkg = Package("pkg.m.B1A1", AccessLevel.Public)
    let hg1 = pkg.addClass("mHG1", "HG1", false)
    let hg2 = pkg.addClass("mHG2", "HG2", false)
    hg2.implementedInterfaceTypes = [hg1.classType]

    let g = GenericType.get("idB1A1", "T")
    let cp = CPointerType.get(g)
    let gp = Array<GenericType>(1, { _ => g })
    let ext = pkg.addExtend("extB1A1", cp, genericTypeParams: gp)
    ext.implementedInterfaceTypes = [hg2.classType]
    cp.addExtend(ext)

    let sup = cp.getSuperTypesRecusively()
    println("B1_A1 super count: ${sup.size}")
    println("B1_A1 recursive HG2 HG1: ${chainOk(sup, hg2.classType, hg1.classType)}")
}
