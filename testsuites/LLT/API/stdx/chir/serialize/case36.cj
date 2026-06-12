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

// Parameter 带 CustomAnnoInstance

main() {
    let pkg = Package("pkg.td13", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let cls = pkg.addClass("mRepo", "Repo", true)

    let mf = pkg.addFunction(FuncType.get([i64, i32], i64), "mRepo.update", "update", "pkg.td13")
    let p0 = mf.parameters[0]
    let annoP0 = CustomAnnoInstance("NotNull")
    p0.customAnnoInstances = [annoP0]
    let p1 = mf.parameters[1]
    let annoP1 = CustomAnnoInstance("Range")
    annoP1.argValues = ["1", "100"]
    p1.customAnnoInstances = [annoP1]
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
