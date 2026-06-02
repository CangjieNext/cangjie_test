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

// StructDef 多个泛型参数带约束上界

main() {
    let pkg = Package("pkg.td15", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let ifaceK = pkg.addClass("mHashable", "Hashable", false)
    let ifaceV = pkg.addClass("mSerializable", "Serializable", false)

    let gK = GenericType.get("pkg.td15.K", "K")
    gK.upperBounds = [RefType.get(ifaceK.classType)]
    let gV = GenericType.get("pkg.td15.V", "V")
    gV.upperBounds = [RefType.get(ifaceV.classType)]

    let st = pkg.addStruct("mPair", "Pair", genericTypeParams: [gK, gV])
    st.appendInstanceMemberVar("first", gK)
    st.appendInstanceMemberVar("second", gV)
    st.appendInstanceMemberVar("index", i32)

    let mf = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mPair.getIndex", "getIndex", "pkg.td15")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    st.appendMethod(mf)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
