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

// UnaryExpression: Neg, Not, BitNot
// fn1 带泛型参数 T, U, V（3个）；fn2 带泛型参数 V, W

main() {
    let pkg = Package("pkg.ser5", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let gT = GenericType.get("pkg.ser5.T", "T")
    let gU = GenericType.get("pkg.ser5.U", "U")
    let gV = GenericType.get("pkg.ser5.V", "V")

    // fn1: (Int32) -> Int32, uses Neg and BitNot on param
    let fn1 = pkg.addFunction(FuncType.get([i32], i32), "fn1", "fn1", "pkg.ser5")
    fn1.genericTypeParams = [gT, gU, gV]
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let p1 = fn1.parameters[0]
    let neg = UnaryExpression.create(UnaryExprKind.Neg, p1)
    neg.overflow = OverflowStrategy.Wrapping
    bb1.appendExpr(neg)
    let bitNot = UnaryExpression.create(UnaryExprKind.BitNot, neg.result)
    bb1.appendExpr(bitNot)
    bb1.appendExpr(Exit.create())

    let gW = GenericType.get("pkg.ser5.W", "W")
    // fn2: (Bool) -> Bool, uses Not on param
    let fn2 = pkg.addFunction(FuncType.get([BoolType.get()], BoolType.get()), "fn2", "fn2", "pkg.ser5")
    fn2.genericTypeParams = [gV, gW]
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock
    let p2 = fn2.parameters[0]
    let notExpr = UnaryExpression.create(UnaryExprKind.Not, p2)
    bb2.appendExpr(notExpr)
    let notExpr2 = UnaryExpression.create(UnaryExprKind.Not, notExpr.result)
    bb2.appendExpr(notExpr2)
    bb2.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
