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

// GoTo, Exit terminators

main() {
    let pkg = Package("pkg.ser2", AccessLevel.Public)

    // fn1: entry -> GoTo -> bb1 -> Exit
    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser2")
    fn1.initBody()
    let bg1 = fn1.body.getOrThrow()
    let bb1 = bg1.appendBlock()
    bg1.entryBlock.appendExpr(GoTo.create(bb1))
    bb1.appendExpr(Exit.create())

    // fn2: entry -> GoTo -> bb2 -> GoTo -> bb3 -> Exit
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn2", "fn2", "pkg.ser2")
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let bb2 = bg2.appendBlock()
    let bb3 = bg2.appendBlock()
    bg2.entryBlock.appendExpr(GoTo.create(bb2))
    bb2.appendExpr(GoTo.create(bb3))
    bb3.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
