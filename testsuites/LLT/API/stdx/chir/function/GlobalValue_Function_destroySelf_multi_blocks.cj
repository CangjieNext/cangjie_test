/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GlobalValue.destroySelf：多 block / 多 expr / 含 lambda，销毁后所持引用均为 invalid

/* SCAN
blocks before: 3
exprs before: 3 3 2
lambda blocks before: 2
fn body invalid after: true
fn invalid after: true
bb0 invalid: true
bb1 invalid: true
bb2 invalid: true
e0a invalid: true
e0b invalid: true
lam invalid: true
e1a invalid: true
e1b invalid: true
e1c invalid: true
e2a invalid: true
e2b invalid: true
lamBb0 invalid: true
lamBb1 invalid: true
le0 invalid: true
le1 invalid: true
le2 invalid: true
le3 invalid: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let pkgName = "pkg.fn.ds.multi"
    let pkg = Package(pkgName, AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), unit), "f_multi", "fMulti", pkgName)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb0 = bg.entryBlock
    let bb1 = bg.appendBlock()
    let bb2 = bg.appendBlock()

    // bb0: const, lambda, goto bb1
    let e0a = Constant.create(IntLiteral.get(i32, 1u64))
    let lam = Lambda.create(FuncType.get(Array<Type>(), unit), "Lam", "Lam", ArrayList<GenericType>())
    bb0.appendExpr(e0a)
    bb0.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lamBg = lam.body
    let lamBb0 = lamBg.entryBlock
    let lamBb1 = lamBg.appendBlock()
    let le0 = Constant.create(UnitLiteral.get())
    let le1 = GoTo.create(lamBb1)
    lamBb0.appendExpr(le0)
    lamBb0.appendExpr(le1)
    let le2 = Constant.create(BoolLiteral.get(true))
    let le3 = Exit.create()
    lamBb1.appendExpr(le2)
    lamBb1.appendExpr(le3)

    let e0b = GoTo.create(bb1)
    bb0.appendExpr(e0b)

    // bb1: two consts + goto bb2
    let e1a = Constant.create(IntLiteral.get(i32, 2u64))
    let e1b = Constant.create(IntLiteral.get(i32, 3u64))
    let e1c = GoTo.create(bb2)
    bb1.appendExpr(e1a)
    bb1.appendExpr(e1b)
    bb1.appendExpr(e1c)

    // bb2: const + exit
    let e2a = Constant.create(UnitLiteral.get())
    let e2b = Exit.create()
    bb2.appendExpr(e2a)
    bb2.appendExpr(e2b)

    println("blocks before: ${bg.blocks.size}")
    println("exprs before: ${bb0.exprs.size} ${bb1.exprs.size} ${bb2.exprs.size}")
    println("lambda blocks before: ${lamBg.blocks.size}")

    fn.destroySelf()
    println("fn body invalid after: ${fn.body.isNone()}")
    println("fn invalid after: ${!fn.isFunction()}")

    println("bb0 invalid: ${!bb0.isBlock()}")
    println("bb1 invalid: ${!bb1.isBlock()}")
    println("bb2 invalid: ${!bb2.isBlock()}")
    println("e0a invalid: ${e0a.toString().contains("Invalid")}")
    println("e0b invalid: ${e0b.toString().contains("Invalid")}")
    println("lam invalid: ${!lam.isLambda()}")
    println("e1a invalid: ${e1a.toString().contains("Invalid")}")
    println("e1b invalid: ${e1b.toString().contains("Invalid")}")
    println("e1c invalid: ${e1c.toString().contains("Invalid")}")
    println("e2a invalid: ${e2a.toString().contains("Invalid")}")
    println("e2b invalid: ${!e2b.isExit()}")
    println("lamBb0 invalid: ${!lamBb0.isBlock()}")
    println("lamBb1 invalid: ${!lamBb1.isBlock()}")
    println("le0 invalid: ${le0.toString().contains("Invalid")}")
    println("le1 invalid: ${le1.toString().contains("Invalid")}")
    println("le2 invalid: ${le2.toString().contains("Invalid")}")
    println("le3 invalid: ${!le3.isExit()}")
}
