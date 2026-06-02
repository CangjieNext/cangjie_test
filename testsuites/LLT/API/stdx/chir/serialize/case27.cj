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

// ExtendDef: 扩展 struct，添加成员函数

main() {
    let pkg = Package("pkg.td4", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let f64 = FloatType.getFloat64()

    let st = pkg.addStruct("mSt4", "Vec2")
    st.appendInstanceMemberVar("x", f64)
    st.appendInstanceMemberVar("y", f64)

    // ExtendDef 扩展 Vec2
    let ext = pkg.addExtend("mExt4", st.structType)

    // 成员函数加到 extend
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), f64), "mExt4.len", "len", "pkg.td4")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    ext.appendMethod(mf)

    // 静态成员变量加到 extend
    let sv = pkg.addGlobalVar(i32, "mExt4.cnt", "cnt", "pkg.td4")
    ext.appendStaticVar(sv)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
