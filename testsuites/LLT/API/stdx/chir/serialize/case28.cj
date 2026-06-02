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

// ClassDef 带泛型参数 T, U

main() {
    let pkg = Package("pkg.td5", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let gT = GenericType.get("pkg.td5.T", "T")
    let gU = GenericType.get("pkg.td5.U", "U")

    let cls = pkg.addClass("mPair", "Pair", true, genericTypeParams: [gT, gU])

    // 实例成员变量使用泛型类型
    cls.appendInstanceMemberVar("first", gT)
    cls.appendInstanceMemberVar("second", gU)

    // 成员函数
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mPair.size", "size", "pkg.td5")
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
