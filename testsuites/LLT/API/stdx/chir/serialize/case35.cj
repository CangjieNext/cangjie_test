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

// Function 带 Annotation

main() {
    let pkg = Package("pkg.td12", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let cls = pkg.addClass("mService", "Service", true)

    let mf1 = pkg.addFunction(FuncType.get(Array<Type>(), i64), "mService.query", "query", "pkg.td12")
    let annoFn1 = Annotation("Override")
    mf1.annotations = [annoFn1]
    mf1.initBody()
    mf1.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf1)

    let mf2 = pkg.addFunction(FuncType.get([i32], i64), "mService.queryById", "queryById", "pkg.td12")
    let annoFn2 = Annotation("Transactional")
    annoFn2.argValues = ["readOnly"]
    let annoFn3 = Annotation("Cacheable")
    annoFn3.argValues = ["key", "3600"]
    mf2.annotations = [annoFn2, annoFn3]
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
