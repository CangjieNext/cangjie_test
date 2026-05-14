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

// ExtendDef 多个泛型参数带约束上界

main() {
    let pkg = Package("pkg.td16", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let ifaceA = pkg.addClass("mComparable", "Comparable", false)
    let ifaceB = pkg.addClass("mPrintable", "Printable", false)

    let gA = GenericType.get("pkg.td16.A", "A")
    gA.upperBounds = [RefType.get(ifaceA.classType)]
    let gB = GenericType.get("pkg.td16.B", "B")
    gB.upperBounds = [RefType.get(ifaceB.classType)]

    let st = pkg.addStruct("mContainer", "Container")
    st.appendInstanceMemberVar("size", i32)

    let ext = pkg.addExtend("mExtContainer", st.structType, genericTypeParams: [gA, gB])

    let mf1 = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mExtContainer.getSize", "getSize", "pkg.td16")
    mf1.initBody()
    mf1.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    ext.appendMethod(mf1)

    let mf2 = pkg.addFunction(FuncType.get([gA], gB), "mExtContainer.convert", "convert", "pkg.td16")
    mf2.initBody()
    mf2.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    ext.appendMethod(mf2)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
