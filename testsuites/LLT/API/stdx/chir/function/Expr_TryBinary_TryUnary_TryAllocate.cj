/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// TryBinaryExpression、TryUnaryExpression、TryAllocate 分支属性

/* SCAN
try bin branches: true
try unary branches: true
try alloc branches: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.try1", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "try1", "try1", "pkg.try1")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let bn = bg.appendBlock()
    let be = bg.appendBlock()
    let x = Constant.create(IntLiteral.get(i32, 1u64)).result
    let y = Constant.create(IntLiteral.get(i32, 2u64)).result
    let tb = TryBinaryExpression.create(BinaryExprKind.Add, x, y, bn, be)
    bb.appendExpr(tb)
    println("try bin branches: ${tb.normalBranch == bn && tb.errorBranch == be}")

    let bn2 = bg.appendBlock()
    let be2 = bg.appendBlock()
    let tu = TryUnaryExpression.create(x, bn2, be2)
    bb.appendExpr(tu)
    println("try unary branches: ${tu.normalBranch == bn2 && tu.errorBranch == be2}")

    let bn3 = bg.appendBlock()
    let be3 = bg.appendBlock()
    let ta = TryAllocate.create(i32, bn3, be3)
    bb.appendExpr(ta)
    println("try alloc branches: ${ta.normalBranch == bn3 && ta.errorBranch == be3}")
}
