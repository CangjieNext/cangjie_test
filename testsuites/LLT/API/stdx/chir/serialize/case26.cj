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

// EnumDef: 构造器、成员函数、静态成员变量

main() {
    let pkg = Package("pkg.td3", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let en = pkg.addEnum("mColor", "Color", true)

    // 枚举构造器
    en.appendEnumCtorInfo("mColor.Red", "Red", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mColor.Green", "Green", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mColor.Rgb", "Rgb", argTypes: [i32, i32, i32])

    // 静态成员变量
    let sv = pkg.addGlobalVar(i32, "mColor.defaultVal", "defaultVal", "pkg.td3")
    en.appendStaticVar(sv)

    // 成员函数
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mColor.toInt", "toInt", "pkg.td3")
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
