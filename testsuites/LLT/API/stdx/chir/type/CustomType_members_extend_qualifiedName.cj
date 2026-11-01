/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CustomType：继承成员名/实例化类型、成员查找失败、extend 实现的接口、空 srcCodeName 的 qualifiedName

/* SCAN
qn empty src: true
super members: true
member miss throw: true
extend ifaces: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ct.mem", AccessLevel.Public)

    let anon = pkg.addClass("anonId", "", true)
    println("qn empty src: ${anon.classType.qualifiedName.contains("anonId")}")

    let base = pkg.addClass("mBase", "Base", true)
    let sub = pkg.addClass("mSub", "Sub", true)
    sub.superClass = Some(base.classType)
    base.appendInstanceMemberVar("bx", i32)
    sub.appendInstanceMemberVar("sx", BoolType.get())
    let subTy = sub.classType
    let names = subTy.allMemberVarNames
    let inst = subTy.getInstantiatedMemberVarTypes()
    println("super members: ${names.size == 2 && inst.size == 2}")

    var miss = false
    try {
        let _ = subTy.getMemberVarInstantiatedType("nope")
    } catch (e: Exception) {
        miss = true
    }
    println("member miss throw: ${miss}")

    let gT = GenericType.get("gExtT", "T")
    let genCls = pkg.addClass("mBox", "Box", true, genericTypeParams: [gT])
    let iface = pkg.addClass("mIface", "Iface", false)
    let gp = Array<GenericType>(1, { _ => gT })
    let ext = pkg.addExtend("extBox", genCls.classType, genericTypeParams: gp)
    ext.implementedInterfaceTypes = [iface.classType]
    genCls.extends = [ext]
    let mono = ClassLikeType.get(genCls, [i32])
    println("extend ifaces: ${mono.getExtendImplementedInterfaceTypes().size >= 1}")
}
