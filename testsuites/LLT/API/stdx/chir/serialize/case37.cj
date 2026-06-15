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

// CustomTypeDef (ClassDef) 自身带 CustomAnnoInstance

main() {
    let pkg = Package("pkg.td14", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let cls = pkg.addClass("mEntity", "Entity", true)
    let annoTable = CustomAnnoInstance("Table")
    annoTable.argValues = ["t_entity"]
    let annoCache = CustomAnnoInstance("Cacheable")
    annoCache.argValues = ["entity"]
    cls.customAnnoInstances = [annoTable, annoCache]

    cls.appendInstanceMemberVar("id", i64)
    cls.appendInstanceMemberVar("version", i32)

    let mf = pkg.addFunction(FuncType.get(Array<Type>(), i64), "mEntity.getId", "getId", "pkg.td14")
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
