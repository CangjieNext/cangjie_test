/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 接口上界：T <: Ref(I)；实现类满足，未实现为 false（与 Type_isEqualOrSubTypeOf_bounded 一致）

/* SCAN
tuple impl inst tuple U: true
tuple orphan inst tuple U: false
raw impl inst raw U: true
raw orphan inst raw U: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.inst.bif", AccessLevel.Public)
    let iface = pkg.addClass("mIFI", "IFI", false)
    let impl = pkg.addClass("mImpI", "ImpI", true)
    impl.implementedInterfaceTypes = [iface.classType]
    let orphan = pkg.addClass("mOrpI", "OrpI", true)

    let ifaceRef = RefType.get(iface.classType)
    let gU = GenericType.get("gInstBIf", "U")
    gU.upperBounds = Array<Type>(1, { _ => ifaceRef })

    let tplU = TupleType.get(Array<Type>(1, { _ => gU }))
    let tplImpl = TupleType.get(Array<Type>(1, { _ => impl.ty }))
    let tplOrph = TupleType.get(Array<Type>(1, { _ => orphan.ty }))
    println("tuple impl inst tuple U: ${tplImpl.isEqualOrInstantiatedTypeOf(tplU)}")
    println("tuple orphan inst tuple U: ${tplOrph.isEqualOrInstantiatedTypeOf(tplU)}")

    let rawU = RawArrayType.get(gU, 2)
    let rawImpl = RawArrayType.get(impl.ty, 2)
    let rawOrph = RawArrayType.get(orphan.ty, 2)
    println("raw impl inst raw U: ${rawImpl.isEqualOrInstantiatedTypeOf(rawU)}")
    println("raw orphan inst raw U: ${rawOrph.isEqualOrInstantiatedTypeOf(rawU)}")
}
