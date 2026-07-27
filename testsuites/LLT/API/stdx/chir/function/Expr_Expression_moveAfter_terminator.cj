/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression.moveAfter：移动 terminator（更新 successors predecessors）

/* SCAN
moveAfter terminator: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.mat", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "gt", "gt", "pkg.mat")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let target = bg.appendBlock()
    let c = Constant.create(UnitLiteral.get())
    bg.entryBlock.appendExpr(c)
    let gt = GoTo.create(target)
    bg.entryBlock.appendExpr(gt)
    gt.moveAfter(c)
    println("moveAfter terminator: ${bg.entryBlock.exprs[0] == c && bg.entryBlock.exprs[1] == gt}")
    target.appendExpr(Exit.create())
}
