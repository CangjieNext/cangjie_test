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

// RaiseException (both overloads), TryUnaryExpression

main() {
    let pkg = Package("pkg.ser18", AccessLevel.Public)
    let i64 = IntType.getInt64()

    // fn1: RaiseException without successor (terminator)
    let fn1 = pkg.addFunction(FuncType.get([i64], UnitType.get()), "fn1", "fn1", "pkg.ser18")
    fn1.initBody()
    let bg1 = fn1.body.getOrThrow()
    let bb1 = bg1.entryBlock
    let p1 = fn1.parameters[0]
    bb1.appendExpr(RaiseException.create(p1))

    // fn2: RaiseException with successor block (terminator)
    let fn2 = pkg.addFunction(FuncType.get([i64], UnitType.get()), "fn2", "fn2", "pkg.ser18")
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let bb2 = bg2.entryBlock
    let succ = bg2.appendBlock()
    let p2 = fn2.parameters[0]
    bb2.appendExpr(RaiseException.create(p2, succ))
    succ.appendExpr(Exit.create())

    // fn3: TryUnaryExpression (TryNeg) on i64 param
    let fn3 = pkg.addFunction(FuncType.get([i64], i64), "fn3", "fn3", "pkg.ser18")
    fn3.initBody()
    let bg3 = fn3.body.getOrThrow()
    let bb3 = bg3.entryBlock
    let p3 = fn3.parameters[0]
    let normalBb = bg3.appendBlock()
    let errorBb = bg3.appendBlock()
    bb3.appendExpr(TryUnaryExpression.create(p3, normalBb, errorBb))
    normalBb.appendExpr(Exit.create())
    errorBb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
