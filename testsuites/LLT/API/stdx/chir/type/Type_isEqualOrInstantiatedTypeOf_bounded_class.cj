/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 类上界 T <: Bound：实例化仅当实参满足继承；上界用 classType（与 CPointer B2_A0 一致）

/* SCAN
tuple subOk inst tuple T: true
tuple plain inst tuple T: false
varr subOk inst varr T: true
varr plain inst varr T: false
gen struct subOk inst tmpl: true
gen struct plain inst tmpl: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.bcls", AccessLevel.Public)
    let bound = pkg.addClass("mBdI", "BdI", true)
    let subOk = pkg.addClass("mSubI", "SubI", true)
    subOk.superClass = Some(bound.classType)
    let plain = pkg.addClass("mPlI", "PlI", true)

    let gT = GenericType.get("gInstBCls", "T")
    gT.upperBounds = Array<Type>(1, { _ => bound.classType })

    let tplT = TupleType.get(Array<Type>(1, { _ => gT }))
    let tplOk = TupleType.get(Array<Type>(1, { _ => subOk.ty }))
    let tplBad = TupleType.get(Array<Type>(1, { _ => plain.ty }))
    println("tuple subOk inst tuple T: ${tplOk.isEqualOrInstantiatedTypeOf(tplT)}")
    println("tuple plain inst tuple T: ${tplBad.isEqualOrInstantiatedTypeOf(tplT)}")

    let vaT = VArrayType.get(gT, 3)
    let vaOk = VArrayType.get(subOk.ty, 3)
    let vaBad = VArrayType.get(plain.ty, 3)
    println("varr subOk inst varr T: ${vaOk.isEqualOrInstantiatedTypeOf(vaT)}")
    println("varr plain inst varr T: ${vaBad.isEqualOrInstantiatedTypeOf(vaT)}")

    let gp = Array<GenericType>(1, { _ => gT })
    let sgen = pkg.addStruct("gStInst", "GStInst", genericTypeParams: gp)
    let stTmpl = StructType.get(sgen, Array<Type>(1, { _ => gT }))
    let stOk = StructType.get(sgen, Array<Type>(1, { _ => subOk.ty }))
    let stBad = StructType.get(sgen, Array<Type>(1, { _ => plain.ty }))
    println("gen struct subOk inst tmpl: ${stOk.isEqualOrInstantiatedTypeOf(stTmpl)}")
    println("gen struct plain inst tmpl: ${stBad.isEqualOrInstantiatedTypeOf(stTmpl)}")
}
