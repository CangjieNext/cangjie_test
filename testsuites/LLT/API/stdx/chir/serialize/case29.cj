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

// StructDef 带泛型参数 T（带约束上界）

main() {
    let pkg = Package("pkg.td6", AccessLevel.Public)
    let i32 = IntType.getInt32()

    // 接口作为上界
    let iface = pkg.addClass("mIComparable", "Comparable", false)

    let gT = GenericType.get("pkg.td6.T", "T")
    gT.upperBounds = [RefType.get(iface.classType)]

    let st = pkg.addStruct("mBox", "Box", genericTypeParams: [gT])
    st.appendInstanceMemberVar("value", gT)

    // 成员函数
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), BoolType.get()), "mBox.isEmpty", "isEmpty", "pkg.td6")
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
