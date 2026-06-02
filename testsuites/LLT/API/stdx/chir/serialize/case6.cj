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

// BinaryExpression: Add, Sub, Mul, Div, Mod, Exp
// fn1 带泛型参数 T

main() {
    let pkg = Package("pkg.ser6", AccessLevel.Public)
    let i64 = IntType.getInt64()

    let gT = GenericType.get("pkg.ser6.T", "T")
    let fn1 = pkg.addFunction(FuncType.get([i64, i64], i64), "fn1", "fn1", "pkg.ser6")
    fn1.genericTypeParams = [gT]
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock
    let lhs = fn1.parameters[0]
    let rhs = fn1.parameters[1]

    let add = BinaryExpression.create(BinaryExprKind.Add, lhs, rhs)
    add.overflow = OverflowStrategy.Wrapping
    bb.appendExpr(add)

    let sub = BinaryExpression.create(BinaryExprKind.Sub, add.result, rhs)
    sub.overflow = OverflowStrategy.Saturating
    bb.appendExpr(sub)

    let mul = BinaryExpression.create(BinaryExprKind.Mul, sub.result, rhs)
    mul.overflow = OverflowStrategy.Throwing
    bb.appendExpr(mul)

    let div = BinaryExpression.create(BinaryExprKind.Div, mul.result, rhs)
    bb.appendExpr(div)

    let mod = BinaryExpression.create(BinaryExprKind.Mod, div.result, rhs)
    bb.appendExpr(mod)

    let exp = BinaryExpression.create(BinaryExprKind.Exp, mod.result, rhs)
    bb.appendExpr(exp)

    bb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
