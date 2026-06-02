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

// ClassDef 带泛型参数 T, U（T 带约束上界）

main() {
    let pkg = Package("pkg.td7", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // 接口作为上界
    let iface = pkg.addClass("mISerializable", "Serializable", false)

    let gT = GenericType.get("pkg.td7.T", "T")
    gT.upperBounds = [RefType.get(iface.classType)]
    let gU = GenericType.get("pkg.td7.U", "U")

    let cls = pkg.addClass("mMap", "Map", true, genericTypeParams: [gT, gU])
    cls.appendInstanceMemberVar("key", gT)
    cls.appendInstanceMemberVar("value", gU)
    cls.appendInstanceMemberVar("size", i32)

    // 静态成员变量
    let sv = pkg.addGlobalVar(i64, "mMap.capacity", "capacity", "pkg.td7")
    cls.appendStaticVar(sv)

    // 成员函数
    let mf1 = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mMap.getSize", "getSize", "pkg.td7")
    mf1.initBody()
    mf1.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf1)

    let mf2 = pkg.addFunction(FuncType.get([gT], gU), "mMap.get", "get", "pkg.td7")
    mf2.initBody()
    mf2.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf2)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
