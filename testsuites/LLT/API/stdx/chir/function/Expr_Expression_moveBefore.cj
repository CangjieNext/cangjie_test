/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression.moveBefore 正向与负向用例

/* SCAN
moveBefore reorder: true
moveBefore self noop: true
moveBefore terminator throws: true
*/

import std.collection.*
import stdx.chir.*

main() {
    // 正向：e1 移到 e0 前面，顺序变为 [e1, e0]
    let pkg = Package("pkg.mb", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "mb", "mb", "pkg.mb")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let e0 = Constant.create(BoolLiteral.get(false))
    let e1 = Constant.create(UnitLiteral.get())
    bb.appendExpr(e0)
    bb.appendExpr(e1)
    e1.moveBefore(e0)
    println("moveBefore reorder: ${bb.exprs[0] == e1 && bb.exprs[1] == e0}")

    // 正向：this == other 时无操作，顺序不变
    let sizeBefore = bb.exprs.size
    e1.moveBefore(e1)
    println("moveBefore self noop: ${bb.exprs.size == sizeBefore && bb.exprs[0] == e1}")

    // 负向：terminator 不能调用 moveBefore，抛出 Exception
    let pkg2 = Package("pkg.mb2", AccessLevel.Public)
    let fn2 = pkg2.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "mb2", "mb2", "pkg.mb2")
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let bb2 = bg2.entryBlock
    let target = bg2.appendBlock()
    let gt = GoTo.create(target)
    let e2 = Constant.create(UnitLiteral.get())
    bb2.appendExpr(e2)
    bb2.appendExpr(gt)
    var threw = false
    try {
        gt.moveBefore(e2)
    } catch (_: Exception) {
        threw = true
    }
    println("moveBefore terminator throws: ${threw}")
}
