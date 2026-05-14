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

// ClassDef: 实例成员变量、静态成员变量、成员函数

main() {
    let pkg = Package("pkg.td1", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let boolTy = BoolType.get()

    let cls = pkg.addClass("mCls", "MyClass", true)

    // 实例成员变量
    let vx = cls.appendInstanceMemberVar("x", i32)
    vx.setReadOnly(true)
    let vy = cls.appendInstanceMemberVar("y", boolTy)
    vy.setProtected()

    // 静态成员变量
    let sv = pkg.addGlobalVar(i64, "mCls.count", "count", "pkg.td1")
    cls.appendStaticVar(sv)

    // 成员函数
    let mf = pkg.addFunction(FuncType.get([i32], i32), "mCls.getX", "getX", "pkg.td1")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
