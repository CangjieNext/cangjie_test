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

// TryBinaryExpression: TryAdd, TrySub, TryMul, TryDiv, TryMod, TryExp, TryLShift, TryRShift
// fn1 带泛型参数 T, U, V, W（4个）

main() {
    let pkg = Package("pkg.ser9", AccessLevel.Public)
    let i64 = IntType.getInt64()
    let gT = GenericType.get("pkg.ser9.T", "T")
    let gU = GenericType.get("pkg.ser9.U", "U")
    let gV = GenericType.get("pkg.ser9.V", "V")
    let gW = GenericType.get("pkg.ser9.W", "W")

    let fn1 = pkg.addFunction(FuncType.get([i64, i64], i64), "fn1", "fn1", "pkg.ser9")
    fn1.genericTypeParams = [gT, gU, gV, gW]
    fn1.initBody()
    let bg = fn1.body.getOrThrow()
    let entry = bg.entryBlock
    let lhs = fn1.parameters[0]
    let rhs = fn1.parameters[1]

    // Each TryBinary is a terminator; chain: entry -> n0 -> n1 -> ... -> exit
    let n0 = bg.appendBlock()
    let e0 = bg.appendBlock()
    entry.appendExpr(TryBinaryExpression.create(BinaryExprKind.Add, lhs, rhs, n0, e0))
    e0.appendExpr(Exit.create())

    let n1 = bg.appendBlock()
    let e1 = bg.appendBlock()
    n0.appendExpr(TryBinaryExpression.create(BinaryExprKind.Sub, lhs, rhs, n1, e1))
    e1.appendExpr(Exit.create())

    let n2 = bg.appendBlock()
    let e2 = bg.appendBlock()
    n1.appendExpr(TryBinaryExpression.create(BinaryExprKind.Mul, lhs, rhs, n2, e2))
    e2.appendExpr(Exit.create())

    let n3 = bg.appendBlock()
    let e3 = bg.appendBlock()
    n2.appendExpr(TryBinaryExpression.create(BinaryExprKind.Div, lhs, rhs, n3, e3))
    e3.appendExpr(Exit.create())

    let n4 = bg.appendBlock()
    let e4 = bg.appendBlock()
    n3.appendExpr(TryBinaryExpression.create(BinaryExprKind.Mod, lhs, rhs, n4, e4))
    e4.appendExpr(Exit.create())

    let n5 = bg.appendBlock()
    let e5 = bg.appendBlock()
    n4.appendExpr(TryBinaryExpression.create(BinaryExprKind.Exp, lhs, rhs, n5, e5))
    e5.appendExpr(Exit.create())

    let n6 = bg.appendBlock()
    let e6 = bg.appendBlock()
    n5.appendExpr(TryBinaryExpression.create(BinaryExprKind.LShift, lhs, rhs, n6, e6))
    e6.appendExpr(Exit.create())

    let n7 = bg.appendBlock()
    let e7 = bg.appendBlock()
    n6.appendExpr(TryBinaryExpression.create(BinaryExprKind.RShift, lhs, rhs, n7, e7))
    e7.appendExpr(Exit.create())
    n7.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
