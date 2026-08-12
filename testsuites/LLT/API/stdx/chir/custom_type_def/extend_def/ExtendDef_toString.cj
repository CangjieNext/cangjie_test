/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
extend str has extend kw: true
extend str has Int32: true
extend str has brace: true
extend str has id comment: true
extend comment has pkg: true
generic extend str has angle: true
struct extend has at prefix: true
struct extend has iface bound: true
multi iface bound: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.str", AccessLevel.Public)
    let intTy = IntType.getInt32()
    let ext = pkg.addExtend("mExtI32", intTy)

    let es = ext.toString()
    println("extend str has extend kw: ${es.contains("extend")}")
    println("extend str has Int32: ${es.contains("Int32")}")
    println("extend str has brace: ${es.contains("{")}")
    println("extend str has id comment: ${es.contains("id:")}")
    println("extend comment has pkg: ${es.contains("packageName:")}")

    let g = GenericType.get("geH", "H")
    let gp = Array<GenericType>(1, { _ => g })
    let gext = pkg.addExtend("gExtH", intTy, genericTypeParams: gp)
    let gs = gext.toString()
    println("generic extend str has angle: ${gs.contains("<") && gs.contains(">")}")

    let st = pkg.addStruct("mP", "Point")
    let i1 = pkg.addClass("mI1", "I1", false)
    let i2 = pkg.addClass("mI2", "I2", false)
    let stExt = pkg.addExtend("extPoint", st.structType)
    stExt.implementedInterfaceTypes = [i1.classType]
    let sts = stExt.toString()
    println("struct extend has at prefix: ${sts.contains("@Struct-mP")}")
    println("struct extend has iface bound: ${sts.contains("<:") && sts.contains("ClassLike-mI1")}")

    let stExt2 = pkg.addExtend("extPoint2", st.structType)
    stExt2.implementedInterfaceTypes = [i1.classType, i2.classType]
    let sts2 = stExt2.toString()
    println("multi iface bound: ${sts2.contains("ClassLike-mI1") && sts2.contains(" & ") && sts2.contains("ClassLike-mI2")}")
}
