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

// 综合用例：ClassDef 泛型+约束+CustomAnnoInstance，成员函数泛型参数+CustomAnnoInstance，Parameter 带 CustomAnnoInstance

main() {
    let pkg = Package("pkg.td20", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // 接口作为上界
    let ifaceOrd = pkg.addClass("mOrdered", "Ordered", false)
    let ifaceEq = pkg.addClass("mEquatable", "Equatable", false)

    let gT = GenericType.get("pkg.td20.T", "T")
    gT.upperBounds = [RefType.get(ifaceOrd.classType)]
    let gU = GenericType.get("pkg.td20.U", "U")
    gU.upperBounds = [RefType.get(ifaceEq.classType)]

    // ClassDef 带泛型参数和 CustomAnnoInstance
    let cls = pkg.addClass("mSortedMap", "SortedMap", true, genericTypeParams: [gT, gU])
    let annoRepo = CustomAnnoInstance("Repository")
    annoRepo.argValues = ["sorted_map"]
    cls.customAnnoInstances = [annoRepo]

    let vKey = cls.appendInstanceMemberVar("key", gT)
    let annoKey = CustomAnnoInstance("Index")
    vKey.customAnnoInstances = [annoKey]

    let vVal = cls.appendInstanceMemberVar("value", gU)
    let vSize = cls.appendInstanceMemberVar("size", i32)

    // 静态成员变量
    let sv = pkg.addGlobalVar(i64, "mSortedMap.maxSize", "maxSize", "pkg.td20")
    cls.appendStaticVar(sv)

    // 成员函数带泛型参数、函数 CustomAnnoInstance、参数 CustomAnnoInstance
    let gR = GenericType.get("pkg.td20.R", "R")
    let mf = pkg.addFunction(FuncType.get([gT], gR), "mSortedMap.find", "find", "pkg.td20")
    mf.genericTypeParams = [gR]
    let annoMf = CustomAnnoInstance("Cacheable")
    annoMf.argValues = ["ttl=60"]
    mf.customAnnoInstances = [annoMf]
    let p0 = mf.parameters[0]
    let annoP0 = CustomAnnoInstance("NotNull")
    p0.customAnnoInstances = [annoP0]
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
