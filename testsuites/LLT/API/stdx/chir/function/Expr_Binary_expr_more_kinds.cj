/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// BinaryExpression 其余 BinaryExprKind（Mod/Exp/移位/位或异或/比较）

/* SCAN
more binary ok: true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.bmk", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "bmk", "bmk", "pkg.bmk")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let x = Constant.create(IntLiteral.get(i32, 5u64)).result
    let y = Constant.create(IntLiteral.get(i32, 2u64)).result
    let ov = OverflowStrategy.Throwing
    let m = BinaryExpression.create(BinaryExprKind.Mod, x, y)
    m.overflow = ov
    bb.appendExpr(m)
    let e = BinaryExpression.create(BinaryExprKind.Exp, x, y)
    e.overflow = ov
    bb.appendExpr(e)
    let ls = BinaryExpression.create(BinaryExprKind.LShift, x, y)
    ls.overflow = OverflowStrategy.NA
    bb.appendExpr(ls)
    let rs = BinaryExpression.create(BinaryExprKind.RShift, x, y)
    rs.overflow = ov
    bb.appendExpr(rs)
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.BitAnd, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.BitOr, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.BitXor, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.LT, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.GT, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.LE, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.GE, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.NotEqual, x, y))
    bb.appendExpr(BinaryExpression.create(BinaryExprKind.Or, Constant.create(BoolLiteral.get(false)).result, Constant.create(BoolLiteral.get(true)).result))
    println("more binary ok: ${bb.exprs.size == 13} ${bb.exprs[12].toString().contains("Or")} ${bb.exprs[7].toString().contains("LT")}")
}
