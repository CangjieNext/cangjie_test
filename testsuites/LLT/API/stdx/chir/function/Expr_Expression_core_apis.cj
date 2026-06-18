/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression：dump、isLambda、isExit、replaceOperand、tryGetResult、blockGroups、topLevelFunc

/* SCAN
exit isExit: true
lambda isLambda: true
tryGetResult some: true
blockGroups len: 1
topLevelFunc id: @fn
replaceOperand ok: true
dump has Add: true
Exit()
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ecore", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get([i32], i32), "fn", "fn", "pkg.ecore")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let c0 = Constant.create(IntLiteral.get(i32, 1u64))
    let c1 = Constant.create(IntLiteral.get(i32, 2u64))
    bb.appendExpr(c0)
    bb.appendExpr(c1)

    let ex = Exit.create()
    bb.appendExpr(ex)
    println("exit isExit: ${ex.isExit()}")

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.insertExpr(lam, 2)
    lam.initParameters()
    lam.initBody()
    let lamAlloc = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())
    println("lambda isLambda: ${lam.isLambda()}")
    println("tryGetResult some: ${lam.tryGetResult().isSome()}")
    println("blockGroups len: ${lam.blockGroups.size}")
    println("topLevelFunc id: ${lam.topLevelFunc.identifier}")

    let oldArg = c0.result
    let newArg = c1.result
    let add = BinaryExpression.create(BinaryExprKind.Add, oldArg, newArg)
    bb.insertExpr(add, 1)
    add.replaceOperand(oldArg, newArg)
    println("replaceOperand ok: ${add.operands[0] == newArg && add.operands[1] == newArg}")
    println("dump has Add: ${add.toString().contains("Add")}")
    ex.dump()
}
