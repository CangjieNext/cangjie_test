/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// BinaryExpression：算术、位移、位运算、比较、逻辑（overflow 属性）

/* SCAN
binary kinds ok: true true true true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.bcm", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "bcm", "bcm", "pkg.bcm")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let x = Constant.create(IntLiteral.get(i32, 4u64)).result
    let y = Constant.create(IntLiteral.get(i32, 2u64)).result
    let ov = OverflowStrategy.Wrapping
    let e1 = BinaryExpression.create(BinaryExprKind.Add, x, y)
    e1.overflow = ov
    let e2 = BinaryExpression.create(BinaryExprKind.Sub, x, y)
    let e3 = BinaryExpression.create(BinaryExprKind.Mul, x, y)
    let e4 = BinaryExpression.create(BinaryExprKind.Div, x, y)
    e4.overflow = ov
    let e5 = BinaryExpression.create(BinaryExprKind.Equal, x, y)
    let e6 = BinaryExpression.create(BinaryExprKind.And, Constant.create(BoolLiteral.get(true)).result, Constant.create(BoolLiteral.get(false)).result)
    bb.appendExpr(e1)
    bb.appendExpr(e2)
    bb.appendExpr(e3)
    bb.appendExpr(e4)
    bb.appendExpr(e5)
    bb.appendExpr(e6)
    println(
        "binary kinds ok: ${e1.overflow == ov} ${e2.result.ty == i32} ${e5.result.ty == BoolType.get()} ${e6.result.ty == BoolType.get()} ${e1.toString().contains("Add")} ${e4.toString().contains("Div")}"
    )
}
