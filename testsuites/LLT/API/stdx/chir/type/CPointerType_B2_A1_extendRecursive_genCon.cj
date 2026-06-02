/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// B2×A1：
//   - 用 pkg.addExtend 创建 ExtendDef：extendedType = CPointer<T>，带 genericTypeParams=[T]，且 T <: Bound（上界为 bound.classType）。
//   - extend 上声明实现接口 I2，且 I2 <: I1（递归父接口）。
//   - 将 ExtendDef 挂到模板 CPointer(T) 上：cpTemplate.addExtend(ext)。
//   - 再构造两个 CPointerType 实例：
//       * 元素类型 SubOk <: Bound → 与模板匹配，getSuperTypesRecusively 含 I2、I1；
//       * 元素类型为 struct（与 Bound 无子类型关系）→ 与模板不匹配，不合并该 extend，父类型为空。

/* SCAN
B2_A1 super satisfy: 2
B2_A1 super not satisfy: 0
B2_A1 chain I2 I1: true
B2_A1 inst satisfy: true
B2_A1 inst not: false
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
    let pkg = Package("pkg.m.B2A1", AccessLevel.Public)
    let bound = pkg.addClass("mBdB", "BoundB", true)
    let i1 = pkg.addClass("mI1", "I1", false)
    let i2 = pkg.addClass("mI2", "I2", false)
    i2.implementedInterfaceTypes = [i1.classType]

    let gT = GenericType.get("idB2A1", "U")
    gT.upperBounds = Array<Type>(1, { _ => bound.classType })
    let cpTemplate = CPointerType.get(gT)
    let gp = Array<GenericType>(1, { _ => gT })
    let ext = pkg.addExtend("extCpBoundU", cpTemplate, genericTypeParams: gp)
    ext.implementedInterfaceTypes = [i2.classType]
    cpTemplate.addExtend(ext)

    let subOk = pkg.addClass("mSubOk", "SubOk", true)
    subOk.superClass = Some(bound.classType)
    let cpSatisfy = CPointerType.get(subOk.ty)

    let st = pkg.addStruct("mSt", "St")
    let cpNot = CPointerType.get(st.ty)

    let supOk = cpSatisfy.getSuperTypesRecusively()
    let supNot = cpNot.getSuperTypesRecusively().size

    println("B2_A1 super satisfy: ${supOk.size}")
    println("B2_A1 super not satisfy: ${supNot}")
    println("B2_A1 chain I2 I1: ${chainOk(supOk, i2.classType, i1.classType)}")
    println("B2_A1 inst satisfy: ${cpSatisfy.isEqualOrInstantiatedTypeOf(cpTemplate)}")
    println("B2_A1 inst not: ${cpNot.isEqualOrInstantiatedTypeOf(cpTemplate)}")
}
