/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// StructDef: 实例成员变量、静态成员变量、成员函数

main() {
    let pkg = Package("pkg.td2", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let f64 = FloatType.getFloat64()

    let st = pkg.addStruct("mSt", "Point")

    // 实例成员变量
    let vx = st.appendInstanceMemberVar("x", f64)
    let vy = st.appendInstanceMemberVar("y", f64)
    vx.setReadOnly(true)
    vy.setReadOnly(true)

    // 静态成员变量
    let sv = pkg.addGlobalVar(i32, "mSt.count", "count", "pkg.td2")
    sv.setReadOnly(true)
    st.appendStaticVar(sv)

    // 成员函数
    let mf1 = pkg.addFunction(FuncType.get(Array<Type>(), f64), "mSt.norm", "norm", "pkg.td2")
    mf1.initBody()
    mf1.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    st.appendMethod(mf1)

    let mf2 = pkg.addFunction(FuncType.get([f64, f64], BoolType.get()), "mSt.eq", "eq", "pkg.td2")
    mf2.initBody()
    mf2.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    st.appendMethod(mf2)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
