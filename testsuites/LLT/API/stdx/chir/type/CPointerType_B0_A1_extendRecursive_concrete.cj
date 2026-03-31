/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 矩阵：B0 具体元素类型 × A1 extend + 接口链 I2 <: I1 递归

/* SCAN
B0_A1 super count: 2
B0_A1 recursive IF2 IF1: true
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
    let pkg = Package("pkg.m.B0A1", AccessLevel.Public)
    let i1 = pkg.addClass("mIF1", "IF1", false)
    let i2 = pkg.addClass("mIF2", "IF2", false)
    i2.implementedInterfaceTypes = [i1.classType]

    let cp = CPointerType.get(FloatType.getFloat32())
    let ext = pkg.addExtend("extB0A1", cp)
    ext.implementedInterfaceTypes = [i2.classType]
    cp.addExtend(ext)

    let sup = cp.getSuperTypesRecusively()
    println("B0_A1 super count: ${sup.size}")
    println("B0_A1 recursive IF2 IF1: ${chainOk(sup, i2.classType, i1.classType)}")
}
