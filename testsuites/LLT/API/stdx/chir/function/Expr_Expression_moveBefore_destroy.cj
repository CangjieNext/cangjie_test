/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression.moveBefore、destroySelf（销毁后者）

/* SCAN
moveBefore order: true
destroy empty: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.mb", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "mb", "mb", "pkg.mb")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let e0 = Constant.create(UnitLiteral.get())
    let e1 = Constant.create(BoolLiteral.get(false))
    bb.appendExpr(e0)
    bb.appendExpr(e1)
    e1.moveBefore(e0)
    println("moveBefore order: ${bb.exprs[0] == e1 && bb.exprs[1] == e0}")
    e1.destroySelf()
    println("destroy empty: ${bb.exprs.size == 1}")
}
