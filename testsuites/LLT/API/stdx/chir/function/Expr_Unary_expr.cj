/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// UnaryExpression：Neg / Not / BitNot 与 overflow 属性

/* SCAN
unary ret: true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.un", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "un", "un", "pkg.un")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let xi = Constant.create(IntLiteral.get(i32, 3u64)).result
    let xb = Constant.create(BoolLiteral.get(true)).result
    let n = UnaryExpression.create(UnaryExprKind.Neg, xi)
    n.overflow = OverflowStrategy.Saturating
    let nt = UnaryExpression.create(UnaryExprKind.Not, xb)
    let nb = UnaryExpression.create(UnaryExprKind.BitNot, xi)
    bb.appendExpr(n)
    bb.appendExpr(nt)
    bb.appendExpr(nb)
    println("unary ret: ${n.result.ty == i32} ${nt.result.ty == BoolType.get()} ${nb.result.ty == i32}")
}
