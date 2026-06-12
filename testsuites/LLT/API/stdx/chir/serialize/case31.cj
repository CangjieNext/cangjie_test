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

// EnumDef 带泛型参数 T（带约束上界）

main() {
    let pkg = Package("pkg.td8", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let iface = pkg.addClass("mIShow", "Show", false)
    let gT = GenericType.get("pkg.td8.T", "T")
    gT.upperBounds = [RefType.get(iface.classType)]

    let en = pkg.addEnum("mOption", "Option", true, genericTypeParams: [gT])
    en.appendEnumCtorInfo("mOption.None", "None", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mOption.Some", "Some", argTypes: [gT])

    // 成员函数
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), BoolType.get()), "mOption.isNone", "isNone", "pkg.td8")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    en.appendMethod(mf)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
