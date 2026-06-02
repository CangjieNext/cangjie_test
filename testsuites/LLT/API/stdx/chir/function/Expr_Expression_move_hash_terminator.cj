/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression：hashCode、isTerminator、moveAfter、hasExceptionBranch、dump

/* SCAN
const term: false try has exc: false
after move order: true
hash ok: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.emh", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "emh", "emh", "pkg.emh")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let e0 = Constant.create(UnitLiteral.get())
    let e1 = Constant.create(BoolLiteral.get(true))
    bb.appendExpr(e0)
    bb.appendExpr(e1)
    println("const term: ${e0.isTerminator()} try has exc: ${e0.hasExceptionBranch()}")
    e0.moveAfter(e1)
    println("after move order: ${bb.exprs[0] == e1 && bb.exprs[1] == e0}")
    println("hash ok: ${e1.hashCode() != 0}")
}
